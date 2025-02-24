/* ## MS-SQL PROJECT on Banking Transactions by Aswin Kumar R ! */

-- Create Database Command
create database db_bank;
use db_bank;


-- Creating table named UserLogins and Insert Values
CREATE TABLE UserLogins
(
	UserLoginID SMALLINT NOT NULL AUTO_INCREMENT,
	UserLogin VARCHAR(50) NOT NULL,
	UserPassword VARCHAR(20) NOT NULL,
	CONSTRAINT pk_UL_UserLoginID PRIMARY KEY(UserLoginID)
);


INSERT INTO UserLogins (UserLogin, UserPassword) 
VALUES 
('john_doe', 'password123'),
('jane_smith', 'securepass'),
('robert_j', 'robertpass'),
('emily_brown', 'brownie12'),
('michael_d', 'mikepass99'),
('sarah_m', 'sarahm123'),
('david_w', 'davidrocks'),
('jessica_m', 'jesspass89'),
('chris_t', 'chrissecure'),
('ashley_a', 'ashley2024');

-- ------------------------------------------
-- Creating table named UserSecurityQuestions and Insert Values

CREATE TABLE UserSecurityQuestions
(
	UserSecurityQuestionID TINYINT NOT NULL auto_increment,
	UserSecurityQuestion VARCHAR(50) NOT NULL,
	CONSTRAINT pk_USQ_UserSecurityQuestionID PRIMARY KEY(UserSecurityQuestionID)
);

ALTER TABLE UserSecurityQuestions MODIFY COLUMN UserSecurityQuestion VARCHAR(255);

INSERT INTO UserSecurityQuestions (UserSecurityQuestion) VALUES
('What is the name of your first bank?'),
('What was the first bank you opened an account with?'),
('What are the last 4 digits of your first bank account number?'),
('What is the name of your favorite bank?'),
('What was your first banking password or PIN? (Do not enter actual PIN)'),
('In which city did you open your first bank account?'),
('What was the name of the branch where you opened your first bank account?'),
('What is the name of the person who helped you open your first bank account?'),
('What type of account was your first bank account? (Savings, Checking, etc.)'),
('What was the reason for opening your first bank account?'),
('What was the first financial transaction you made at a bank?'),
('What is the name of the bank where you applied for your first loan?');

-- ---------------------------------------------------------------------------------
-- Creating table named AccountType and Insert Values

CREATE TABLE AccountType
(
	AccountTypeID TINYINT NOT NULL auto_increment,
	AccountTypeDescription VARCHAR(30) NOT NULL,
	CONSTRAINT pk_AT_AccountTypeID PRIMARY KEY(AccountTypeID)
);

INSERT INTO AccountType (AccountTypeDescription) VALUES
('Savings Account'),
('Checking Account'),
('Business Account'),
('Fixed Deposit Account'),
('Recurring Deposit Account'),
('Salary Account'),
('Joint Account'),
('Student Account'),
('Senior Citizen Account'),
('NRI Account'),
('Current Account'),
('Loan Account'),
('Credit Card Account'),
('Debit Card Account'),
('Money Market Account'),
('Trust Account'),
('Corporate Account'),
('Foreign Currency Account'),
('Pension Account'),
('Demat Account');

-- ----------------------------------------------------------------------
-- Creating table named SavingsInterestRates and Insert Values

CREATE TABLE SavingsInterestRates
(
	InterestSavingRatesID TINYINT NOT NULL auto_increment,
	InterestRatesValue NUMERIC(9,9) NOT NULL, 
	InterestRatesDescription VARCHAR(20) NOT NULL,
	CONSTRAINT pk_SIR_InterestSavingRatesID PRIMARY KEY(InterestSavingRatesID)
);


ALTER TABLE SavingsInterestRates 
MODIFY InterestRatesValue DECIMAL(5,4) NOT NULL;

