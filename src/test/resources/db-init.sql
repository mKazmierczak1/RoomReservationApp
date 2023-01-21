DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS room_reservation;
DROP TABLE IF EXISTS room_types;
DROP TABLE IF EXISTS hotels;
DROP TABLE IF EXISTS admins;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS employee_changes;
DROP TABLE IF EXISTS reservation_operations;

CREATE TABLE clients (id int NOT NULL AUTO_INCREMENT, email varchar(50) NOT NULL, fist_name varchar(50) NOT NULL, last_name varchar(50) NOT NULL, password varchar(50) NOT NULL, phone_number varchar(50) NOT NULL, PRIMARY KEY (id));
CREATE TABLE reservations (id int NOT NULL AUTO_INCREMENT, user_id int NOT NULL, `start` timestamp NOT NULL, `end` timestamp NOT NULL, status int NOT NULL, comments varchar(255), PRIMARY KEY (id));
CREATE TABLE rooms (id int NOT NULL AUTO_INCREMENT, room_type_id int NOT NULL, hotel_id int NOT NULL, max_people_number int NOT NULL, daily_price double NOT NULL, description varchar(255), PRIMARY KEY (id));
CREATE TABLE room_reservation (room_id int NOT NULL, reservation_id int NOT NULL, PRIMARY KEY (room_id, reservation_id));
CREATE TABLE room_types (id int NOT NULL AUTO_INCREMENT, type_name varchar(30) NOT NULL, PRIMARY KEY (id));
CREATE TABLE hotels (id int NOT NULL AUTO_INCREMENT, name varchar(30) NOT NULL, address varchar(255) NOT NULL, PRIMARY KEY (id));
CREATE TABLE admins (id int NOT NULL AUTO_INCREMENT, password int NOT NULL, hotel_id int NOT NULL, PRIMARY KEY (id));
CREATE TABLE employees (id int NOT NULL AUTO_INCREMENT, password varchar(255) NOT NULL, active int NOT NULL, hotel_id int NOT NULL, PRIMARY KEY (id));
CREATE TABLE employee_changes (id int NOT NULL AUTO_INCREMENT, description varchar(255) NOT NULL, `date` timestamp NOT NULL, admin_id int NOT NULL, employee_id int NOT NULL, PRIMARY KEY (id));
CREATE TABLE reservation_operations (id int NOT NULL AUTO_INCREMENT, description varchar(50) NOT NULL, `date` timestamp NOT NULL, employee_id int NOT NULL, reservation_id int NOT NULL, PRIMARY KEY (id));

ALTER TABLE reservations ADD CONSTRAINT FKreservatio437336 FOREIGN KEY (user_id) REFERENCES clients (id);
ALTER TABLE room_reservation ADD CONSTRAINT FKroom_reser744113 FOREIGN KEY (reservation_id) REFERENCES reservations (id);
ALTER TABLE room_reservation ADD CONSTRAINT FKroom_reser948785 FOREIGN KEY (room_id) REFERENCES rooms (id);
ALTER TABLE rooms ADD CONSTRAINT FKrooms857043 FOREIGN KEY (hotel_id) REFERENCES hotels (id);
ALTER TABLE admins ADD CONSTRAINT FKadmins178756 FOREIGN KEY (hotel_id) REFERENCES hotels (id);
ALTER TABLE rooms ADD CONSTRAINT FKrooms912994 FOREIGN KEY (room_type_id) REFERENCES room_types (id);
ALTER TABLE employees ADD CONSTRAINT FKemployees266906 FOREIGN KEY (hotel_id) REFERENCES hotels (id);
ALTER TABLE employee_changes ADD CONSTRAINT FKemployee_c318475 FOREIGN KEY (admin_id) REFERENCES admins (id);
ALTER TABLE employee_changes ADD CONSTRAINT FKemployee_c358409 FOREIGN KEY (employee_id) REFERENCES employees (id);
ALTER TABLE reservation_operations ADD CONSTRAINT FKreservatio360105 FOREIGN KEY (employee_id) REFERENCES employees (id);
ALTER TABLE reservation_operations ADD CONSTRAINT FKreservatio733475 FOREIGN KEY (reservation_id) REFERENCES reservations (id);

INSERT INTO hotels VALUES (1, 'city', 'addres');
INSERT INTO room_types VALUES (1, 'Regular');
INSERT INTO rooms VALUES (1, 1, 1, 1, 100.0, 'Regular single room');