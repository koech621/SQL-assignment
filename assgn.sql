CREATE TABLE Car (
    CarID INT PRIMARY KEY IDENTITY(1,1),
    CarModel VARCHAR(50),
    Manufacturer VARCHAR(50),
    Year INT,
    Color VARCHAR(30),
    RentalRate DECIMAL(10,2),
    Availability BIT
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(100)
);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    CarID INT FOREIGN KEY REFERENCES Car(CarID),
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    RentalStartDate DATE,
    RentalEndDate DATE,
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    BookingID INT FOREIGN KEY REFERENCES Booking(BookingID),
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(30)
);

CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY IDENTITY(1,1),
    CarID INT FOREIGN KEY REFERENCES Car(CarID),
    InsuranceProvider VARCHAR(50),
    PolicyNumber VARCHAR(50),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE Location (
    LocationID INT PRIMARY KEY IDENTITY(1,1),
    CarID INT FOREIGN KEY REFERENCES Car(CarID),
    LocationName VARCHAR(50),
    Address VARCHAR(100),
    ContactNumber VARCHAR(20)
);

CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY IDENTITY(1,1),
    CarID INT FOREIGN KEY REFERENCES Car(CarID),
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    ReservationDate DATE,
    PickupDate DATE,
    ReturnDate DATE
);

CREATE TABLE Maintenance (
    MaintenanceID INT PRIMARY KEY IDENTITY(1,1),
    CarID INT FOREIGN KEY REFERENCES Car(CarID),
    MaintenanceDate DATE,
    Description VARCHAR(100),
    Cost DECIMAL(10,2)
);
--  Car
INSERT INTO Car (CarModel, Manufacturer, Year, Color, RentalRate, Availability)
VALUES 
('Corolla', 'Toyota', 2022, 'White', 70.00, 1),
('Civic', 'Honda', 2021, 'Blue', 65.00, 1),
('Camry', 'Toyota', 2020, 'Black', 60.00, 1),
('Mazda3', 'Mazda', 2023, 'Red', 80.00, 1),
('Altima', 'Nissan', 2022, 'Gray', 75.00, 1);

-- Customer
INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address)
VALUES
('John', 'Doe', 'john.doe@example.com', '0722111222', 'Nairobi, Kenya'),
('Jane', 'Smith', 'jane.smith@example.com', '0722333444', 'Eldoret, Kenya'),
('Paul', 'Kamau', 'paul.kamau@example.com', '0711444555', 'Kisumu, Kenya'),
('Mary', 'Omondi', 'mary.omondi@example.com', '0700111222', 'Mombasa, Kenya'),
('Lucy', 'Chebet', 'lucy.chebet@example.com', '0799888777', 'Nakuru, Kenya');

-- Booking
INSERT INTO Booking (CarID, CustomerID, RentalStartDate, RentalEndDate, TotalAmount)
VALUES
(1, 1, '2025-09-20', '2025-09-25', 350.00),
(2, 2, '2025-09-21', '2025-09-23', 130.00),
(3, 3, '2025-09-22', '2025-09-27', 300.00),
(4, 4, '2025-09-23', '2025-09-28', 400.00),
(5, 5, '2025-09-24', '2025-09-30', 450.00);

--  Payment
INSERT INTO Payment (BookingID, PaymentDate, Amount, PaymentMethod)
VALUES
(1, '2025-09-20', 350.00, 'Credit Card'),
(2, '2025-09-21', 130.00, 'Mobile Money'),
(3, '2025-09-22', 300.00, 'Cash'),
(4, '2025-09-23', 400.00, 'Debit Card'),
(5, '2025-09-24', 450.00, 'Credit Card');

--  Insurance
INSERT INTO Insurance (CarID, InsuranceProvider, PolicyNumber, StartDate, EndDate)
VALUES
(1, 'APA Insurance', 'POL1001', '2025-01-01', '2025-12-31'),
(2, 'Jubilee Insurance', 'POL1002', '2025-02-01', '2026-01-31'),
(3, 'Britam Insurance', 'POL1003', '2025-03-01', '2026-02-28'),
(4, 'CIC Insurance', 'POL1004', '2025-04-01', '2026-03-31'),
(5, 'ICEA Lion', 'POL1005', '2025-05-01', '2026-04-30');

--  Location
INSERT INTO Location (CarID, LocationName, Address, ContactNumber)
VALUES
(1, 'Downtown Branch', 'Moi Avenue, Nairobi', '0700000001'),
(2, 'Westlands Branch', 'Waiyaki Way, Nairobi', '0700000002'),
(3, 'Kisumu Branch', 'Oginga Odinga St, Kisumu', '0700000003'),
(4, 'Mombasa Branch', 'Nkrumah Rd, Mombasa', '0700000004'),
(5, 'Eldoret Branch', 'Uganda Rd, Eldoret', '0700000005');

--  Reservation
INSERT INTO Reservation (CarID, CustomerID, ReservationDate, PickupDate, ReturnDate)
VALUES
(1, 1, '2025-09-15', '2025-09-20', '2025-09-25'),
(2, 2, '2025-09-16', '2025-09-21', '2025-09-23'),
(3, 3, '2025-09-17', '2025-09-22', '2025-09-27'),
(4, 4, '2025-09-18', '2025-09-23', '2025-09-28'),
(5, 5, '2025-09-19', '2025-09-24', '2025-09-30');

--  Maintenance
INSERT INTO Maintenance (CarID, MaintenanceDate, Description, Cost)
VALUES
(1, '2025-08-01', 'Oil change and filter replacement', 50.00),
(2, '2025-08-10', 'Brake pad replacement', 120.00),
(3, '2025-08-15', 'Tire rotation and alignment', 80.00),
(4, '2025-08-20', 'Battery replacement', 150.00),
(5, '2025-08-25', 'Engine tune-up', 200.00);
SELECT * FROM Car;
SELECT * FROM Customer;
SELECT * FROM Booking;
SELECT * FROM Payment;
SELECT * FROM Insurance;
SELECT * FROM Location;
SELECT * FROM Reservation;
SELECT * FROM Maintenance;

UPDATE Car SET Availability = 0 WHERE CarID = 1;
UPDATE Customer SET PhoneNumber = '0799999999' WHERE CustomerID = 3;
UPDATE Booking SET TotalAmount = 320.00 WHERE BookingID = 3;
UPDATE Payment SET PaymentMethod = 'Bank Transfer' WHERE PaymentID = 4;
UPDATE Maintenance SET Cost = 180.00 WHERE MaintenanceID = 2;



DELETE FROM Reservation WHERE ReservationID = 5;
DELETE FROM Payment WHERE PaymentID = 5;
DELETE FROM Booking WHERE BookingID = 5;
DELETE FROM Maintenance WHERE MaintenanceID = 5;
