CREATE OR REPLACE PROCEDURE showItemOrders(order_id IN CustOrder.OrderId%type)
IS

cust_id Customer.CustId%type;
cust_name Customer.Name%type;
cust_email Customer.Email%type;
cust_phone Customer.Phone%type;
custType Customer.CustType%type;
cust_address Customer.Address%type;
item_name ComicBook.Title%type;
--dateOrdered CustOrder.DateOfOrder%type;
--shippingFee CustOrder.ShippingFee%type;

CURSOR c_orderLineItems IS
	SELECT * FROM OrderLineItem WHERE OrderId = order_id;
CURSOR c_custOrderDetails IS
	SELECT * FROM CustOrder WHERE OrderId = order_id;
BEGIN
	SELECT CustId INTO cust_id FROM CustOrder WHERE OrderId = order_id;
	
	SELECT Name, Email, Phone, Address INTO cust_name, cust_email, cust_phone, cust_address FROM Customer WHERE CustId = cust_id;
	
	dbms_output.put_line('Customer ID: ' || cust_id);
	dbms_output.put_line('Customer Name: ' || cust_name);
	dbms_output.put_line('Customer Email: ' || cust_email);
	dbms_output.put_line('Customer Phone: ' || cust_phone);
	dbms_output.put_line('Customer Address: '|| cust_address);
	dbms_output.put_line('Order ID: '|| order_id);
	FOR c_orderLineItem IN c_orderLineItems LOOP
		SELECT Title INTO item_name FROM CartoonMovie WHERE ItemId = c_orderLineItem.ItemId;
		IF item_name IS NULL THEN
			SELECT Title INTO item_name FROM ComicBook WHERE ItemId = c_orderLineItem.ItemId;
        END IF;
    	dbms_output.put_line('Item Name: ' || item_name);
    	dbms_output.put_line('Number of Items: ' || c_orderLineItem.Quantity);
	END LOOP;

	FOR c_custOrderDetail IN c_custOrderDetails LOOP
		dbms_output.put_line('Date ordered: ' || c_custOrderDetail.DateOfOrder);
		dbms_output.put_line('Shipping Fee: '|| c_custOrderDetail.ShippingFee);
		dbms_output.put_line('Tax: '|| c_custOrderDetail.tax);
		dbms_output.put_line('Discount: '|| c_custOrderDetail.Discount);
		dbms_output.put_line('Shipped date: '|| c_custOrderDetail.ShippingDate);
		dbms_output.put_line('Total Order Amount: '|| c_custOrderDetail.Total);
	END LOOP;

END;
/
show errors;