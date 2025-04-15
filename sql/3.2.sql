/* Trouver tout les voyages et leurs informations */
SELECT travel_id, total_price, country, city, accom_name, accom_category, limit_rooms, comp_name, veh_type, veh_name, limit_seats
    FROM reservation
INNER JOIN travelagency
    ON reservation.travel = travelagency.travel_id
INNER JOIN payment
    ON reservation.payment = payment.pay_id
INNER JOIN destination
    ON travelagency.destination = destination.destination_id
INNER JOIN accomodation
    ON destination.accomodation = accomodation.accom_id
INNER JOIN company
    ON travelagency.transport = company.comp_id
INNER JOIN vehicle
    ON company.transport_mode = vehicle.veh_id
;

/* Trouver la reservation d'un client et le statut de paiement */
SELECT res_id, cl_firstname, cl_lastname, res_date, pay_type, pay_date, total_price, pay_status FROM reservation
INNER JOIN payment
	ON  reservation.payment = payment.pay_id
INNER JOIN `client`
	ON reservation.`client` = `client`.cl_id
WHERE res_id = '2'
;