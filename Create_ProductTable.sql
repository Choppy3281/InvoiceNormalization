USE FinalProject;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products AS
SELECT ProductName, ProductWeight, PartNumber, Price, ExtendedPrice, UnitDimensions
FROM invoices;

ALTER TABLE invoices
    DROP COLUMN ProductName;

ALTER TABLE invoices
    DROP COLUMN ProductWeight;

ALTER TABLE invoices
    DROP COLUMN PartNumber;

ALTER TABLE invoices
    DROP COLUMN Price;

ALTER TABLE invoices
    DROP COLUMN ExtendedPrice;

ALTER TABLE invoices
    DROP COLUMN UnitDimensions;
