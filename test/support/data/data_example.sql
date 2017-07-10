INSERT INTO acmplus (id, datetime, vx, vy, speed, direction, water_temperature, sended, num_attempts) VALUES
    (1, '2017-01-23 13:43:48', 19.57, 69.24, 71.9525016938258, 15.7824191508417, 24.1, false, 0),
    (2, '2017-01-23 13:45:39', 20.04, 68.62, 71.4864043017971, 16.2800817097405, 24.11, true, 0),
    (3, '2017-01-23 13:46:39', 20.18, 68.7, 71.6025306815339, 16.3696710544201, 24.11, true, 0),
    (4, '2017-01-23 13:47:39', 20.18, 68.57, 71.4778098433353, 16.3990399460541, 24.12, false, 0),
    (5, '2017-01-23 13:49:21', 20.42, 68.46, 71.4405207147876, 16.6085985854556, 24.12, true, 0),
    (19, '2017-01-23 14:03:21', 19.48, 68.57, 71.2833451796421, 15.859278405275, 24.13, false, 3),
    (20, '2017-01-23 14:04:21', 19.62, 68.28, 71.0429644651742, 16.0318047836342, 24.14, false, 0),
    (6, '2017-01-23 13:50:21', 20.55, 68.63, 71.6406267420938, 16.6693687717502, 24.13, false, 3),
    (7, '2017-01-23 13:51:21', 20.25, 68.86, 71.7757765544895, 16.3872879112446, 24.13, false, 0),
    (8, '2017-01-23 13:52:21', 19.79, 68.81, 71.5993030692339, 16.045422963535, 24.13, false, 2),
    (11, '2017-01-23 13:55:21', 20.99, 68.43, 71.5768468151539, 17.0527044195056, 24.1, false, 0),
    (9, '2017-01-23 13:53:21', 20.17, 68.76, 71.6572850448578, 16.3484784484724, 24.13, false, 0),
    (10, '2017-01-23 13:54:21', 21.16, 68.36, 71.560011179429, 17.199269664278, 24.13, false, 0),
    (12, '2017-01-23 13:56:21', 20.46, 68.78, 71.7586231751976, 16.5661727730682, 24.14, false, 1),
    (13, '2017-01-23 13:57:21', 20.77, 68.17, 71.26388847095, 16.9449027824871, 24.13, false, 0),
    (14, '2017-01-23 13:58:21', 20.34, 68.42, 71.3793527569423, 16.5562395795287, 24.12, false, 0),
    (15, '2017-01-23 13:59:21', 20.89, 68.14, 71.2702722037737, 17.0442144525599, 24.12, false, 0),
    (16, '2017-01-23 14:00:21', 19.93, 68.61, 71.4460425775984, 16.1976530045569, 24.13, false, 0),
    (18, '2017-01-23 14:02:21', 19.55, 68.39, 71.1294214794413, 15.9531411156487, 24.13, false, 0),
    (17, '2017-01-23 14:01:21', 19.57, 68.46, 71.2022225776696, 15.9531331965119, 24.13, true, 0),
    (21, '2017-01-23 14:05:21', 19.86, 68.53, 71.3497056756368, 16.1615928761929, 24.14, false, 0);

INSERT INTO pb200 (id, datetime, barometric_pressure_inch, barometric_pressure_bar, air_temperature,
        water_temperature, relative_humidity, absolute_humidity, dew_point, wind_direction_true,
        wind_direction_magnetic, wind_speed_knots, wind_speed_meters, sended, num_attempts) VALUES
    (1, '2017-02-17 07:00:01.667227', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (2, '2017-02-17 07:01:02.667227', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (4, '2017-02-17 07:01:04.099031', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, true, 0),
    (6, '2017-02-17 07:01:06.917736', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (7, '2017-02-17 07:01:07.917736', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (3, '2017-02-17 07:01:03.099031', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (8, '2017-02-17 07:01:08.95734', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3,  false, 3),
    (9, '2017-02-17 07:01:09.000676', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, true, 0),
    (10, '2017-02-17 07:01:10.95734', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, true, 0),
    (11, '2017-02-17 07:01:11.95734', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (12, '2017-02-17 07:01:12.95734', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (5, '2017-02-17 07:01:05.657981', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (13, '2017-02-17 07:01:13.000676', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 3),
    (17, '2017-02-17 07:01:17.657981', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false , 0),
    (14, '2017-02-17 07:01:14.000676', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (15, '2017-02-17 07:01:15.000676', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (16, '2017-02-17 07:01:16.000676', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (18, '2017-02-17 07:01:18.95734', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (19, '2017-02-17 07:01:19.657981', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 3),
    (20, '2017-02-17 07:01:20.657981', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0),
    (21, '2017-02-17 07:01:21.657981', 30.3273, 1.027, 26.8, 20.1, 12.3, 21, 2.3, 2, 128.7, 134.6, 0.3, false, 0);
    

INSERT INTO notification (id, datetime, level, phone, message, sended, type, num_attempts) VALUES
    (351, '2017-06-22 11:12:44.464156+01', 1, null, 'Device no detected', FALSE, 1, 0),
    (350, '2017-06-22 11:12:44.44309+01', 3, null, 'Start service current-meter', FALSE, 1, 0),
    (352, '2017-06-22 11:12:44.466089+01', 3, null, 'Error in service current-meter', FALSE, 1, 0),
    (353, '2017-06-22 11:12:44.474028+01', 3, null, 'Stop service current-meter', FALSE, 1, 0),
    (355, '2017-06-22 13:05:27.062325+01', 1, '0310', 'Device no detected', FALSE, 1, 0),
    (354, '2017-06-22 13:05:27.060234+01', 3, null, 'Start service current-meter', FALSE, 1, 0),
    (356, '2017-06-22 13:05:27.062617+01', 3, null, 'Error in service current-meter', FALSE, 1, 0),
    (357, '2017-06-22 13:05:27.062838+01', 3, '+34366004157', 'Stop service current-meter', FALSE, 1, 0),
    (359, '2017-06-22 13:08:27.037241+01', 1, null, 'Device no detected', FALSE, 1, 0),
    (358, '2017-06-22 13:08:27.035533+01', 3, null, 'Start service current-meter', FALSE, 1, 0),
    (360, '2017-06-22 13:08:27.037602+01', 3, null, 'Error in service current-meter', FALSE, 1, 0),
    (361, '2017-06-22 13:08:27.037863+01', 3, null, 'Stop service current-meter', FALSE, 1, 0),
    (362, '2017-06-22 13:10:50.953806+01', 1, null, 'Device no detected', FALSE, 1, 0),
    (363, '2017-06-22 13:10:50.951756+01', 3, null, 'Start service current-meter', FALSE, 1, 0),
    (364, '2017-06-22 13:10:50.954155+01', 3, null, 'Error in service current-meter', FALSE, 1, 0);