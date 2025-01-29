/*CREATE TABLES*/

CREATE TABLE Venue(
venueID INTEGER NOT NULL IDENTITY,
venueName VARCHAR(50) NOT NULL,
seats INTEGER NOT NULL,

CONSTRAINT PK_Venue PRIMARY KEY (venueID),
);

CREATE TABLE Event(
eventID INTEGER NOT NULL IDENTITY,
eventName VARCHAR(50) NOT NULL,
eventDate DATE NOT NULL,
venueID INTEGER,
availableSeats INTEGER NOT NULL,
price decimal (5,2) NOT NULL,
descriprion VARCHAR(150),
cancellation INTEGER NOT NULL,

CONSTRAINT PK_Event PRIMARY KEY (eventID),
CONSTRAINT FK_Event_venueID FOREIGN KEY (venueID)
	REFERENCES Venue(venueID),
CONSTRAINT CHK_Event_availableSeats CHECK (availableSeats >= 0),
CONSTRAINT CHK_Event_cancellation CHECK (cancellation = 1 OR cancellation = 0),
CONSTRAINT CHK_Event_price CHECK (price > 0)
);

CREATE TABLE Booking(
bookingNumber INTEGER NOT NULL IDENTITY,
eventID INTEGER,
tickets INTEGER NOT NULL,
completedPayment INTEGER NOT NULL,
clientsPhoneNumber VARCHAR(15) NOT NULL,
cancellationDeadline DATE NOT NULL

CONSTRAINT PK_Booking PRIMARY KEY (bookingNumber),
CONSTRAINT FK_Booking_eventID FOREIGN KEY (eventID)
	REFERENCES Event(eventID),
CONSTRAINT CHK_Booking_tickets CHECK (tickets >= 1),
CONSTRAINT CHK_Booking_completedPayment CHECK (completedPayment = 1 OR completedPayment = 0),

);

CREATE TABLE Artist(

artistID INTEGER NOT NULL IDENTITY,
artistName VARCHAR (50) NOT NULL,
artistsEmail VARCHAR (50) NOT NULL,
artistsPhone VARCHAR (15) NOT NULL,
specialRequests VARCHAR (150),

CONSTRAINT PK_Artist PRIMARY KEY (ArtistID),
);


CREATE TABLE ConcertProgram(
eventID INTEGER,
artistID INTEGER,

CONSTRAINT PK_ConcertProgram PRIMARY KEY (eventID, artistID),
CONSTRAINT FK_ConcertProgram_eventID FOREIGN KEY (eventID)
	REFERENCES Event(eventID),
CONSTRAINT FK_ConcertProgram_artistID FOREIGN KEY (artistID)
	REFERENCES Artist(artistID)

);

