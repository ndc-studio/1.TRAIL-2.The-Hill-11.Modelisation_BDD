/* Après avoir modifié base?sql l.93 à l.140 */
DELETE FROM `reservation`
    WHERE `res_id` = '1'
;

/* pour cet exercice ça va etre legerement different de ce qui est demandé car je n'ai pas créé une table specifique pour le moyen de paiement
 * j'ai donc modifié base.sql/l.53 (pay_type    ENUM('credit-card', 'bank-transfer', 'money') NULL DEFAULT NULL,)
 * et puis je vais le modifier pour qu'il ne prenne plus la money
 */
ALTER TABLE `payment`
	MODIFY `pay_type` ENUM('credit-card', 'bank-transfer') NULL DEFAULT NULL
;

/* Retirer un transport qui n’est plus disponible. */
DELETE comp FROM `company` comp
    INNER JOIN `vehicle` veh
        ON comp.transport_mode = veh.veh_id
    WHERE `transport_mode` = '12'
; 