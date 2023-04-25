CREATE OR REPLACE TRIGGER custTypeAfterUpgrade
AFTER UPDATE ON Customers
FOR EACH ROW
WHEN (NEW.CustType='Gold' AND OLD.CustType != 'Gold')
BEGIN
   	UPDATE CustOrder SET ShippingFee = 0 WHERE CustId =:new.CustId;
END;
/
show errors;