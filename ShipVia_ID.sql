USE FinalProject;
DROP TABLE IF EXISTS ShipVia;

CREATE TABLE ShipVia(
    ShipVia_ID int(11) NOT NULL auto_increment,
    ShipVia VARCHAR(25) NOT NULL,
    PRIMARY KEY (ShipVia_ID)
)AS
    SELECT DISTINCT ShipVia
    FROM Invoice_Checkout
    WHERE ShipVia IS NOT NULL
    ORDER BY ShipVia;

ALTER  TABLE Invoice_Checkout
    ADD COLUMN ShipVia_ID INT(11);

UPDATE Invoice_Checkout
    INNER JOIN ShipVia
    ON ShipVia.ShipVia = Invoice_Checkout.ShipVia
    SET Invoice_Checkout.ShipVia_ID = ShipVia.ShipVia_ID
    WHERE ShipVia.ShipVia IS NOT NULL;

SELECT IC.InvoiceID, IC.DiscountRate, IC.TaxAmount, IC.ShipVia_ID, Tx.ShipVia
    FROM ShipVia AS Tx
        INNER JOIN Invoice_Checkout AS IC
    ON Tx.ShipVia_ID = IC.ShipVia_ID;

#ALTER TABLE Invoice_Checkout
     #DROP COLUMN ShipVia;