INSERT INTO SavingsInterestRates (InterestRatesValue, InterestRatesDescription) VALUES
(0.5000, 'Basic Rate'),
(1.2500, 'Standard Rate'),
(1.7500, 'Premium Rate'),
(2.0000, 'Student Rate'),
(2.5000, 'Senior Rate'),
(3.0000, 'High-Yield Rate'),
(3.2500, 'Online Rate'),
(3.5000, 'Business Rate'),
(4.0000, 'Wealth Savings'),
(4.2500, 'VIP Rate'),
(4.5000, 'Long-term Rate'),
(4.7500, 'Govt Scheme Rate'),
(5.0000, 'Fixed Deposit Rate'),
(5.2500, 'Salary Savings'),
(5.5000, 'Corporate Rate'),
(5.7500, 'Military Rate'),
(6.0000, 'Promotional Rate'),
(6.2500, 'Exclusive Rate'),
(6.5000, 'Investment Rate'),
(7.0000, 'High-Risk Plan');

-- --------------------------------------------------------------------------
-- Creating table named AccountStatusType and Insert Values

CREATE TABLE AccountStatusType
(
	AccountStatusTypeID TINYINT NOT NULL auto_increment,
	AccountStatusTypeDescription VARCHAR(30) NOT NULL,
	CONSTRAINT pk_AST_AccountStatusTypeID PRIMARY KEY(AccountStatusTypeID)
);

INSERT INTO AccountStatusType (AccountStatusTypeDescription) VALUES
('Active'),
('Inactive'),
('Suspended'),
('Closed'),
('Pending'),
('Frozen'),
('Dormant'),
('Overdrawn'),
('Restricted'),
('Under Review'),
('Blocked'),
('Fraud Alert'),
('Delinquent'),
('Charge-Off'),
('Escheated'),
('Reinstated'),
('Limited Access'),
('Awaiting Verification'),
('Pending Closure'),
('Joint');

-- --------------------------------------------------------------------------------
-- Creating table named FailedTransactionErrorType and Insert Values

CREATE TABLE FailedTransactionErrorType
(
	FailedTransactionErrorTypeID TINYINT NOT NULL auto_increment,
	FailedTransactionErrorTypeDescription VARCHAR(50) NOT NULL,
	CONSTRAINT pk_FTET_FailedTransactionErrorTypeID PRIMARY KEY(FailedTransactionErrorTypeID)
);


INSERT INTO FailedTransactionErrorType (FailedTransactionErrorTypeDescription) VALUES
('Withdraw limit reached'),
('Daily limit reached'),
('Not enough balance'),
('Invalid denomination'),
('ATM unavailable');

-- ----------------------------------------------------------------------------------------
-- Creating table named LoginErrorLog and Insert Values
CREATE TABLE LoginErrorLog
(
	ErrorLogID INT NOT NULL auto_increment,
	ErrorTime DATETIME NOT NULL,
	FailedTransactionXML TEXT,
	CONSTRAINT pk_LEL_ErrorLogID PRIMARY KEY(ErrorLogID)
);


INSERT INTO LoginErrorLog (ErrorTime, FailedTransactionXML) VALUES
(NOW(), '<Error><Code>401</Code><Message>Invalid credentials</Message></Error>'),
(NOW(), '<Error><Code>403</Code><Message>Account locked</Message></Error>'),
(NOW(), '<Error><Code>500</Code><Message>Internal server error</Message></Error>'),
(NOW(), '<Error><Code>400</Code><Message>Malformed request</Message></Error>'),
(NOW(), '<Error><Code>429</Code><Message>Too many requests</Message></Error>'),
(NOW(), '<Error><Code>401</Code><Message>Session expired</Message></Error>'),
(NOW(), '<Error><Code>403</Code><Message>Unauthorized IP address</Message></Error>'),
(NOW(), '<Error><Code>404</Code><Message>User not found</Message></Error>'),
(NOW(), '<Error><Code>408</Code><Message>Request timeout</Message></Error>'),
(NOW(), '<Error><Code>422</Code><Message>Invalid request format</Message></Error>'),
(NOW(), '<Error><Code>401</Code><Message>Password expired</Message></Error>'),
(NOW(), '<Error><Code>403</Code><Message>Account disabled</Message></Error>'),
(NOW(), '<Error><Code>500</Code><Message>Unexpected server error</Message></Error>'),
(NOW(), '<Error><Code>401</Code><Message>Invalid security token</Message></Error>'),
(NOW(), '<Error><Code>403</Code><Message>Access denied</Message></Error>'),
(NOW(), '<Error><Code>429</Code><Message>Rate limit exceeded</Message></Error>'),
(NOW(), '<Error><Code>400</Code><Message>Missing required parameters</Message></Error>'),
(NOW(), '<Error><Code>401</Code><Message>Multi-factor authentication failed</Message></Error>'),
(NOW(), '<Error><Code>500</Code><Message>Service unavailable</Message></Error>'),
(NOW(), '<Error><Code>403</Code><Message>Restricted region access</Message></Error>');

