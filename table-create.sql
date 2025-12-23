
-- user table data 
create table users (
  user_id serial primary key,
  name varchar(100) not null,
  email varchar(100) unique not null check (email = lower(email)),
  phone varchar(20),
  password varchar(250) not null,
  role varchar(20) not null default 'customer' CHECK(role IN ('Admin', 'Customer'))
)


-- vehicle table data 
create table vehicles(
  vehicle_id serial primary key,
  name varchar(100) not null,
  type varchar(50) not null,
  model varchar(50) not null,
  registration_number varchar(50) unique not null,
  rental_price numeric(10, 2) not null check (rental_price > 0),
  status varchar(50) not null default 'available',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)


-- bookings table data 
CREATE TABLE bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  vehicle_id INT REFERENCES vehicles(vehicle_id) ON DELETE SET NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL CHECK(end_date >= start_date),
  total_cost NUMERIC(10,2) NOT NULL CHECK(total_cost > 0),
  status VARCHAR(20) NOT NULL CHECK(status IN ('pending','confirmed','completed','cancelled')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);