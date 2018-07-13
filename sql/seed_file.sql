INSERT INTO users VALUES
(1, 'Test', 'User', 'password', 'email@gmail.com', 'TestUser1', '2018-07-13'),
(2, 'Other', 'User', 'password', 'email1@gmail.com', 'TestUser2', '2018-07-13');

INSERT INTO car_types VALUES
(1, 'Mazda', 'MX-5',   '2008-01-01'),
(2, 'Mazda', 'Tribute', '2008-01-01'),
(3, 'Mazda', 'B-Series', '2008-01-01'),
(4, 'Mazda', 'CX-7', '2008-01-01'),
(5, 'Mazda', 'Mazdaspeed 3', '2008-01-01'),
(6, 'Mazda', 'Mazda3', '2008-01-01'),
(7, 'Mazda', 'Mazda5', '2008-01-01'),
(8, 'Mazda', 'Mazda6', '2008-01-01'),
(9, 'Mazda', 'RX-8', '2008-01-01'),
(10, 'Mazda', 'CX-9', '2008-01-01'),
(11, 'Chevrolet', 'Malibu', '2010-01-01'),
(12, 'Chevrolet', 'Camaro', '2010-01-01'),
(13, 'Chevrolet', 'Cobalt', '2010-01-01'),
(14, 'Chevrolet', 'Express 1500', '2010-01-01'),
(15, 'Chevrolet', 'Express 2500', '2010-01-01'),
(16, 'Chevrolet', 'Express 3500', '2010-01-01'),
(17, 'Subaru', 'Forester', '2010-01-01');

INSERT INTO cars VALUES
(1, 1, 'Mazda', 'Mazda3', '2008-01-01', 30000, 30000, '2018-07-13', 6),
(2, 1, 'Chevrolet', 'Express 1500', '2010-01-01', 140000, 140000, '2018-07-13', 14),
(3, 2, 'Subaru', 'Forester', '2010-01-01', 4500, 4500, '2018-07-13', 17);

INSERT INTO fillups VALUES
(1, '2018-07-13', 11.1, 365.2, 1, 33.08, 1),
(2, '2018-07-13', 25.7, 512, 1, 75.22, 2),
(3, '2018-07-13', 22, 433.3, 2, 73.83, 3),
(4, '2018-08-01', 16, 270.7, 1, 57.15, 2),
(5, '2018-08-01', 18, 370, 2, 67.12, 3),
(6, '2018-08-14', 10, 347.4, 1, 30.15, 1),
(7, '2018-08-14', 19.71, 397.81, 1, 63.17, 3);

UPDATE cars SET current_milage = (current_milage + (SELECT sum(miles_driven) FROM fillups WHERE fillups.car_id = cars.car_id GROUP BY car_id));

INSERT INTO maintenance_types VALUES
(1, 'Oil Change'),
(2, 'Break Pads Replacement'),
(3, 'Break Fluid Change'),
(4, 'Tire Rotation'),
(5, 'Tune-up'),
(6, 'Fill Tires w/ Air');

INSERT INTO maintenance_schedules VALUES
(1, 6, 36, 30000, 5),
(2, 6, 72, 60000, 5);

INSERT INTO maintenance_events VALUES
(1, '2018-07-19', 1, 5, 127.86),
(2, '2018-08-01', 3, 4, 29.97),
(3, '2018-08-27', 3, 1, 24.33);
