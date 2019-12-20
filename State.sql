USE FinalProject;
DROP TABLE IF EXISTS State;

CREATE TABLE State(
    State_ID int(11) NOT NULL auto_increment,
    State VARCHAR(25) NOT NULL,
    PRIMARY KEY (State_ID)
)AS
    SELECT DISTINCT State
    FROM CompanyInformation
    WHERE State IS NOT NULL
    ORDER BY State;

ALTER TABLE CompanyInformation
    ADD COLUMN State_ID INT(11);

UPDATE CompanyInformation
    INNER JOIN State
    ON State.State = CompanyInformation.State
    SET CompanyInformation.State_ID = State.State_ID
    WHERE State.State IS NOT NULL;

SELECT CI.Street, CI.State, CI.PostalCode, CI.State_ID, ST.State
    FROM State AS ST
        INNER JOIN CompanyInformation AS CI
    ON ST.State_ID = CI.State_ID;

#ALTER TABLE CompanyInformation
     #DROP COLUMN State;