SELECT trType, rtDate, cSurname, cName, cPeople FROM Transport tr
JOIN ReservTransp rt on tr.trID = rt.trID JOIN CTour ct on ct.tID = rt.tID JOIN Client c on ct.cID = c.cID;

SELECT tHotelName, count(*) as popularity from Tour t
JOIN CTour ct on ct.tID = t.tID 
GROUP BY tHotelName;

SELECT trType as Type_transport, group_concat(cSurname) as client_info, tHotelName FROM Transport tr
JOIN ReservTransp rt on tr.trID = rt.trID JOIN CTour ct on ct.tID = rt.tID 
JOIN Client c on ct.cID = c.cID JOIN Tour t on ct.tID = t.tID
GROUP BY tHotelName;

CREATE INDEX client_index on Client (cSurname, cID);
CREATE INDEX ctour_index on CTour (cDate);
CREATE INDEX tour_index on Tour (tHotelName, tID);
CREATE INDEX hotel_index on Hotel (hID, hName);
CREATE INDEX transport_index on Transport (trType);
