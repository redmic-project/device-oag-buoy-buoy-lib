# -*- coding: utf-8 -*-

import unittest
import json

from datetime import datetime, timezone
from nose.tools import eq_, ok_
from unittest.mock import patch, MagicMock, call

from buoy.lib.notification.client import DataDeviceNamespaceClient, NoticeQueue
from buoy.lib.notification.common import NoticeData
from buoy.lib.protocol.nmea0183 import WIMDA
from buoy.lib.device.database import DeviceDB
from buoy.lib.protocol.item import DataEncoder


def get_items(num=1):
    items = []
    for i in range(0, num):
        data = {
            'id': i,
            'datetime': datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.%f%z"),
            'air_temperature': '26.8',
            'barometric_pressure_inch': '30.3273',
            'barometric_pressure_bar': '1.027',
            'water_temperature': '20.1',
            'relative_humidity': '12.3',
            'absolute_humidity': '21.0',
            'dew_point': '2.3',
            'wind_direction_true': '2.0',
            'wind_direction_magnetic': '128.7',
            'wind_speed_knots': '134.6',
            'wind_speed_meters': '0.3'
        }

        items.append(WIMDA(**data))

    return items


class FakeDeviceDB(DeviceDB):
    def __init__(self):
        pass


class FakeIO(object):
    def __init__(self):
        self._url = 'http://redmic.es'
        self.queue_notice = NoticeQueue()
        self.db = FakeDeviceDB()
        self.cls = WIMDA
        self.device_id = "PB200"


class TestDataDeviceNamespaceClient(unittest.TestCase):

    def setUp(self):
        io = FakeIO()
        self.device_id = "PB200"
        self.namespace = DataDeviceNamespaceClient(io, '/data')
        self.namespace.device_id = self.device_id

    @patch('buoy.lib.notification.client.DataDeviceNamespaceClient.emit')
    def test_should_EmitEventAddDevice_when_connectToServer(self, mock_emit):
        self.namespace.on_connect()

        eq_(mock_emit.call_count, 1)
        mock_emit.assert_called_once_with("add_device", self.device_id)

    @patch('buoy.lib.notification.client.DataDeviceNamespaceClient.send_data')
    def test_should_callSendDatawAndSenderUpTrue_when_callSendStatusWithValueTrue(self, mock):
        self.namespace.on_sender_status(True)

        eq_(mock.call_count, 1)
        ok_(self.namespace._sender_up)

    @patch('buoy.lib.notification.client.DataDeviceNamespaceClient.send_data')
    def test_should_notCallSendDatawhen_callSendStatusWithValueTrueAndPropertySenderBusyIsTrue(self, mock):
        self.namespace._sender_busy = True
        self.namespace.on_sender_status(True)

        eq_(mock.call_count, 0)
        ok_(self.namespace._sender_up)

    @patch('buoy.lib.notification.client.DataDeviceNamespaceClient.send_data')
    def test_should_notCallSendDataAndSenderBusyFalse_when_callSendStatusWithFalseAndSenderBusyIsTrue(self, mock):
        self.namespace._sender_busy = True
        self.namespace.on_sender_status(False)

        eq_(mock.call_count, 0)
        ok_(not self.namespace._sender_up)
        ok_(not self.namespace._sender_busy)

    def test_should_return15itemsAndNotCallQueueGet_when_thereIsDataInDb(self):
        self.namespace.queue_data.get = MagicMock(side_effect=[])
        self.namespace._db.get_items_to_send = MagicMock(return_value=get_items(15))

        items = self.namespace.waiting_data()

        eq_(len(items), 15)
        eq_(self.namespace.queue_data.get.call_count, 0)

    def test_should_returnOneItem_when_thereIsNotDataInDb(self):
        self.namespace._db.get_items_to_send = MagicMock(return_value=[])

        item_expected = get_items()

        self.namespace.queue_data.put_nowait(NoticeData(data=item_expected))
        items = self.namespace.waiting_data()

        eq_(len(items), 1)
        eq_(self.namespace._db.get_items_to_send.call_count, 1)

    @patch('buoy.lib.notification.client.DataDeviceNamespaceClient.update_status', return_value=None)
    def test_should_callTwiceUpdataStatus_when_itemsOkAndItemsErrorHasElements(self, mock):
        response = {
            'items_ok': get_items(1),
            'items_fail': get_items(5)
        }
        json_to_send = json.dumps(response, sort_keys=True, cls=DataEncoder)

        self.namespace.on_sended_data(json_to_send)

        eq_(mock.call_count, 2)
        ok_(not self.namespace._sender_busy)

    @patch('buoy.lib.notification.client.DataDeviceNamespaceClient.update_status', return_value=None)
    def test_should_callTwiceUpdataStatus_when_itemsOkAndItemsErrorHasElements(self, mock):
        response = {
            'items_ok': get_items(1),
            'items_fail': None
        }
        json_to_send = json.dumps(response, sort_keys=True, cls=DataEncoder)

        self.namespace.on_sended_data(json_to_send)

        eq_(mock.call_count, 2)
        ok_(not self.namespace._sender_busy)

    def test_should_updateStatusItemInDB_when_itemsOK(self):
        self.namespace._db.update_status = MagicMock(return_value=[])

        items = get_items(4)
        self.namespace.update_status(items)

        eq_(self.namespace._db.update_status.call_count, 1)
        ok_(self.namespace._db.update_status.call_args_list == [call([0, 1, 2, 3], True)])

    def test_should_updateStatusItemInDB_when_itemsError(self):

        self.namespace._db.update_status = MagicMock(return_value=[])

        items = get_items(4)
        self.namespace.update_status(items, False)

        eq_(self.namespace._db.update_status.call_count, 1)
        ok_(self.namespace._db.update_status.call_args_list == [call([0, 1, 2, 3], False)])

    @patch('buoy.lib.notification.client.DataDeviceNamespaceClient.waiting_data')
    @patch('buoy.lib.notification.client.DataDeviceNamespaceClient.emit')
    def test_should_EmitEventNewData_when_sendDataIsCalled(self, mock_emit, mock_waiting_data):
        items = get_items()
        json_to_send = json.dumps(items, sort_keys=True, cls=DataEncoder)

        mock_waiting_data.return_value = items
        self.namespace.send_data()

        eq_(mock_emit.call_count, 1)
        ok_(self.namespace.sender_busy)
        mock_emit.assert_called_once_with("new_data", json_to_send)

