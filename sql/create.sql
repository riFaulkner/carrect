CREATE TABLE users (
  user_id         int PRIMARY KEY,
  first_name      varchar(35),
  last_name       varchar(35),
  password_digest varchar(35),
  email           varchar(35),
  user_name       varchar(35),
  date_joined     date
);

CREATE TABLE car_types (
  car_type_id int PRIMARY KEY,
  make        varchar(35),
  model       varchar(35),
  year        date
);

CREATE TABLE cars (
  car_id         int PRIMARY KEY,
  user_id        int references users(user_id),
  make           varchar(35),
  model          varchar(35),
  year           date,
  start_milage   float(2),
  current_milage float(2),
  date_added     date,
  car_type_id    int references car_types(car_type_id)
);

CREATE TABLE fillups (
  fillup_id      int PRIMARY KEY,
  date_of_fillup date,
  gallons_filled float(2),
  miles_driven   float(2),
  fuel_tier      int,
  cost           float(2),
  car_id         int references cars(car_id)
);

CREATE TABLE maintenance_types (
  maintenance_type_id int PRIMARY KEY,
  description         varchar(70)
);

CREATE TABLE maintenance_schedules (
  maintenance_schedule_id int PRIMARY KEY,
  car_type_id             int references car_types(car_type_id),
  months                  int,
  mileage                 int,
  maintenance_type_id     int references maintenance_types(maintenance_type_id)
);

CREATE TABLE maintenance_events (
  maintenance_event_id int PRIMARY KEY,
  date_of_maintenance  date,
  car_id               int references cars(car_id),
  maintenance_type_id  int references maintenance_types(maintenance_type_id),
  cost                 float(2)
);
