/* BOOKING A TICKET*/
/* 1. CHECK IF THERE IS ENOUGH VACANT SEATS*/
/* 2. CREATE NEW ROW IN BOOKING TABLE*/
/* 2. UPDATE AVAILABLE SEATS IN EVENT TABLE*/

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
IF (SELECT availableSeats FROM Event WHERE eventID = 9) >= 15
	INSERT INTO Booking (eventID,tickets, completedPayment, clientsPhoneNumber, cancellationDeadline) VALUES
	(9, 15, 0, '+358065400000', DATEADD(day, 3, GETDATE()))
	UPDATE Event SET availableSeats = availableSeats - 15 WHERE eventID = 9
	
COMMIT;

/* CANCELL A BOOKING*/
/* 1. ADD VACANT SEATS TO THE EVENT TABLE*/
/* 2. DELETE ROW FROM BOOKING TABLE*/

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
IF (SELECT completedPayment FROM Booking WHERE bookingNumber = 6) = 0
	UPDATE Event SET availableSeats = availableSeats + (SELECT tickets FROM Booking WHERE bookingNumber = 6) WHERE eventID = 4
	DELETE FROM Booking WHERE bookingNumber = 6
	
COMMIT;

/* CHANGE NUMBER OF TICKETS IN A BOOKING*/
/* 1. CHECK IF THERE IS ENOUGH AVAILABLE SEATS IN EVENT TABLE TO CHANGE NUMBER OF TICKETS IN BOOKING*/
/* 2. ADD TICKETS THAT WERE BOOKED BEFORE THE TRANSACTION TO AVAILABLE SEATS*/
/* 3. UPDATE BOOKING TABLE, SET NEW NUMBER OF TICKETS*/
/* 4. SUBSTRACT TICKETS NUMBER FRON AVAILABLE SEATS*/

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION

IF (SELECT availableSeats FROM Event WHERE eventID = 9) + (SELECT tickets FROM Booking WHERE bookingNumber = 27)  >= 60
	UPDATE Event SET availableSeats = availableSeats + (SELECT tickets FROM Booking WHERE bookingNumber = 27) WHERE eventID = 9
	UPDATE Booking SET tickets = 60 WHERE bookingNumber = 27
	UPDATE Event SET availableSeats = availableSeats - 60 WHERE eventID = 9
	
COMMIT;

/* CHANGE STATUS OF BOOKIN WHEN TICKETS ARE SOLD (IN MY CASE THE TICKET IS SOLD IF IT IS MARKED AS completedPayment= 1  IN Booking TABLE)*/
/* 1. CHECK IF THE BOOKING IS NOT SOLD*/
/* 2. UPDATE STATUS THAT THE PAYMENT IS COMPLETED*/


SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION

IF (SELECT completedPayment FROM Booking WHERE bookingNumber = 27)  = 0
	UPDATE Booking SET completedPayment = 1 WHERE bookingNumber = 27
	
COMMIT;

/* DELETE BOOKING RECORDS WITH EXPIRED PAYMENT DEADLINE*/
/* 1. DELETE BOOKING*/


SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION

DELETE FROM BOOKING WHERE cancellationDeadline <  GETDATE() AND completedPayment = 0;
	
COMMIT;

/* CANCELL AN EVENT. */
/* CHANNGE THE STATUS OF EVENT cancellation TO 1*/

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION

IF (SELECT cancellation FROM Event WHERE eventID = 6)  = 0
	UPDATE Event SET cancellation = 1 WHERE eventID = 6
	
COMMIT;

/* REFUND A CLIENT IN CASE OF CANCELLATION. */
/* 1. CHECK IF THE EVENT IS CANCELLED AND IF CLIENT PAYED FOR TICKETS*/
/* 2. CALCULATE HOW MUCH MONEY SHOULD BE GIVEN BACK TO THE CLIENT*/
/* 3. CHANGE AMOUNT OF AVAILABLE SEATS IN EVENT TABLE TO PROVIDE DATA CONCURRENCY*/
/* 2. DELETE BOOKING ROW AS MONEY WAS RETURNED*/


SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION

IF (SELECT cancellation FROM Event WHERE eventID = 6)  = 1 AND (SELECT completedPayment FROM Booking WHERE bookingNumber = 17) = 1
	SELECT (SELECT tickets FROM Booking WHERE  bookingNumber = 17) * (SELECT price FROM Event WHERE eventID = 6) AS 'Refund sum';
	UPDATE Event SET availableSeats = availableSeats + (SELECT tickets FROM Booking WHERE bookingNumber = 17) WHERE eventID = 6
	DELETE FROM Booking WHERE bookingNumber = 17
	
COMMIT;

/*SELECT STATEMENTS TO ANSWER THE QUESTIONS*/


/*1*/
SELECT artistsEmail 
FROM Artist 
WHERE artistName = 'Ed Sheeran';


/*2*/
SELECT eventName, descriprion, eventDate, availableSeats, price 
FROM Event 
WHERE descriprion LIKE '%dance%' AND MONTH(eventDate) =  MONTH(DATEADD(month, 1, GETDATE())) AND YEAR(eventDate) =  YEAR(DATEADD(month, 1, GETDATE()));


/*3*/
SELECT eventName, descriprion, eventDate, availableSeats, price 
FROM Event 
WHERE  MONTH(eventDate) =  MONTH(GETDATE()) AND YEAR(eventDate) =  YEAR( GETDATE()) AND DAY(eventDate) > DAY( GETDATE());


/*4*/
SELECT Artist.artistName, Event.eventDate, Event.eventName , Artist.specialRequests
FROM Artist
JOIN ConcertProgram ON (ConcertProgram.artistID = Artist.artistID)
JOIN Event ON (ConcertProgram.eventID = Event.eventID)
WHERE Artist.artistName LIKE 'Saara Aalto';


/*5*/
SELECT SUM(Booking.tickets) AS 'Sold tickets'
FROM Booking
JOIN Event ON (Event.eventID = Booking.eventID)
WHERE Booking.completedPayment = 1 AND Event.eventName LIKE 'Riverdance 2020' AND Event.eventDate = '2020-07-10';


/*6*/
SELECT Event.availableSeats 
FROM Event 
JOIN ConcertProgram ON (ConcertProgram.eventID = Event.eventID)
JOIN Artist ON (Artist.artistID = ConcertProgram.artistID)
WHERE Artist.artistName LIKE 'ZZ Top' AND Event.eventDate = '2020-01-22';

/*7*/
SELECT SUM((Booking.tickets)*(Event.price)) AS 'Money from sold tickets this year'
FROM Booking
JOIN Event ON (Event.eventID = Booking.eventID)
WHERE Booking.completedPayment = 1 AND YEAR(Event.eventDate) = YEAR (GETDATE());

/*8 DO NOT KNOW HOW TO TO IN BETTER WAY*/
SELECT TOP 1 Artist.artistName, SUM(Booking.tickets) AS 'Highest number of tickets this year'
FROM Artist
JOIN ConcertProgram ON (ConcertProgram.artistID = Artist.artistID)
JOIN Event ON (Event.eventID = ConcertProgram.eventID)
JOIN Booking ON (Booking.eventID = Event.eventID)
WHERE YEAR(Event.eventDate) = YEAR(GETDATE()) AND Booking.completedPayment = 1
GROUP BY Artist.artistName
ORDER BY 'Highest number of tickets this year' DESC;