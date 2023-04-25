CREATE OR REPLACE FUNCTION createCustOrder
RETURN CustOrder.OrderId%type
IS
newOrderId CustOrder.OrderId%type;
BEGIN
	newOrderId := orderIdSeq.NEXTVAL;
    RETURN newOrderId;
END;
/
show errors;