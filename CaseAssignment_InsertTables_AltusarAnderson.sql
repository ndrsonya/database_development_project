/*INSERT DATA IN TABLES*/


INSERT INTO Venue (venueName, seats) VALUES 
('Small hall', 250),
('Large hall', 3500)
;

SELECT * From Venue;

INSERT INTO Event (eventName, eventDate, venueID, availableSeats, price, descriprion, cancellation) VALUES 
('Shine bright like a diamond', '2020-02-07', 2, 3400, 100.00, 'Rihana will sing her songd with life sound.', 0 ),
('The theory of everything', '2018-03-26', 1, 250, 100.00, 'Stephen Hawking gives an inspiring stories about his life, education and work', 1 ),
('Swan lake', '2020-01-02', 1, 210, 80.00, 'A unique dance performance with famous russian ballerinas starring', 0)
;

SELECT * From Event;

INSERT INTO Artist (artistName, artistsEmail, artistsPhone, specialRequests) VALUES
('Rihanna', 'rihanna@rihanna.com', '+7777777', 'Hairdresser, make up artist, Evian vater 10 bottles, Fazer Geisha chocolate'),
('Stephen Hawking', 'stephen@hawking.com', '+666666', 'Vehicle friendly facilities'),
('Diana Vishneva', 'diana@vishneva.ru', '+555555', 'Fresh fruits, shugar free cola 5 bottles'),
('Nikolay Tseskaridze', 'nikolay@tseskaridze.ru', '+444444', 'Fresh fruits, shugar free cola 5 bottles')
;

SELECT * From Artist;

INSERT INTO ConcertProgram (eventID, artistID) VALUES
(4,1),
(5, 2),
(6, 4),
(6, 3);

SELECT * From ConcertProgram;

INSERT INTO Booking (eventID, tickets, completedPayment, clientsPhoneNumber, cancellationDeadline) VALUES 
(4, 90, 1,'+358000000000', '2020-02-06'),
(4, 5, 0,'+358000000111', '2020-02-05'),
(4, 1, 0,'+358011100111', '2020-02-04'),
(4, 1, 1,'+358022000111', '2020-02-05'),
(4, 2, 0,'+358088000111', '2020-02-03'),
(4, 1, 1,'+358000000111', '2020-02-02'),
(5, 1, 1,'+358005670011', '2018-03-15'),
(5, 4, 1,'+358005670761', '2018-03-15'),
(5, 1, 0,'+358005670001', '2018-02-15'),
(5, 1, 0,'+358405670001', '2018-02-15'),
(5, 3, 0,'+358005670001', '2018-02-15'),
(6, 1, 0,'+358005679871', '2019-12-12'),
(6, 1, 0,'+358005670001', '2019-12-31'),
(6, 30, 1,'+358005698701', '2020-01-01'),
(6, 5, 0,'+358000000701', '2020-01-01'),
(6, 3, 0,'+358000000701', '2020-01-01')
;

INSERT INTO Artist (artistName, artistsEmail, artistsPhone, specialRequests) VALUES
('Ed Sheeran', 'ed@sheeran.com', '+7347777', 'Vegan food'),
('ZZ top', 'zz@top.net', '+666226', 'Mohito coctails'),
('Saara Aalto', 'saaraaaalti.fi', '+5324555', 'Lohikeitto');

INSERT INTO Event (eventName, eventDate, venueID, availableSeats, price, descriprion, cancellation) VALUES 
('Ed Sheeran Europe tour', '2019-07-24', 2, 0, 100.00, 'Ed Sheeran gives a concert in his European tour', 0 ),
('Ed Sheeran Europe tour', '2019-07-25', 2, 5, 100.00, 'Ed Sheeran gives a concert in his European tou', 0 ),
('Christmas songs', '2019-12-24', 1, 200, 80.00, 'Concert by Saara Aalto', 0),
('ZZ top hits', '2019-06-06', 1, 230, 80.00, 'Music show', 0)
;

SELECT * FROM Event;
SELECT * FROM ConcertProgram;

INSERT INTO ConcertProgram (eventID, artistID) VALUES
(7,5),
(8,5),
(9, 7),
(10, 6);

INSERT INTO Booking (eventID, tickets, completedPayment, clientsPhoneNumber, cancellationDeadline) VALUES 
(7, 3500, 1,'+358065400000', '2020-07-24'),
(8, 3495, 1,'+353450000111', '2020-07-24'),
(9, 45, 0,'+358011543111', '2019-12-15'),
(9, 5, 1,'+358022000111', '2019-12-15'),
(10, 20, 1,'+358044400111', '2019-07-24')
;

INSERT INTO Event (eventName, eventDate, venueID, availableSeats, price, descriprion, cancellation) VALUES 
('Riverdance 2020', '2020-07-10', 1, 240, 100.00, 'Riverdance dance performance', 0 );

SELECT * FROM Event;
SELECT * FROM Artist;