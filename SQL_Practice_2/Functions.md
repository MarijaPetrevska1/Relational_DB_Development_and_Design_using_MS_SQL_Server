Function (SQL Function)

A function is a database object that:

- takes input parameters (optional)

- returns a single value or a table

- is mainly used inside SELECT statements

CREATE FUNCTION GetTotalPrice(@qty INT, @price DECIMAL)

RETURNS DECIMAL

AS

BEGIN

    RETURN @qty * @price;
    
END;

SELECT dbo.GetTotalPrice(5, 100);

==> Key characteristics of Functions:

- MUST return a value

- used inside SELECT, WHERE, etc.

- cannot modify data (no INSERT/UPDATE/DELETE in most cases)

- must be deterministic (usually)
