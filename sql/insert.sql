INSERT INTO Client
  (cl_firstname, cl_lastname, cl_dob, cl_adress)
VALUES
  ('Mike', 'Johnson', '1972-04-14', '1234, Elm Street Apt 56, Los Angeles, CA 90001, USA'),
  ('Tim', 'Simons', '1972-04-14', '5678, Oak Avenue, Miami, FL 33101, USA'),
  ('Tyler', 'Stones', '1972-04-14', '9101, Maple Drive, Chicago, IL 60601, USA'),
  ('Sue', 'Decker', '1972-04-14', '3456, Pine Road, New York, NY 10001, USA'),
  ('Jina', 'Lester', '1972-04-14', '7890, Birch Boulevard Suite 300, Houston, TX 77001, USA')
;

INSERT INTO Accomodation
  (accom_name, accom_category, limit_rooms, accom_price)
VALUES
    ('Sunset Valley Inn', 'Hotel', '25', '980.00'),
    ('Lakeside Campground', 'Camping', '40', '420.00'),
    ('Château de Provence', 'Guest House', '10', '920.00'),
    ('La Forêt Lodge', 'Chalet', '6', '890.00'),
    ('Tokyo Garden Ryokan', 'Traditional Inn', '15', '945.00'),
    ('Mount Fuji Base Camp', 'Camping', '30', '480.00'),
    ('Rio Sol Hotel', 'Hotel', '20', '960.00'),
    ('Amazonia Nature Retreat', 'Guest House', '8', '720.00'),
    ('Maple Leaf Chalet', 'Chalet', '5', '910.00'),
    ('Northern Lights Camp', 'Camping', '25', '500.00')
;


INSERT INTO Destination
  (country, city, accomodation)
VALUES
  ('USA', 'New York', '1'),
  ('USA', 'Los Angeles', '2'),
  ('France', 'Paris', '3'),
  ('France', 'Marseille', '4'),
  ('Japan', 'Osaka', '5'),
  ('Japan', 'Kyoto', '6'),
  ('Brasil', 'Sao Paulo', '7'),
  ('Brasil', 'Rio de Janeiro', '8'),
  ('Canada', 'Toronto', '9'),
  ('Canada', 'Montreal', '10')
;

INSERT INTO Vehicle
  (veh_type, veh_name, limit_seats, transport_price)
VALUES
  ('bus', 'Scania Touring', '42', '200'),
  ('bus', 'Mercedes Intouro', '38', '300'),
  ('bus', 'Renault Iliade', '34', '300'), 
  ('plane', 'Boeing 737', '180', '950'),
  ('plane', 'Airbus A320', '170', '980'),
  ('plane', 'Embraer E190', '100', '950'), 
  ('boat', 'Pacific Cruise 500', '50', '700'),
  ('boat', 'Ocean Explorer', '80', '950'),
  ('boat', 'Caribbean Spirit', '60', '850'),
  ('train', 'TGV Duplex', '300', '600'),
  ('train', 'Shinkansen N700', '350', '750'),
  ('train', 'Amtrak Acela', '220', '550')
;

INSERT INTO Company
  (comp_name, transport_mode)
VALUES
  ('Greyhound', '1'),
  ('FlixBus', '2'),
  ('Eurolines', '3'),
  ('American Airlines', '4'),
  ('Air France', '5'),
  ('Jet Airways', '6'),
  ('Royal Caribbean', '7'),
  ('MSC Cruises', '8'),
  ('Carnival Cruises', '9'),
  ('SNCF', '10'),
  ('JR East', '11'),
  ('Amtrak', '12')
;

INSERT INTO Contact
  (cont_firstname, contact_lastname, contact_num, contact_mail, contact_adress)
VALUES
  ('John', 'Doe', '+1-800-555-1234', 'johndoe@example.com', '1684, Elm Street, Los Angeles, CA 90001, USA'),
  ('Jane', 'Smith', '+1-800-555-5678', 'janesmith@example.com', '4829, Oak Avenue, Miami, FL 33101, USA'),
  ('Alice', 'Brown', '+1-800-555-9012', 'alicebrown@example.com', '7648, Maple Drive, Chicago, IL 60601, USA'),
  ('Bob', 'White', '+1-800-555-3456', 'bobwhite@example.com', '9812, Pine Road, New York, NY 10001, USA'),
  ('Charlie', 'Green', '+1-800-555-7890', 'charliegreen@example.com', '2378, Birch Boulevard, Houston, TX 77001, USA')
;

INSERT INTO TravelAgency
  (contact, destination, transport, agency_price)
VALUES
  ('3', '5', '2', '72.45'),
  ('1', '3', '6', '94.95'),
  ('5', '7', '9', '90.15'),
  ('2', '10', '11', '64.25')
;

INSERT INTO Payment (pay_type, pay_status, pay_date, total_price)
VALUES
    (
        'money',
        FALSE,
        NULL, 
        (
            SELECT agency_price + accom_price + transport_price
            FROM TravelAgency
            JOIN Destination ON TravelAgency.destination = Destination.destination_id
            JOIN Accomodation ON Destination.accomodation = Accomodation.accom_id
            JOIN Vehicle ON TravelAgency.transport = Vehicle.veh_id
            WHERE TravelAgency.travel_id = 1
        )
    ),
    (
        'credit-card',
        TRUE,
        '2025-04-14',
        (
            SELECT agency_price + accom_price + transport_price
            FROM TravelAgency
            JOIN Destination ON TravelAgency.destination = Destination.destination_id
            JOIN Accomodation ON Destination.accomodation = Accomodation.accom_id
            JOIN Vehicle ON TravelAgency.transport = Vehicle.veh_id
            WHERE TravelAgency.travel_id = 2
        )
    ),
    (
        'paypal',
        TRUE,
        '2025-04-14',
        (
            SELECT agency_price + accom_price + transport_price
            FROM TravelAgency
            JOIN Destination ON TravelAgency.destination = Destination.destination_id
            JOIN Accomodation ON Destination.accomodation = Accomodation.accom_id
            JOIN Vehicle ON TravelAgency.transport = Vehicle.veh_id
            WHERE TravelAgency.travel_id = 3
        )
    ),
    (
        'bank transfer',
        FALSE,
        NULL, 
        (
            SELECT agency_price + accom_price + transport_price
            FROM TravelAgency
            JOIN Destination ON TravelAgency.destination = Destination.destination_id
            JOIN Accomodation ON Destination.accomodation = Accomodation.accom_id
            JOIN Vehicle ON TravelAgency.transport = Vehicle.veh_id
            WHERE TravelAgency.travel_id = 4
        )
    )
;

INSERT INTO Reservation
  (res_date, travel, client, payment)
VALUES
  ('2025-04-11', '1', '3', '1'),
  ('2025-04-11', '2', '1', '2'),
  ('2025-04-11', '3', '5', '3'),
  ('2025-04-11', '4', '2', '4')
;




