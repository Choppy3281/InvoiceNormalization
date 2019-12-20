USE FinalProject;
DROP TABLE IF EXISTS Title;

CREATE TABLE Title(
    Title_ID int(11) NOT NULL auto_increment,
    Title VARCHAR(25) NOT NULL,
    PRIMARY KEY (Title_ID)
)AS
    SELECT DISTINCT Title
    FROM Customers
    WHERE Title IS NOT NULL
    ORDER BY Title;

ALTER  TABLE Customers
    ADD COLUMN Title_ID INT(11);

UPDATE Customers
    INNER JOIN Title
    ON Title.Title = Customers.Title
    SET Customers.Title_ID = Title.Title_ID
    WHERE Title.Title IS NOT NULL;

SELECT CS.FirstName, CS.LastName, CS.Title, CS.Title_ID, Ti.Title
    FROM Title AS Ti
        INNER JOIN Customers AS CS
    ON Ti.Title_ID = CS.Title_ID;

ALTER TABLE Customers
     DROP COLUMN Title;
