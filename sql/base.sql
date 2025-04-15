
CREATE TABLE Accomodation
(
  accom_id       INTEGER       NOT NULL AUTO_INCREMENT,
  accom_name     VARCHAR(50)   NOT NULL,
  accom_category VARCHAR(50)   NOT NULL,
  limit_rooms    INTEGER       NOT NULL,
  accom_price    DECIMAL(5, 2) NOT NULL,
  PRIMARY KEY (accom_id)
);

CREATE TABLE Client
(
  cl_id        INTEGER      NOT NULL AUTO_INCREMENT,
  cl_firstname VARCHAR(50)  NOT NULL,
  cl_lastname  VARCHAR(50)  NOT NULL,
  cl_dob       DATE         NOT NULL,
  cl_adress    VARCHAR(100) NOT NULL,
  PRIMARY KEY (cl_id)
);

CREATE TABLE Company
(
  comp_id        INTEGER     NOT NULL AUTO_INCREMENT,
  comp_name      VARCHAR(80) NOT NULL,
  transport_mode INTEGER     NOT NULL,
  PRIMARY KEY (comp_id)
);

CREATE TABLE Contact
(
  cont_id          INTEGER      NOT NULL AUTO_INCREMENT,
  cont_firstname   VARCHAR(30)  NOT NULL,
  contact_lastname VARCHAR(30)  NOT NULL,
  contact_num      VARCHAR(20)  NOT NULL,
  contact_mail     VARCHAR(60)  NOT NULL,
  contact_adress   VARCHAR(150) NOT NULL,
  PRIMARY KEY (cont_id)
);

CREATE TABLE Destination
(
  destination_id INTEGER     NOT NULL AUTO_INCREMENT,
  country        VARCHAR(50) NOT NULL,
  city           VARCHAR(50) NOT NULL,
  accomodation   INTEGER     NOT NULL,
  PRIMARY KEY (destination_id)
);

CREATE TABLE Payment
(
  pay_id      INTEGER     NOT NULL AUTO_INCREMENT,
  pay_type    VARCHAR(50) NULL     DEFAULT NULL,
  pay_status  BOOLEAN     NOT NULL DEFAULT FALSE,
  pay_date    DATE        NULL     DEFAULT NULL,
  total_price FLOAT       NOT NULL,
  PRIMARY KEY (pay_id)
);

CREATE TABLE Reservation
(
  res_id   INTEGER NOT NULL AUTO_INCREMENT,
  res_date DATE    NOT NULL,
  travel   INTEGER NOT NULL,
  client   INTEGER NOT NULL,
  payment  INTEGER NOT NULL,
  res_status ENUM('paid', 'unpaid', 'stand-by') NOT NULL DEFAULT 'stand-by',
  PRIMARY KEY (res_id)
);

CREATE TABLE TravelAgency
(
  travel_id    INTEGER       NOT NULL AUTO_INCREMENT,
  contact      INTEGER       NOT NULL,
  destination  INTEGER       NOT NULL,
  transport    INTEGER       NOT NULL,
  agency_price DECIMAL(5, 2) NOT NULL,
  PRIMARY KEY (travel_id)
);

CREATE TABLE Vehicle
(
  veh_id          INTEGER       NOT NULL AUTO_INCREMENT,
  veh_type        VARCHAR(50)   NOT NULL,
  veh_name        VARCHAR(50)   NOT NULL,
  limit_seats     INTEGER       NOT NULL,
  transport_price DECIMAL(5, 2) NOT NULL,
  PRIMARY KEY (veh_id)
);

ALTER TABLE Reservation
  ADD CONSTRAINT FK_TravelAgency_TO_Reservation
    FOREIGN KEY (travel)
    REFERENCES TravelAgency (travel_id);

ALTER TABLE Reservation
  ADD CONSTRAINT FK_Client_TO_Reservation
    FOREIGN KEY (client)
    REFERENCES Client (cl_id);

ALTER TABLE Reservation
  ADD CONSTRAINT FK_Payment_TO_Reservation
    FOREIGN KEY (payment)
    REFERENCES Payment (pay_id);

ALTER TABLE TravelAgency
  ADD CONSTRAINT FK_Contact_TO_TravelAgency
    FOREIGN KEY (contact)
    REFERENCES Contact (cont_id);

ALTER TABLE TravelAgency
  ADD CONSTRAINT FK_Company_TO_TravelAgency
    FOREIGN KEY (transport)
    REFERENCES Company (comp_id);

ALTER TABLE TravelAgency
  ADD CONSTRAINT FK_Destination_TO_TravelAgency
    FOREIGN KEY (destination)
    REFERENCES Destination (destination_id);

ALTER TABLE Company
  ADD CONSTRAINT FK_Vehicle_TO_Company
    FOREIGN KEY (transport_mode)
    REFERENCES Vehicle (veh_id);

ALTER TABLE Destination
  ADD CONSTRAINT FK_Accomodation_TO_Destination
    FOREIGN KEY (accomodation)
    REFERENCES Accomodation (accom_id);
