USE FinalProject;
DROP TABLE IF EXISTS CompanyInformation;

CREATE TABLE CompanyInformation AS
SELECT Company, Street, City, State, PostalCode
FROM invoices;

ALTER TABLE invoices
    DROP COLUMN Company;

ALTER TABLE invoices
    DROP COLUMN Street;

ALTER TABLE invoices
    DROP COLUMN City;

ALTER TABLE invoices
    DROP COLUMN State;

ALTER TABLE invoices
    DROP COLUMN PostalCode;