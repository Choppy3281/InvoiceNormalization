USE FinalProject;
DROP TABLE IF EXISTS Company;

CREATE TABLE Company(
    Company_ID int(11) NOT NULL auto_increment,
    Company VARCHAR(25) NOT NULL,
    PRIMARY KEY (Company_ID)
)AS
    SELECT DISTINCT Company
    FROM CompanyInformation
    WHERE Company IS NOT NULL
    ORDER BY Company;

ALTER TABLE CompanyInformation
    ADD COLUMN Company_ID INT(11);

UPDATE CompanyInformation
    INNER JOIN Company
    ON Company.Company = CompanyInformation.Company
    SET CompanyInformation.Company_ID = Company.Company_ID
    WHERE Company.Company IS NOT NULL;

SELECT CI.Street, CI.State, CI.PostalCode, CI.Company_ID, CY.Company
    FROM Company AS CY
        INNER JOIN CompanyInformation AS CI
    ON CY.Company_ID = CI.Company_ID;

#ALTER TABLE CompanyInformation
     #DROP COLUMN Company;