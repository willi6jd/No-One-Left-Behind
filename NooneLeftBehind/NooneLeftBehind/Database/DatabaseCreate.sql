IF DB_ID('NoOneLeftBehind') IS NULL
	CREATE DATABASE NoOneLeftBehind
	
GO

USE NoOneLeftBehind

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_CATALOG = 'NoOneLeftBehind' and TABLE_NAME = 'Locations'))
BEGIN
	CREATE TABLE [Locations](
		[LocationID] [int] NOT NULL IDENTITY PRIMARY KEY,
		[StreetAddress] [varchar](255) NOT NULL,
		[RoomNumber] [varchar](255) NULL,
		[Floor] [varchar](255) NULL,
		[City] [varchar](100) NOT NULL,
		[State] [varchar](100) NOT NULL)
END 

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_CATALOG = 'NoOneLeftBehind' and TABLE_NAME = 'Requests'))
BEGIN
	CREATE TABLE [Requests](
		[RequestID] [int] NOT NULL IDENTITY PRIMARY KEY,
		[TimeStamp] [datetime2] NOT NULL,
		[TypeOfEmergency] [varchar](50) NOT NULL,
		[NumberOfPeople] [int] NULL,
		[NumberOfImmobilePeople] [int] NULL,
		[InjuriesOrOtherInfo] [varchar](2048) NULL,
		[AccessibleOutsideWindow] [bit] NOT NULL,
		[LocationID] [int] NOT NULL FOREIGN KEY REFERENCES Locations(LocationID),
		[FirstName] [varchar](255) NULL,
		[LastName] [varchar](255) NULL,
		[PhoneNumber] [varchar](50) NULL,
		[Longitude] [decimal](30,20) NULL,		
		[Latitude] [decimal](30,20) NULL
		)
END 