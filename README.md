# Database Design and Development project
Welcome to the Database Design and Development prject.

This project was completed in 2019 for the Database Design course as a part of studies in Haaga-Helia AMK. 
The project was updated in Jan 2025 in order to improve it's structure readability.

## Project navigation:

[/Requirements](https://github.com/ndrsonya/database_development_project/tree/master/requirements) - contains document with the detailed task and caserequirements

[/Reports](https://github.com/ndrsonya/database_development_project/tree/master/reports) - contains project reports, including ER diagrams, relational tables description,  

[/SQL](https://github.com/ndrsonya/database_development_project/tree/master/SQL) files with actual code to create tables, insert data and 


### THE STUDY CASE - Cardiff Festival Association
The Cardiff Festival Association is an association organizing concerts, dance and theatre performances
and other cultural events. So far, tickets have been sold in person at the Cardiff library. Now the
association is keen on offering web pages, where clients could see upcoming events and book tickets.
When a client makes a booking he/she should get a unique booking number. The booked tickets
should still be purchased at Cardiff Library within three days from booking.

Further details
 The Cardiff Festival Association has two venues to hold its events. The smaller hall accommodates
250 people. The larger hall accommodates 3500 people. It is possible that other venues may
become available in the future.
 The seats are not numbered.
 The fire safety regulations do not allow any overbooking.
 All tickets to a certain event are sold at the same price.
 Different events may be priced differently.
 An event can also include performances from several different artists.
 Popular performers visit Cardiff often. The Cardiff Festival Association has an extensive registry of
artists – domestic and foreign – with their contact information (email, phone) and special requests
for catering and refreshments.
 The booked tickets are identified and purchased by booking number.
 A booking can only contain tickets to one event.
 A booking can be cancelled, unless it has already been already purchased (payed for).
 The number of tickets in a booking can be changed, unless the tickets are already purchased.
 Once the tickets are purchased, they can neither be changed nor refunded (except for event
cancellation).
 If the event is cancelled, the client can receive a refund of the amount paid for the ticket. The
refund is given in person at Cardiff Library.
 All the tickets included in the same booking must be purchased at the same time.
 Only the client's phone number is registered in a booking. No other client information is stored in
the database.



The new database application should help to complete the tasks (user transactions) listed below1
.

1. Booking a ticket
2. Cancelling a ticket booking
3. Changing the number of tickets in a booking
4. Changing the status of booking to sold when tickets are purchased (the booking is payed for)
5. Removing the unpurchased bookings from the database after three days from booking2
.

6. Cancelling an event (in an extreme exceptional case)
7. Refunding a client in a case of a cancelled event.
Examples of the queries (user transactions) the new application should support are the following:
1. What is Ed Sheeran’s contact email?
2. What dance performances are coming up next month?
3. What concerts are coming up this month?
4. When will Saara Aalto

3 perform in Cardiff and what are her special requests for catering?
5. How many tickets have been sold to Riverdance's dance performance ''Riverdance 2020" that
takes place on 10.7.2020?
6. How many tickets are there left for ZZ Top's4

concert on 22.1.2020?

7. How much money has the Cardiff Festival Association got from sold tickets this year?
8. Which artist has sold the highest number of tickets this year. Please notice that the artist can have
performed several times this year. All the artist's performances count here.
NB! In this case assignment, you will use the user transactions mentioned above to
1. Validate the design of the database
2. Test the physical implementation of the database.



	
*All documents were done by Sofia Altusar-Anderson                 *
*December 2019, Haaga-Helia UAS,Database development and management*
