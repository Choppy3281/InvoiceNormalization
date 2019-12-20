USE FinalProject;
DROP TABLE IF EXISTS Taxable;

CREATE TABLE Taxable(
    Taxable_ID int(11) NOT NULL auto_increment,
    Taxable VARCHAR(25) NOT NULL,
    PRIMARY KEY (Taxable_ID)
)AS
    SELECT DISTINCT Taxable
    FROM Invoice_Checkout
    WHERE Taxable IS NOT NULL
    ORDER BY Taxable;

ALTER TABLE Invoice_Checkout
    ADD COLUMN Taxable_ID INT(11);

UPDATE Invoice_Checkout
    INNER JOIN Taxable
    ON Taxable.Taxable = Invoice_Checkout.Taxable
    SET Invoice_Checkout.Taxable_ID = Taxable.Taxable_ID
    WHERE Taxable.Taxable IS NOT NULL;

SELECT IC.InvoiceID, IC.DiscountRate, IC.TaxAmount, IC.Taxable_ID, Tx.Taxable
    FROM Taxable AS Tx
        INNER JOIN Invoice_Checkout AS IC
    ON Tx.Taxable_ID = IC.Taxable_ID;

#ALTER TABLE Invoice_Checkout
     #DROP COLUMN Taxable;