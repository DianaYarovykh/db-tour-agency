CREATE VIEW Full_info
AS SELECT tID, tPrice, tHotelName, tStartDate, tPlace, hLocation, tDetails, hNumber, hRoom FROM Tour
JOIN Hotel on tHotelName = hName;

CREATE VIEW Info_for_hotel
as SELECT cSurname, cName, cDate, cTerm, cPeople, tHotelName FROM Client c
JOIN CTour ct on c.cID = ct.cID JOIN Tour t on t.tID = ct.tID;

CREATE VIEW client_hotel
as SELECT cSurname, cName, cDate, cTerm, cPeople, hName, hPrice FROM Client c
JOIN CTour ct on c.cID = ct.cID JOIN Tour t on t.tID = ct.tID JOIN Hotel h on h.hName = t.tHotelName;

CREATE VIEW Info_for_transport
as SELECT trType, rtDate, cSurname, cName, cPeople FROM Transport tr
JOIN ReservTransp rt on tr.trID = rt.trID JOIN CTour ct on ct.tID = rt.tID JOIN Client c on ct.cID = c.cID;

CREATE VIEW Tour_price
as SELECT tID, tPrice, tHotelName, tDetails FROM Tour
GROUP BY tID HAVING tPrice <= 36000;

CREATE VIEW hotel_info
as SELECT hID, hName, hPrice, hRoom FROM Hotel;

INSERT INTO hotel_info VALUES (10, 'Fairmont Grand Hotel Kyiv', 6545, 'The elegant wood-panelled rooms feature Wi-Fi, flat-screen TVs, work desks, seating areas and tea and coffee making facilities. Room service is available. Suites have living rooms with sofas. Superior suites have balconies, kitchens and dining rooms');
UPDATE hotel_info SET hPrice = 7264 WHERE hID = 10;
DELETE FROM hotel_info WHERE hID = 10;



