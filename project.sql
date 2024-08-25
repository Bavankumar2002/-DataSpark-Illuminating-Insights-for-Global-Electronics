use global;

select * from new_customers;
-- 1 To calculate the total quantity sold by each store

SELECT 
    StoreKey,
    SUM(Quantity) AS TotalQuantitySold
FROM 
    new_Sales
GROUP BY 
    StoreKey
ORDER BY 
    TotalQuantitySold DESC;
    
    
-- 2 To find the top 10 customers who purchased the most quantity
SELECT 
    CustomerKey,
    SUM(Quantity) AS TotalQuantityPurchased
FROM 
    new_Sales
GROUP BY 
    CustomerKey
ORDER BY 
    TotalQuantityPurchased DESC
LIMIT 10;

-- 3 To find the total sales volume by customer country.
SELECT 
    c.Country,
    SUM(s.Quantity) AS TotalSalesVolume
FROM 
    new_Sales s
JOIN 
    new_Customers c ON s.CustomerKey = c.CustomerKey
GROUP BY 
    c.Country
ORDER BY 
    TotalSalesVolume DESC;
    
-- 4 To identify the top-performing stores by total quantity sold

SELECT 
    StoreKey,
    SUM(Quantity) AS TotalQuantitySold
FROM 
    new_Sales
GROUP BY 
    StoreKey
ORDER BY 
    TotalQuantitySold DESC
LIMIT 10;

-- 5 To analyze sales distribution by customer gender,

SELECT 
    c.Gender,
    SUM(s.Quantity) AS TotalQuantitySold
FROM 
    new_Sales s
JOIN 
    new_Customers c ON s.CustomerKey = c.CustomerKey
GROUP BY 
    c.Gender
ORDER BY 
    TotalQuantitySold DESC;


-- 6 Total number of products available.
SELECT COUNT(DISTINCT ProductKey) AS TotalProducts
FROM new_products;

-- 7 To calculate the total store count by country 

SELECT 
    Country,
    COUNT(*) AS Store_Count
FROM 
    new_stores
GROUP BY 
    Country;

-- 8 To count the number of products that belong to each brand
SELECT 
    Brand,
    COUNT(*) AS Product_Count
FROM 
    new_products
GROUP BY 
    Brand;


-- 9 To calculate the average store size for each country

SELECT 
    Country,
    AVG(`Square Meters`) AS Avg_Store_Size
FROM 
    new_stores
GROUP BY 
    Country;

-- 10 To identify the store with the largest area (square meters)

SELECT 
    StoreKey,
    Country,
    State,
    `Square Meters`
FROM 
    new_stores
ORDER BY 
    `Square Meters` DESC
LIMIT 1;

