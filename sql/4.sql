/*
Exercice 1 : Afficher toutes les sociétés qui proposent des avions
📌 Objectif : Trouver les entreprises (company) qui ont au moins un transport de type Avion.
*/
SELECT comp_name FROM `company` comp
INNER JOIN `vehicle` veh
	ON comp.transport_mode = veh.veh_id
WHERE veh.veh_type = 'plane'
;

/*
Exercice 2 : Lister les transports avec leur société
📌 Objectif : Afficher tous les transports (transport), en affichant le nom de la société correspondante.
*/
SELECT comp_name, veh_type, veh_name FROM `company` comp
	INNER JOIN `vehicle` veh
	ON comp.transport_mode = veh.veh_id	
;

/*
 Exercice 3 : Trouver les transports ayant plus de 200 places
📌 Objectif : Afficher tous les transports qui ont plus de 200 places (TotalSeats).
*/
SELECT * FROM `company` comp
INNER JOIN `vehicle` veh
	ON comp.transport_mode = veh.veh_id	
WHERE veh.limit_seats > '200'
;

/*
Exercice 4 : Afficher les hébergements et leur type de contact principal
📌 Objectif : Associer les hébergements (hebergement) avec le type de contact principal

Je n'ai pas pu faire ça car la manière dont j'ai créé la base de donnée n'a pas de type de contact
J'ai donc lié les hebergements en fonction des contacts
 */
SELECT cont_firstname, contact_lastname, accom_name, city, country
    FROM `travelagency` tra
INNER JOIN `contact` cont
	ON tra.contact = cont.cont_id
INNER JOIN `destination` dest
	ON tra.destination = dest.destination_id
INNER JOIN `accomodation` acc
	ON dest.accomodation = acc.accom_id
;

/* 
Exercice 5 : Trouver les contacts des hébergements en Suisse
📌 Objectif : Afficher les contacts (contact) associés à un hébergement situé en Suisse.e).
-- INFO -- Pour l'essayer je conseille de changer 'Suisse' par 'France' par exemple car a ce stade je n'ai pas de voyages en Suisse
*/
SELECT cont_firstname, contact_lastname, contact_num, contact_mail, contact_adress FROM `travelagency` tra
INNER JOIN `contact` cont
	ON tra.contact = cont.cont_id
INNER JOIN `destination` dest
	ON tra.destination = dest.destination_id
WHERE `country` = 'Suisse'
;

/* 
Exercice 6 : Créer un voyage en Belgique (3 jours à Plopsaland) avec un nombre limité de 50 places.
📌 Objectif : Créer un voyage en Belgique, Trouver le moyen de transport, l'herbergement et le contact.
*/
INSERT INTO `accomodation`
    (accom_name, accom_category, limit_rooms, accom_price)
VALUES
    ('Plopsaland De Panne', 'Hotel', '250', '999.95')
;
INSERT INTO `destination`
    (country, city, accomodation)
VALUES
    ('Belgium', 'De Panne', '11')
;
INSERT INTO `travelagency`
    (contact, destination, transport, agency_price)
VALUES
    ('4', '11', '10', '120')
;

/* 
Exercice 7 : Ajouter un client à ce voyage
📌 Objectif : Ajouter plusieurs clients, payment ....
*/
INSERT INTO `payment` (pay_type, pay_status, pay_date, total_price)
VALUES
    (
        DEFAULT,
        DEFAULT,
        DEFAULT, 
        (
            SELECT agency_price + accom_price + transport_price
              FROM `travelagency` tra 
            JOIN `destination` dest
              ON tra.destination = dest.destination_id
            JOIN `accomodation` acc
              ON dest.accomodation = acc.accom_id
            JOIN `vehicle` veh
              ON tra.transport = veh.veh_id
            WHERE tra.travel_id = "5"
        )
    )
;

INSERT INTO `reservation`
    (res_date, travel, client, payment, res_status)
VALUES
    ('2025-04-15', '5', '2', '5', DEFAULT)
;
