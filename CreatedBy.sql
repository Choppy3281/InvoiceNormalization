USE FinalProject;
DROP TABLE IF EXISTS CreatedBy;

CREATE TABLE CreatedBy(
    CreatedBy_ID int(11) NOT NULL auto_increment,
    CreatedBy VARCHAR(25) NOT NULL,
    PRIMARY KEY (CreatedBy_ID)
)AS
    SELECT DISTINCT CreatedBy
    FROM Invoice_Checkout
    WHERE CreatedBy IS NOT NULL
    ORDER BY CreatedBy;

ALTER  TABLE Invoice_Checkout
    ADD COLUMN CreatedBy_ID INT(11);

UPDATE Invoice_Checkout
    INNER JOIN CreatedBy
    ON CreatedBy.CreatedBy = Invoice_Checkout.CreatedBy
    SET Invoice_Checkout.CreatedBy_ID = CreatedBy.CreatedBy_ID
    WHERE CreatedBy.CreatedBy IS NOT NULL;

SELECT IC.InvoiceID, IC.DiscountRate, IC.TaxRate, IC.CreatedBy_ID, CB.CreatedBy
    FROM CreatedBy AS CB
        INNER JOIN Invoice_Checkout AS IC
    ON CB.CreatedBy_ID = IC.CreatedBy_ID;

#ALTER TABLE invoices
     #DROP COLUMN CreatedBy;