CREATE OR REPLACE PROCEDURE createOrderLineItem (order_id IN CustOrder.OrderId%type, item_id IN StoreItems.ItemId%type, cust_id IN Customer.CustId%type, date_of_order IN CustOrder.DateOfOrder%type, item_quantity IN OrderLineItem.Quantity%type)
AS
no_of_copies StoreItems.NoOfCopies%type;
insufficientQuantityException EXCEPTION;
cust_type Customer.CustType%type;
shipping_fee CustOrder.ShippingFee%type;

BEGIN
    no_of_copies := 0;
    SELECT NoOfCopies INTO no_of_copies FROM StoreItems WHERE ItemId = item_id;

    IF item_quantity > no_of_copies THEN
        RAISE insufficientQuantityException;
    END IF;

    SELECT CustType INTO cust_type FROM Customer WHERE CustId = cust_id;

    IF cust_type = 'Gold' THEN
        shipping_fee := 0;
    ELSIF cust_type = 'Regular' THEN
        shipping_fee := 10;
    END IF;
	
	UPDATE CustOrder SET ShippingFee = shipping_fee, DateOfOrder = date_of_order WHERE OrderId = order_id;

    INSERT INTO OrderLineItem(OrderId, LineId, ItemId, Quantity) VALUES (order_id, line_id_seq.NEXTVAL, item_id, item_quantity);

    no_of_copies := no_of_copies - item_quantity;

    UPDATE StoreItems SET NoOfCopies = no_of_copies WHERE ItemId = item_id;

    EXCEPTION
        WHEN insufficientQuantityException THEN
            dbms_output.put_line('Quantity available: ' || no_of_copies);
END;
/
show errors;