
CREATE DATABASE WelfareDB;
USE WelfareDB;
CREATE TABLE Programs (
    ProgramID INT PRIMARY KEY,
    ProgramName VARCHAR(100),
    Description TEXT
);
CREATE TABLE Recipients (
    RecipientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Address VARCHAR(100)
);

CREATE TABLE Benefits (
    BenefitID INT PRIMARY KEY,
    RecipientID INT,
    ProgramID INT,
    BenefitAmount DECIMAL(10, 2),
    BenefitDate DATE,
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);

INSERT INTO Programs (ProgramID, ProgramName, Description)
VALUES
(1, 'Food Assistance', 'Provides food vouchers and supplies.'),
(2, 'Housing Assistance', 'Supports with rental and housing expenses.'),
(3, 'Medical Aid', 'Offers medical and health-related assistance.');

INSERT INTO Recipients (RecipientID, FirstName, LastName, DateOfBirth, Address)
VALUES
(1, 'Emma', 'Green', '1985-03-12', '123 Main St'),
(2, 'Liam', 'White', '1990-07-24', '456 Oak St'),
(3, 'Olivia', 'Brown', '1978-11-05', '789 Pine St');

INSERT INTO Benefits (BenefitID, RecipientID, ProgramID, BenefitAmount, BenefitDate)
VALUES
(1, 1, 1, 150.00, '2025-01-15'),
(2, 2, 2, 500.00, '2025-01-16'),
(3, 3, 3, 200.00, '2025-01-17'),
(4, 1, 2, 300.00, '2025-01-18'),
(5, 2, 1, 100.00, '2025-01-19');

SELECT p.ProgramName, r.FirstName, r.LastName, b.BenefitAmount, b.BenefitDate
FROM Programs p
JOIN Benefits b ON p.ProgramID = b.ProgramID
JOIN Recipients r ON b.RecipientID = r.RecipientID;