-- ------------------------------------------------------------------------------------
-- Creating table named Employee and Insert Values

CREATE TABLE Employee
(
	EmployeeID INT NOT NULL auto_increment,
	EmployeeFirstName VARCHAR(25) NOT NULL,
	EmployeeMiddleInitial CHAR(1),
	EmployeeLastName VARCHAR(25),
	EmployeeisManager BIT,
	CONSTRAINT pk_E_EmployeeID PRIMARY KEY(EmployeeID)
);


INSERT INTO Employee (EmployeeFirstName, EmployeeMiddleInitial, EmployeeLastName, EmployeeisManager) VALUES
('John', 'A', 'Doe', 1),
('Jane', 'B', 'Smith', 0),
('Robert', 'C', 'Johnson', 1),
('Emily', 'D', 'Brown', 0),
('Michael', 'E', 'Davis', 1),
('Sarah', 'F', 'Miller', 0),
('David', 'G', 'Wilson', 1),
('Jessica', 'H', 'Moore', 0),
('Christopher', 'I', 'Taylor', 1),
('Ashley', 'J', 'Anderson', 0),
('Matthew', 'K', 'Thomas', 1),
('Laura', 'L', 'Jackson', 0),
('Daniel', 'M', 'White', 1),
('Megan', 'N', 'Harris', 0),
('James', 'O', 'Martin', 1),
('Olivia', 'P', 'Thompson', 0),
('William', 'Q', 'Garcia', 1),
('Sophia', 'R', 'Martinez', 0),
('Benjamin', 'S', 'Robinson', 1),
('Emma', 'T', 'Clark', 0);

-- -----------------------------------------------------------------------------------
-- Creating table named TransactionType and Insert Values

CREATE TABLE TransactionType (
    TransactionTypeID TINYINT NOT NULL AUTO_INCREMENT,
    TransactionTypeName VARCHAR(20) NOT NULL,
    TransactionTypeDescription VARCHAR(50),
    TransactionFeeAmount DECIMAL(10,2),
    CONSTRAINT pk_TT_TransactionTypeID PRIMARY KEY (TransactionTypeID)
);


INSERT INTO TransactionType (TransactionTypeName, TransactionTypeDescription, TransactionFeeAmount) VALUES
('Deposit', 'Cash deposit at branch', 0.00),
('ATM Deposit', 'Deposit via ATM', 0.00),
('Online Transfer', 'Transfer between own accounts', 0.00),
('Wire Transfer', 'Domestic wire transfer', 15.00),
('International Wire', 'Wire transfer abroad', 30.00),
('Withdrawal', 'Cash withdrawal at branch', 0.00),
('ATM Withdrawal', 'Cash withdrawal via ATM', 2.50),
('Check Deposit', 'Deposit a check', 0.00),
('Mobile Deposit', 'Deposit via mobile app', 0.00),
('Bill Payment', 'Utility or service bill payment', 1.00),
('Loan Payment', 'Payment towards a loan', 0.00),
('Credit Card Payment', 'Payment for credit card', 0.00),
('POS Purchase', 'Purchase using debit/credit card', 0.00),
('Online Purchase', 'E-commerce transaction', 0.00),
('Direct Debit', 'Automatic recurring payment', 0.00),
('Overdraft Fee', 'Fee for overdrawing account', 35.00),
('NSF Fee', 'Non-sufficient funds fee', 25.00),
('Stop Payment', 'Request to stop a check', 10.00),
('Bank Draft', 'Issuance of a bank draft', 5.00),
('Safe Deposit Fee', 'Annual fee for safe deposit box', 50.00);

-- -----------------------------------------------------------------------------------------------
-- Creating table named TransactionType and Insert Values

