/*CRATE INDEXES*/

CREATE INDEX artist_name ON Artist(artistName);

CREATE INDEX artist_phone ON Artist(artistsPhone);

CREATE INDEX artist_email ON Artist(artistsEmail);

CREATE INDEX event_name ON Event(eventName);

CREATE INDEX event_date ON Event(eventDate);

CREATE INDEX booking_clients_phone ON Booking(clientsPhoneNumber);