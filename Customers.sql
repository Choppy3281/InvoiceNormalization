USE FinalProject;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers AS
SELECT Title, FirstName, LastName, Email, Phone, Fax
FROM invoices;

ALTER TABLE invoices
    DROP COLUMN Title;

ALTER TABLE invoices
    DROP COLUMN FirstName;

ALTER TABLE invoices
    DROP COLUMN LastName;

ALTER TABLE invoices
    DROP COLUMN Email;

ALTER TABLE invoices
    DROP COLUMN Phone;

ALTER TABLE invoices
    DROP COLUMN Fax;