CREATE TABLE FailedTransactionLog
(
	FailedTransactionID INT NOT NULL auto_increment,
	FailedTransactionErrorTypeID TINYINT NOT NULL,
	FailedTransactionErrorTime DATETIME,
	FailedTransactionErrorXML text,
	CONSTRAINT pk_FTL_FailedTransactionID PRIMARY KEY(FailedTransactionID),
	CONSTRAINT fk_FTET_FailedTransactionErrorTypeID FOREIGN KEY(FailedTransactionErrorTypeID) REFERENCES FailedTransactionErrorType(FailedTransactionErrorTypeID) 
);


INSERT INTO FailedTransactionLog (FailedTransactionErrorTypeID, FailedTransactionErrorTime, FailedTransactionErrorXML) VALUES
(1, STR_TO_DATE('2015-06-04 07:30:56', '%Y-%m-%d %H:%i:%s'), 'First'),
(2, STR_TO_DATE('2018-06-09 12:34:57', '%Y-%m-%d %H:%i:%s'), 'Second'),
(3, STR_TO_DATE('2016-04-05 02:14:00', '%Y-%m-%d %H:%i:%s'), 'Third'),
(4, STR_TO_DATE('2014-07-05 05:56:59', '%Y-%m-%d %H:%i:%s'), 'Fourth'),
(5, STR_TO_DATE('2009-10-12 08:34:15', '%Y-%m-%d %H:%i:%s'), 'Fifth');

-- ------------------------------------------------------------------------------------------------
-- Creating table named UserSecurityAnswers and Insert Values
CREATE TABLE UserSecurityAnswers
(
	UserLoginID SMALLINT NOT NULL auto_increment,
	UserSecurityAnswers VARCHAR(25) NOT NULL,
	UserSecurityQuestionID TINYINT NOT NULL,
	CONSTRAINT pk_USA_UserLoginID PRIMARY KEY(UserLoginID), 
	CONSTRAINT fk_UL_UserLoginID FOREIGN KEY(UserLoginID) REFERENCES UserLogins(UserLoginID),
	CONSTRAINT fk_USQ_UserSecurityQuestionID FOREIGN KEY(UserSecurityQuestionID) REFERENCES UserSecurityQuestions(UserSecurityQuestionID)
);

-- -----------------------------------------------------------
-- Creating table named Account and Insert Values

drop table account;
CREATE TABLE Account
(
    AccountID INT NOT NULL AUTO_INCREMENT,
    CurrentBalance INT NOT NULL,
    AccountTypeID TINYINT NOT NULL,
    AccountStatusTypeID TINYINT NOT NULL,
    InterestSavingRatesID TINYINT NOT NULL,
    
    CONSTRAINT pk_A_AccountID PRIMARY KEY (AccountID),
    CONSTRAINT fk_AT_AccountTypeID FOREIGN KEY (AccountTypeID) REFERENCES AccountType(AccountTypeID),
    CONSTRAINT fk_AST_AccountStatusTypeID FOREIGN KEY (AccountStatusTypeID) REFERENCES AccountStatusType(AccountStatusTypeID)
);

INSERT INTO Account (CurrentBalance, AccountTypeID, AccountStatusTypeID, InterestSavingRatesID) VALUES
(15000, 1, 1, 1),
(25000, 2, 2, 2),
(17000, 1, 1, 1),
(45000, 2, 2, 2),
(2320, 2, 2, 2);

-- -------------------------------------------------------------------------------------------------------
-- Creating table named LoginAccount and Insert Values

CREATE TABLE LoginAccount
(
	UserLoginID SMALLINT NOT NULL,
	AccountID INT NOT NULL,
	CONSTRAINT fk_UL_UserLogins FOREIGN KEY(UserLoginID) REFERENCES UserLogins(UserLoginID),
	CONSTRAINT fk_A_Account FOREIGN KEY(AccountID) REFERENCES Account(AccountID)
);

