CREATE PROCEDURE spAddCustomer
@CustomerID NCHAR (10), 
@CompanyName NVARCHAR(80) ,
@ContactName NVARCHAR (60) = NULL, 
@ContactTitle NVARCHAR (60)= NULL, 
@Address NVARCHAR (120)= NULL, 
@City NVARCHAR (30)= NULL, 
@Region NVARCHAR (30)= NULL, 
@PostalCode NVARCHAR (20) = NULL,
@Country NVARCHAR (30)= NULL,  
@Phone NVARCHAR (48)= NULL, 
@Fax NVARCHAR (48) = NULL

AS 
BEGIN
INSERT INTO dbo.Customers (CustomerID,CompanyName, ContactName,ContactTitle,Address, 
City, Region, PostalCode, Country,Phone, Fax)
VALUES ( @CustomerID, @CompanyName, @ContactName, @ContactTitle,
        @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax);
END