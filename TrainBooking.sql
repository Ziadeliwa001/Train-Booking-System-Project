CREATE DATABASE TrainBooking;
USE TrainBooking;

CREATE TABLE Admin (
  Admin_ID int PRIMARY KEY,
  Email varchar(100) UNIQUE,
  Password varchar(100) NOT NULL,
  Fname varchar(10),
  Lname varchar(10)
);

CREATE TABLE Booking (
  Customer_ID int ,
  Ticket_number int UNIQUE,
  Seat_number int UNIQUE,
  Trip_id int ,
  CONSTRAINT TRIP0ID FOREIGN KEY (Trip_id) REFERENCES Trip (Trip_id),
  CONSTRAINT FKBook2 FOREIGN KEY (Customer_ID) REFERENCES Customer (Cust_ID)
);

CREATE TABLE Customer (
  Cust_ID int PRIMARY KEY,
  Email varchar(100) UNIQUE,
  Password varchar(100) NOT NULL,
  Fname varchar(10),
  Lname varchar(10),
  Phone_number varchar(11)
);
CREATE TABLE Route (
  Arrival_time VARCHAR(250),
  Depature_time VARCHAR(250),
  Stop_no int,
  Trip_id int ,
  CONSTRAINT TRIPID FOREIGN KEY (Trip_id) REFERENCES Trip (Trip_id),
);
CREATE TABLE Train (
  Train_id int PRIMARY KEY,
  Train_name varchar(20) NOT NULL,
  Train_type varchar(20) NOT NULL,
  Train_Available TINYINT DEFAULT 1,
  AdminAdmin_ID int,
  CONSTRAINT FKTrain FOREIGN KEY (AdminAdmin_ID) REFERENCES Admin (Admin_ID)
);

CREATE TABLE Trip (
  Trip_id int,
  Trip_date DATE,
  Available_Seats int,
  Trip_Available TINYINT DEFAULT 1,
  Trip_price float,
  Destination varchar(250),
  Arrival_time VARCHAR(250),
  Departure_time VARCHAR(250),
  Source varchar(250),
  AdminAdmin_ID int NOT NULL,
  TrainTrain_id int NOT NULL,
  PRIMARY KEY (Trip_id),
  CONSTRAINT FKTripTrain FOREIGN KEY (TrainTrain_id) REFERENCES Train (Train_id),
  CONSTRAINT FKTrip FOREIGN KEY (AdminAdmin_ID) REFERENCES Admin (Admin_ID)
);