INSERT INTO LoginAccount (UserLoginID, AccountID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- -------------------------------------------------------------------------------------------------------
-- Creating table named Customer and Insert Values

CREATE TABLE Customer
(
	CustomerID INT NOT NULL auto_increment,
	AccountID INT NOT NULL,
	CustomerAddress1 VARCHAR(30) NOT NULL,
	CustomerAddress2  VARCHAR(30),
	CustomerFirstName  VARCHAR(30) NOT NULL,
	CustomerMiddleInitial CHAR(1),
	CustomerLastName  VARCHAR(30) NOT NULL,
	City  VARCHAR(20) NOT NULL,
	State CHAR(2) NOT NULL,
	ZipCode CHAR(10) NOT NULL,
	EmailAddress CHAR(40) NOT NULL,
	HomePhone VARCHAR(10) NOT NULL,
	CellPhone VARCHAR(10) NOT NULL,
	WorkPhone VARCHAR(10) NOT NULL,
	SSN VARCHAR(9),
	UserLoginID SMALLINT NOT NULL,
	CONSTRAINT pk_C_CustomerID PRIMARY KEY(CustomerID),
	CONSTRAINT fk_A_AccountID FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	CONSTRAINT fk_UL_C_UserLoginID FOREIGN KEY(UserLoginID) REFERENCES UserLogins(UserLoginID)  
);

INSERT INTO Customer (AccountID, CustomerAddress1, CustomerAddress2, CustomerFirstName, CustomerMiddleInitial, 
                      CustomerLastName, City, State, ZipCode, EmailAddress, HomePhone, CellPhone, WorkPhone, SSN, UserLoginID)
VALUES
(1, '123 Main St', 'Apt 2B', 'John', 'A', 'Doe', 'Toronto', 'ON', 'M4B1B3', 'johndoe@email.com', '4165551234', '4165555678', '4165559876', '123456789', 1),
(2, '456 Elm St', 'Suite 301', 'Jane', 'B', 'Smith', 'Vancouver', 'BC', 'V5K0A1', 'janesmith@email.com', '6045555678', '6045556789', '6045557890', '234567890', 2),
(3, '789 Pine Ave', '', 'Michael', 'C', 'Brown', 'Calgary', 'AB', 'T2P1N4', 'michaelbrown@email.com', '4035559876', '4035558765', '4035557654', '345678901', 3),
(4, '321 Oak Blvd', 'Unit 45', 'Emily', 'D', 'Davis', 'Montreal', 'QC', 'H3Z2Y7', 'emilydavis@email.com', '5145554321', '5145553210', '5145552109', '456789012', 4),
(5, '654 Birch Rd', '', 'David', 'E', 'Wilson', 'Ottawa', 'ON', 'K1A0B1', 'davidwilson@email.com', '6135558765', '6135557654', '6135556543', '567890123', 5),
(6, '987 Cedar Ln', 'Apt 9C', 'Sarah', 'F', 'Taylor', 'Winnipeg', 'MB', 'R3T4H2', 'sarahtaylor@email.com', '2045553456', '2045552345', '2045551234', '678901234', 6),
(7, '159 Maple Ct', '', 'Robert', 'G', 'Anderson', 'Halifax', 'NS', 'B3J2Y5', 'robertanderson@email.com', '9025556543', '9025555432', '9025554321', '789012345', 7),
(8, '753 Walnut St', 'Suite 12', 'Laura', 'H', 'Martinez', 'Regina', 'SK', 'S4P3A8', 'lauramartinez@email.com', '3065552109', '3065551098', '3065550987', '890123456', 8),
(9, '852 Cherry Dr', '', 'Daniel', 'I', 'Hernandez', 'Edmonton', 'AB', 'T5J1R9', 'danielhernandez@email.com', '7805557890', '7805556789', '7805555678', '901234567', 9),
(10, '369 Spruce Ave', 'Unit 7', 'Sophia', 'J', 'Lopez', 'Quebec City', 'QC', 'G1R5P2', 'sophialopez@email.com', '4185552345', '4185551234', '4185550123', '012345678', 10);


-- Creating table named CustomerAccount
-- NOTE: Unlike ER diagram table name has been used as CustomerAccounts instead of Customer-Account

CREATE TABLE CustomerAccount
(
	AccountID INT NOT NULL ,
	CustomerID INT NOT NULL,
	CONSTRAINT fk_A_CA_AccountID FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	CONSTRAINT fk_C_CA_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO CustomerAccount (AccountID, CustomerID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- ----------------------------------------------------------------------------------------
-- Creating table named TransactionLog

CREATE TABLE TransactionLog
(
	TransactionID INT NOT NULL auto_increment,
	TransactionDate DATETIME NOT NULL,
	TransactionTypeID TINYINT NOT NULL,
	TransactionAmount decimal(10 ,2) NOT NULL,
	NewBalance decimal(10 ,2) NOT NULL,
	AccountID INT NOT NULL,
	CustomerID INT NOT NULL,
	EmployeeID INT NOT NULL,
	UserLoginID SMALLINT NOT NULL,
	CONSTRAINT pk_TL_TransactionID PRIMARY KEY(TransactionID),
	CONSTRAINT fk_TT_TL_TransactionTypeID FOREIGN KEY(TransactionTypeID) REFERENCES TransactionType(TransactionTypeID),
	CONSTRAINT fk_A_TL_AccountID FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	CONSTRAINT fk_C_TL_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
	CONSTRAINT fk_E_TL_EmployeeID FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
	CONSTRAINT fk_UL_TL_UserLoginID FOREIGN KEY(UserLoginID) REFERENCES UserLogins(UserLoginID)    
);

INSERT INTO TransactionLog (TransactionDate, TransactionTypeID, TransactionAmount, NewBalance, AccountID, CustomerID, EmployeeID, UserLoginID) 
VALUES
('2024-02-24 10:30:00', 1, 200.00, 5200.00, 1, 1, 2, 3),
('2024-02-24 11:15:00', 2, 500.00, 7500.00, 2, 2, 3, 4),
('2024-02-24 12:45:00', 1, 1000.00, 10200.00, 3, 3, 4, 5),
('2024-02-24 14:00:00', 3, 750.00, 4300.00, 4, 4, 5, 6),
('2024-02-24 15:30:00', 2, 300.00, 6200.00, 5, 5, 6, 7),
('2024-02-24 16:45:00', 1, 1200.00, 9200.00, 6, 6, 7, 8),
('2024-02-24 18:00:00', 3, 400.00, 5800.00, 7, 7, 8, 9),
('2024-02-24 19:15:00', 2, 250.00, 7250.00, 8, 8, 9, 10),
('2024-02-24 20:30:00', 1, 900.00, 9600.00, 9, 9, 10, 1),
('2024-02-24 22:00:00', 3, 600.00, 5400.00, 10, 10, 1, 2);

-- ----------------------------------------------------------------------------------------------------------------
-- Creating table named OverDraftLog

CREATE TABLE OverDraftLog
(
	AccountID INT NOT NULL auto_increment,
	OverDraftDate DATETIME NOT NULL,
	OverDraftAmount decimal(10 ,2) NOT NULL,
	OverDraftTransactionXML text NOT NULL,
	CONSTRAINT Pk_ODL_AccountID PRIMARY KEY(AccountID),
	CONSTRAINT fk_A_ODL_AccountID FOREIGN KEY(AccountID) REFERENCES Account(AccountID)
);

INSERT INTO OverDraftLog (AccountID, OverDraftDate, OverDraftAmount, OverDraftTransactionXML) 
VALUES
(1, '2024-02-24 10:30:00', 150.00, '<transaction><type>Overdraft</type><amount>150.00</amount></transaction>'),
(2, '2024-02-24 12:15:00', 250.00, '<transaction><type>Overdraft</type><amount>250.00</amount></transaction>'),
(3, '2024-02-24 14:45:00', 500.00, '<transaction><type>Overdraft</type><amount>500.00</amount></transaction>'),
(4, '2024-02-24 16:00:00', 100.00, '<transaction><type>Overdraft</type><amount>100.00</amount></transaction>'),
(5, '2024-02-24 18:30:00', 75.00, '<transaction><type>Overdraft</type><amount>75.00</amount></transaction>'),
(6, '2024-02-24 19:45:00', 200.00, '<transaction><type>Overdraft</type><amount>200.00</amount></transaction>'),
(7, '2024-02-24 21:00:00', 350.00, '<transaction><type>Overdraft</type><amount>350.00</amount></transaction>'),
(8, '2024-02-24 22:15:00', 180.00, '<transaction><type>Overdraft</type><amount>180.00</amount></transaction>'),
(9, '2024-02-24 23:30:00', 400.00, '<transaction><type>Overdraft</type><amount>400.00</amount></transaction>'),
(10, '2024-02-24 23:59:00', 220.00, '<transaction><type>Overdraft</type><amount>220.00</amount></transaction>');
