USE FinalProject;
DROP TABLE IF EXISTS Invoice_Checkout;

CREATE TABLE Invoice_Checkout AS
SELECT InvoiceID, DiscountRate, Taxable, TaxAmount, TaxRate, ShipDate, ShipVia, ShipmentStatus, Quantity, Subtotal, InvoiceTotal, CreatedBy
FROM invoices;

ALTER TABLE invoices
    DROP COLUMN InvoiceID;

ALTER TABLE invoices
    DROP COLUMN DiscountRate;

ALTER TABLE invoices
    DROP COLUMN Taxable;

ALTER TABLE invoices
    DROP COLUMN TaxAmount;

ALTER TABLE invoices
    DROP COLUMN TaxRate;

ALTER TABLE invoices
    DROP COLUMN ShipDate;

ALTER TABLE invoices
    DROP COLUMN ShipVia;

ALTER TABLE invoices
    DROP COLUMN Subtotal;

ALTER TABLE invoices
    DROP COLUMN InvoiceTotal;

ALTER TABLE invoices
    DROP COLUMN ShipmentStatus;

ALTER TABLE invoices
    DROP COLUMN CreatedBy;

ALTER TABLE invoices
    DROP COLUMN Quantity;