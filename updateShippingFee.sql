CREATE OR REPLACE TRIGGER updateShippingFee 

AFTER UPDATE OF CustType ON Customer

FOR EACH ROW 

WHEN (NEW.CustType = 'Gold')

BEGIN 
	UPDATE CustOrder SET ShippedFee = 0 WHERE CustId= :new.CustId AND ShippedDate!=NULL; 
END;
/
show errors;