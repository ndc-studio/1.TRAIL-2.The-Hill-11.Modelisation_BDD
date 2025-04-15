/* Modifier les informations d’un client (nom, prénom, etc.). */
UPDATE `client`
	SET	cl_firstname = 'Stephan',
			cl_lastname = 'Martin',
			cl_dob = '1992-01-07',
			cl_adress = '64, Chaussée de Bruxelles, Jumet, 6040, Belgium'
	WHERE cl_id = '2'

;

/* Mettre à jour le statut d’une réservation (confirmée, annulée, en attente). 
 * On pourra remarquer un changement notable les noms de tables et colonnes dont entre ` ` .
 * Après quelques recherches suite a l'histoire du nom client qui ressort bleu j'ai appris que l'on pouvais utiliser les back-ticks
 * dans le but d'affiner la selection cela permet d'eviter tout erreur de syntaxe comme les mots (client, server, des, card, name, etc..)
 * on fera donc `client` ou `card` qui limitera la casse il permet de s'assurer qu'on cherche bien une table ou colonne.
 */
UPDATE `reservation`
	SET `res_status` = 'paid'
	WHERE `res_id` = '2'
;

/* Changer les détails d’un voyage (prix, nombre de places disponibles). */
UPDATE reservation res
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
   
	SET	acc.limit_rooms = '25',
			pay.total_price = '1820.65'
	WHERE tra.travel_id = '1'
;