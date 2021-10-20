CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    name_first VARCHAR(50),
    name_last VARCHAR(50),
    age INTEGER,
    card_info VARCHAR(50)
);

CREATE TABLE movie(
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    rating VARCHAR(50),
    show_start TIME
);

CREATE TABLE concession(
    concession_id SERIAL PRIMARY KEY,
    item_name VARCHAR(50),
    size VARCHAR(50),
    cost NUMERIC(3,2),
    customer_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE ticket(
    ticket_id SERIAL PRIMARY KEY,
    ticket_value NUMERIC(2,2),
    seat VARCHAR(50),
    customer_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

-- I chose to structure in this way because one person can purchase many tickets or concessions, 
-- but each ticket and individual concession can only be purchase once 
-- Similarily, each movie can have many tickets, but each ticket will only get you into one movie 
-- the movie itself does not need to be connected to the customers or the concessions, and vice versa