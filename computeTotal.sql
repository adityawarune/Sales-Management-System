CREATE OR REPLACE PROCEDURE computeTotal(order_id IN CustOrder.OrderId%type)
AS
total_amount CustOrder.Total%type;
item_price StoreItems.Price%type;
shipping_fee CustOrder.ShippingFee%type;
tax_amount CustOrder.Tax%type;

CURSOR c_orderLineItems IS
SELECT ItemId, Quantity FROM OrderLineItem WHERE OrderId = order_id;

BEGIN
    total_amount := 0;
	FOR c_orderLineItem in c_orderLineitems 
	LOOP
		SELECT Price INTO item_price FROM StoreItems WHERE ItemId = c_orderLineItem.ItemId;
		total_amount := total_amount + (item_price * c_orderLineItem.Quantity);
	END LOOP;

    tax_amount := total_amount + (0.05 * total_amount);

	SELECT ShippingFee INTO shipping_fee FROM CustOrder WHERE OrderId = order_id;
	total_amount := total_amount + shipping_fee + tax_amount;

	UPDATE CustOrder SET Tax = tax_amount, Total = total_amount WHERE OrderId = order_id;
END;
/
show errors;