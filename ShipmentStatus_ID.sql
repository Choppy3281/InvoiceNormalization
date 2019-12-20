USE FinalProject;
DROP TABLE IF EXISTS ShipmentStatus;

CREATE TABLE ShipmentStatus(
    ShipmentStatus_ID int(11) NOT NULL auto_increment,
    ShipmentStatus VARCHAR(25) NOT NULL,
    PRIMARY KEY (ShipmentStatus_ID)
)AS
    SELECT DISTINCT ShipmentStatus
    FROM Invoice_Checkout
    WHERE ShipmentStatus IS NOT NULL
    ORDER BY ShipmentStatus;

ALTER  TABLE Invoice_Checkout
    ADD COLUMN ShipmentStatus_ID INT(11);

UPDATE Invoice_Checkout
    INNER JOIN ShipmentStatus
    ON ShipmentStatus.ShipmentStatus = Invoice_Checkout.ShipmentStatus
    SET Invoice_Checkout.ShipmentStatus_ID = ShipmentStatus.ShipmentStatus_ID
    WHERE ShipmentStatus.ShipmentStatus IS NOT NULL;

SELECT IC.InvoiceID, IC.DiscountRate, IC.TaxRate, IC.ShipmentStatus_ID, SS.ShipmentStatus
    FROM ShipmentStatus AS SS
        INNER JOIN Invoice_Checkout AS IC
    ON SS.ShipmentStatus_ID = IC.ShipmentStatus_ID;

#ALTER TABLE invoices
     #DROP COLUMN ShipmentStatus;
