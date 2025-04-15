/* Trouver tout les voyages et leurs informations */
SELECT travel_id, total_price, country, city, accom_name, accom_category, limit_rooms, comp_name, veh_type, veh_name, limit_seats
    FROM reservation res
INNER JOIN travelagency tra
    ON res.travel = tra.travel_id
INNER JOIN payment pay
    ON res.payment = pay.pay_id
INNER JOIN destination dest
    ON tra.destination = dest.destination_id
INNER JOIN accomodation acc
    ON dest.accomodation = acc.accom_id
INNER JOIN company comp
    ON tra.transport = comp.comp_id
INNER JOIN vehicle veh
    ON comp.transport_mode = veh.veh_id
;

/* Trouver la reservation d'un client et le statut de paiement */
SELECT res_id, cl_firstname, cl_lastname, res_date, pay_type, pay_date, total_price, pay_status
    FROM reservation res
INNER JOIN payment pay
	ON  res.payment = pay.pay_id
INNER JOIN `client` cli
	ON res.`client` = cli.cl_id
WHERE res_id = '2'
;

/* Trouver les transports disponibles pour un voyage donné */
SELECT travel_id, country, city, comp_name, veh_type, veh_name, limit_seats, transport_price
    FROM travelagency tra
INNER JOIN destination dest
	ON tra.destination = dest.destination_id
INNER JOIN company comp
	ON tra.transport = comp.comp_id
INNER JOIN vehicle veh
	ON comp.transport_mode = veh.veh_id
WHERE travel_id = '1'
;

/* Consulter les informations d’une entreprise et ses services associés. */
SELECT comp_name, veh_type, veh_name, limit_seats, transport_price FROM company
INNER JOIN vehicle
	ON company.transport_mode = vehicle.veh_id
WHERE comp_id = '4'
;
