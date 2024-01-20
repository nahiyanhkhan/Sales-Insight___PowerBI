# Total Transactions
SELECT 
    COUNT(*) AS Total_Transactions
FROM
    sales.transactions;

# -----------------------------------------

# Currency is USD
SELECT *
FROM sales.transactions
WHERE currency = 'USD';

# -----------------------------------------

# Distinct Currency
SELECT currency, count(*) AS occurance
FROM sales.transactions
GROUP BY currency;

# -----------------------------------------

# Checking sales_amount column
SELECT *
FROM sales.transactions
WHERE sales_amount <= 0;

# -----------------------------------------

# Total sales amount in Mumbai
SELECT sum(T.sales_amount) AS 'TOTAL SALES (MUMBAI)'
FROM sales.transactions T JOIN sales.markets M ON T.market_code = M.markets_code
WHERE markets_name = 'MUMBAI'
AND (T.currency = 'INR\r' OR T.currency = 'USD\r');

# -----------------------------------------

# Revenue by year and month
SELECT sum(sales_amount) AS 'REVENUE'
FROM sales.transactions
WHERE YEAR(order_date) = 2020 
	AND MONTH(order_date) = 01;