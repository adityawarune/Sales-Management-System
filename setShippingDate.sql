CREATE OR REPLACE PROCEDURE setShippingDate(order_id IN CustOrder.OrderId%type, shipping_date IN CustOrder.ShippingDate%type)
IS BEGIN
UPDATE CustOrder SET ShippingDate = shipping_date WHERE OrderId = order_id;
END;
/
show errors;
