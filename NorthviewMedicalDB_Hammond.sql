/* 
    Name: Kaylah Hammond
    Date: 2025-09-27
    Assignment: Northview Medical – Tables from ERD 
*/

CREATE DATABASE NorthviewMedicalDB;
GO

USE NorthviewMedicalDB;
GO

-- Department
CREATE TABLE dbo.Department
(
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    [name]       VARCHAR(100)  NOT NULL,
    phone        VARCHAR(20)   NOT NULL
);
GO

-- Patients
CREATE TABLE dbo.Patients
(
    PatientID   INT IDENTITY(1,1) PRIMARY KEY,
    MedicalID   VARCHAR(20)   NOT NULL,
    first_name  VARCHAR(50)   NOT NULL,
    last_name   VARCHAR(50)   NOT NULL,
    phone       VARCHAR(20)       NULL,
    email       VARCHAR(100)      NULL,
    [address]   VARCHAR(100)      NULL,
    city        VARCHAR(60)       NULL,
    [state]     CHAR(2)           NULL,
    zip_code    VARCHAR(20)       NULL,
    patientDOB  DATE          NOT NULL
);
GO

-- Staff
CREATE TABLE dbo.Staff
(
    StaffID      INT IDENTITY(1,1) PRIMARY KEY,
    first_name   VARCHAR(50)  NOT NULL,
    last_name    VARCHAR(50)  NOT NULL,
    phone        VARCHAR(20)      NULL,
    [role]         VARCHAR(20)  NOT NULL,   -- 'Doctor', 'Nurse', etc.
    is_active    BIT          NOT NULL DEFAULT 1,   -- kept per ERD nullability; 
    email        VARCHAR(100)     NULL,
    specialty    VARCHAR(80)      NULL,
    DepartmentID INT          NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES dbo.Department(DepartmentID)
);
GO

-- Appointments
CREATE TABLE dbo.Appointments
(
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    app_start     DATETIME2(0) NOT NULL,
    app_end       DATETIME2(0) NOT NULL,
    PatientID     INT          NOT NULL,
    DoctorID      INT          NOT NULL,  -- Staff(StaffID)
    NurseID       INT              NULL,  -- Staff(StaffID)
    [status]      VARCHAR(15)   NOT NULL, -- 'Completed', 'No show', 'Canceled', 'Checked in', 'Scheduled'
    notes         VARCHAR(200)      NULL,
    FOREIGN KEY (PatientID) REFERENCES dbo.Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES dbo.Staff(StaffID),
    FOREIGN KEY (NurseID)  REFERENCES dbo.Staff(StaffID)
);
GO

-- Staff_Shift
CREATE TABLE dbo.Staff_Shift
(
    ShiftID      INT IDENTITY(1,1) PRIMARY KEY,
    StaffID      INT      NOT NULL,
    shift_date   DATE     NOT NULL,
    shift_start  TIME(0)  NOT NULL,
    shift_end    TIME(0)  NOT NULL,
    FOREIGN KEY (StaffID)      REFERENCES dbo.Staff(StaffID),
   
);
GO