CREATE TABLE users (
    user_id serial primary key,
    full_name varchar(50),
    email varchar(100) unique,
    role varchar(20) check (role in ('Ticket Manager', 'Football Fan')),
    phone_number int
);

CREATE TABLE matches (
    match_id serial primary key,
    fixture varchar(150),
    tournament_category varchar(200),
    base_ticket_price decimal(10, 2) check (base_ticket_price >= 0),
    match_status varchar(50) check (match_status in ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);


CREATE TABLE bookings (
    booking_id serial primary key,
    user_id int references users(user_id),
    match_id int references matches(match_id),
    seat_number varchar(10),
    payment_status varchar(50) check (payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
    total_cost decimal(10, 2) check (total_cost >= 0)
);







