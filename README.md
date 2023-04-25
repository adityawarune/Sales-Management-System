# Sales-Management-System
The Sales Management System uses a relational database to maintain the sales and customer records and support queries to track customer orders.

Steps to run the project:
1. Install Oracle SQL on your laptop.
2. Make sure you have all the files present in the folder from where you want to run sqlplus.
3. Open terminal and login to your account by using the sqlplus command.
4. Run the files/commands in the following order:
   a. start createTables.sql
   b. start insertCustData.sql
   c. start insertStoreItemsData.sql
   d. start insertComicBookData.sql
   e. start insertCartoonMovieData.sql
   f. drop SEQUENCE orderIdSeq;
   g. CREATE SEQUENCE orderIdSeq START WITH 1001;
   h. start createCustOrder.sql
   i. EXECUTE createCustOrder;
   j. drop SEQUENCE line_id_seq;
   k. CREATE SEQUENCE line_id_seq START WITH 1;
   l. start createOrderLineItem.sql
   m. EXECUTE createOrderLineItem(1001, 1, 3, TO_DATE('2019-01-01','YYYY-MM-DD'), 1);
   n. EXECUTE createOrderLineItem(1001, 12, 3, TO_DATE('2019-01-01','YYYY-MM-DD'), 2);
   o. start setShippingDate.sql
   p. EXECUTE setShippingDate(1001, TO_DATE('2019-01-04','YYYY-MM-DD'));
   q. start computeTotal.sql
   r. EXECUTE computeTotal(1001);
   t. start showItemOrders.sql
   t. EXECUTE showItemOrders(1001);
5. Display contents of tables as and when they are altered.
