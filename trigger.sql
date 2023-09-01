CREATE TRIGGER lowerHotelN_tour
AFTER INSERT on Tour
BEGIN
	UPDATE Tour
	SET tHotelName = lower(tHotelName);
END;

CREATE TRIGGER lowerName_Hotel
AFTER INSERT on Hotel
BEGIN
	UPDATE Hotel
	SET hName = lower(hName);
END;

CREATE TRIGGER client_password
BEFORE INSERT on Client
BEGIN
	SELECT CASE
	WHEN length(NEW.cPassword) < 8
	THEN
	RAISE(ABORT, "Invalid Password")
	END;
END;

CREATE TRIGGER check_info
BEFORE DELETE on Tour
BEGIN
	SELECT CASE
	WHEN OLD.tStatus = 1
	THEN
	RAISE(ABORT, "Check your information before delete")
	END;
END;

/*triggers on views*/

CREATE TRIGGER hotel_info_insert
INSTEAD of INSERT on hotel_info
FOR EACH ROW
BEGIN
	INSERT INTO Hotel VALUES (NEW.hID, NEW.hName, NEW.hPrice, null, null, NEW.hRoom);
END;

CREATE TRIGGER hotel_info_update
INSTEAD OF UPDATE OF hPrice ON hotel_info
FOR EACH ROW
BEGIN
	UPDATE Hotel
	SET hPrice = NEW.hPrice
	WHERE hID = OLD.hID;
END;

CREATE TRIGGER hotel_info_delete
INSTEAD OF DELETE on hotel_info
FOR EACH ROW
BEGIN
	DELETE FROM Hotel
	WHERE hID = OLD.hID;
END;
