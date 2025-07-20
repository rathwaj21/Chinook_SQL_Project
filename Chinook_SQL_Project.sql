-- 1. Find the Top 10 Customers by Total Spending
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    SUM(i.Total) AS TotalSpent
FROM 
    Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY 
    c.CustomerId, c.FirstName, c.LastName
ORDER BY 
    TotalSpent DESC
LIMIT 10;


-- 2. Find Total Sales by Country
SELECT 
    BillingCountry,
    SUM(Total) AS TotalSales
FROM 
    Invoice
GROUP BY 
    BillingCountry
ORDER BY 
    TotalSales DESC;
    
    
    
-- 3. Find the Most Popular Genres by Number of Tracks
SELECT 
    g.Name AS Genre,
    COUNT(t.TrackId) AS NumberOfTracks
FROM 
    Genre g
    JOIN Track t ON g.GenreId = t.GenreId
GROUP BY 
    g.Name
ORDER BY 
    NumberOfTracks DESC;

-- 4. Calculate Revenue by Genre
SELECT 
    g.Name AS Genre,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM 
    Genre g
    JOIN Track t ON g.GenreId = t.GenreId
    JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY 
    g.Name
ORDER BY 
    Revenue DESC;
    
-- 5. Find Top 5 Artists by Total Sales
SELECT 
    ar.Name AS Artist,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM 
    Artist ar
    JOIN Album al ON ar.ArtistId = al.ArtistId
    JOIN Track t ON al.AlbumId = t.AlbumId
    JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY 
    ar.Name
ORDER BY 
    Revenue DESC
LIMIT 5;

-- 6. Find Average Invoice Total by Customer
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    ROUND(AVG(i.Total), 2) AS AverageInvoice
FROM 
    Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY 
    c.CustomerId, c.FirstName, c.LastName
ORDER BY 
    AverageInvoice DESC
LIMIT 10;

-- 7. Calculate Monthly Revenue Trend
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS YearMonth,
    SUM(Total) AS MonthlyRevenue
FROM 
    Invoice
GROUP BY 
    YearMonth
ORDER BY 
    YearMonth;