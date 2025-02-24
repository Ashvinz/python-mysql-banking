
-- Q1. Create a view to get all customers with checking account from ON province. 

DROP VIEW VW_Customer_ON;

CREATE VIEW VW_Customer_ON AS
SELECT DISTINCT c.* FROM Customer c
JOIN Account a
ON c.AccountID = a.AccountId
JOIN AccountType at
ON a.AccountTypeID = at.AccountTypeID
WHERE at.AccountTypeDescription = 'Checking' and c.State = 'ON';



-- Q2. Create a view to get all customers with total account balance (including interest rate) greater than 5000. 

DROP VIEW VW_Customer_AMT;

CREATE VIEW VW_Customer_ON AS
SELECT c.CustomerFirstName, SUM(a.CurrentBalance) AS Ac_Balance, SUM(a.CurrentBalance + (a.CurrentBalance * s.InterestSavingRatesID)/100) AS Total_Ac_Balance 
FROM Customer c
JOIN Account a
ON c.AccountID = a.AccountId
JOIN SavingsInterestRates s
ON a.InterestSavingRatesID = s.InterestSavingRatesID 
GROUP BY c.CustomerFirstName
HAVING SUM(a.CurrentBalance + (a.CurrentBalance * s.InterestRatesValue)/100) > 5000;



-- Q3. Create a view to get counts of checking and savings accounts by customer. 

DROP VIEW VW_Customer_ACC;

CREATE VIEW VW_Customer_ACC 
AS
SELECT c.CustomerFirstName, at.AccountTypeDescription, COUNT(*) AS Total_AC_Types FROM Customer c
JOIN Account a
ON c.AccountID = a.AccountId
JOIN AccountType at
ON a.AccountTypeID = at.AccountTypeID
GROUP BY c.CustomerFirstName, at.AccountTypeDescription;



-- Q4. Create a view to get any particular user s login and password using AccountId. 

DROP VIEW VW_Account_UL;

CREATE VIEW VW_Account_UL 
AS
SELECT DISTINCT ul.UserLogin, ul.UserPassword
FROM UserLogins ul
JOIN LoginAccount la
ON ul.UserLoginID = la.UserLoginID
JOIN Account a
ON la.AccountID = a.AccountID;



-- Q5. Create a view to get all customers  overdraft amount. 

DROP VIEW VW_Customer_OD;

CREATE VIEW VW_Customer_OD 
AS
SELECT DISTINCT c.CustomerFirstName, o.OverDraftAmount
FROM OverDraftLog o
JOIN Customer c
ON o.AccountID = c.AccountID;



-- Q6. Create a stored procedure to add "User_" as a prefix to everyone's login (username). 

DROP PROCEDURE IF EXISTS sp_Update_Login;

DELIMITER $$

CREATE PROCEDURE sp_Update_Login()
BEGIN
    UPDATE UserLogins
    SET UserLogin = CONCAT('User_', UserLogin);
END $$

DELIMITER ;


-- Q7. Create a stored procedure that accepts AccountId as a parameter and returns customer's full name. 

DROP PROCEDURE IF EXISTS sp_Customer_Details;

DELIMITER $$

CREATE PROCEDURE sp_Customer_Details(IN p_AccountID INT)
BEGIN
    SELECT CONCAT(c.CustomerFirstName, ' ', 
                  IFNULL(c.CustomerMiddleInitial, ''), ' ', 
                  c.CustomerLastName) AS Customer_Full_Name
    FROM Customer c
    JOIN CustomerAccount ca ON c.CustomerID = ca.CustomerID
    WHERE ca.AccountID = p_AccountID;
END $$

DELIMITER ;





-- Q8. Create a stored procedure that returns error logs inserted in the last 24 hours. 

DROP PROCEDURE IF EXISTS sp_Errors_24;

DELIMITER $$

CREATE PROCEDURE sp_Errors_24()
BEGIN
    SELECT * 
    FROM LoginErrorLog
    WHERE ErrorTime BETWEEN NOW() - INTERVAL 24 HOUR AND NOW();
END $$

DELIMITER ;


-- Q9. Create a stored procedure that takes a deposit as a parameter and updates CurrentBalance value for that particular account.  

DROP PROCEDURE sp_Update_cBalance_After_Deposit;
DROP PROCEDURE IF EXISTS sp_Update_cBalance_After_Deposit;

DELIMITER $$

CREATE PROCEDURE sp_Update_cBalance_After_Deposit(
    IN p_AccountID INT, 
    IN p_Deposit DECIMAL(10,2)
)
BEGIN
    UPDATE Account
    SET CurrentBalance = CurrentBalance + p_Deposit
    WHERE AccountID = p_AccountID;
END $$

DELIMITER ;


-- Q10. Create a stored procedure that takes a withdrawal amount as a parameter and updates CurrentBalance value for that particular account. 

DROP PROCEDURE IF EXISTS sp_Update_cBalance_After_Withdraw;

DELIMITER $$

CREATE PROCEDURE sp_Update_cBalance_After_Withdraw(
    IN p_AccountID INT, 
    IN p_Withdraw DECIMAL(10,2)
)
BEGIN
    -- Ensure balance does not go negative
    IF (SELECT CurrentBalance FROM Account WHERE AccountID = p_AccountID) >= p_Withdraw THEN
        UPDATE Account
        SET CurrentBalance = CurrentBalance - p_Withdraw
        WHERE AccountID = p_Account



-- Q11.Create a stored procedure to remove all security questions for a particular login. 

DROP PROCEDURE IF EXISTS sp_Delete_Question;

DELIMITER $$

CREATE PROCEDURE sp_Delete_Question(
    IN p_UserLoginID SMALLINT
)
BEGIN
    -- Delete UserSecurityAnswers first (to avoid foreign key constraint errors)
    DELETE FROM UserSecurityAnswers
    WHERE UserSecurityQuestionID IN (
        SELECT UserSecurityQuestionID 
        FROM UserSecurityQuestions
        WHERE UserSecurityQuestionID IN (
            SELECT uq.UserSecurityQuestionID 
            FROM UserSecurityQuestions uq
            JOIN UserSecurityAnswers ua ON ua.UserSecurityQuestionID = uq.UserSecurityQuestionID
            WHERE ua.UserLoginID = p_UserLoginID
        )
    );

    -- Now delete the security questions
    DELETE FROM UserSecurityQuestions
    WHERE UserSecurityQuestionID IN (
        SELECT uq.UserSecurityQuestionID 
        FROM UserSecurityQuestions uq
        JOIN UserSecurityAnswers ua ON ua.UserSecurityQuestionID = uq.UserSecurityQuestionID
        WHERE ua.UserLoginID = p_UserLoginID
    );

END $$

DELIMITER ;


--Q12. Delete all error logs created in the last hour. 

DROP PROCEDURE IF EXISTS sp_Delete_Errors;

DELIMITER $$

CREATE PROCEDURE sp_Delete_Errors()
BEGIN
    DELETE FROM LoginErrorLog
    WHERE ErrorTime BETWEEN NOW() - INTERVAL 1 HOUR AND NOW();
END $$

DELIMITER ;


-- Q13. Write a query to remove SSN column from Customer table. 

DROP PROCEDURE IF EXISTS sp_Remove_Column;

DELIMITER $$

CREATE PROCEDURE sp_Remove_Column()
BEGIN
    ALTER TABLE Customer DROP COLUMN SSN;
END $$

DELIMITER ;


