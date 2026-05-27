Stored Procedure

A stored procedure is a set of SQL statements that:

- can perform operations (SELECT, INSERT, UPDATE, DELETE)

- can return multiple results

- is executed as a program

CREATE PROCEDURE GetSalesByProduct

AS

BEGIN

    SELECT *
    
    FROM Sales;
    
END;

EXEC GetSalesByProduct;

===> Key characteristics of Stored Procedures:

- can return multiple rows / results

- can modify data (INSERT/UPDATE/DELETE)

- can have logic (IF, loops)

- faster for repeated operations

- executed with EXEC
