
-- user data added
INSERT INTO users (name, email, phone, password, role)
VALUES
('Md Rasel', 'mdrasel@gmail.com', '01712345678', '123456', 'admin'),
('Abdul Karim', 'karim@gmail.com', '01811111111', '123456', 'customer'),
('Hasan Ali', 'hasan@gmail.com', '01922222222', '123456', 'customer'),
('Nusrat Jahan', 'nusrat@gmail.com', '01633333333', '123456', 'customer'),
('Rahim Uddin', 'rahim@gmail.com', '01544444444', '123456', 'customer');



-- vehicle table data 
insert into vehicles
(name, type, model, registration_number, rental_price, status)
values
('Toyota Corolla', 'car', '2020', 'DHA-1001', 3500, 'available'),
('Toyota Axio', 'car', '2019', 'DHA-1002', 3200, 'available'),
('Honda Civic', 'car', '2018', 'DHA-1003', 4000, 'available'),
('Nissan Sunny', 'car', '2017', 'CTG-2001', 2800, 'available'),
('Hyundai Elantra', 'car', '2021', 'CTG-2002', 4200, 'available'),

('Suzuki Gixxer', 'bike', '2021', 'DHK-B-3001', 1200, 'available'),
('Yamaha FZ', 'bike', '2020', 'DHK-B-3002', 1300, 'available'),
('Honda CBR 150R', 'bike', '2022', 'DHK-B-3003', 1800, 'available'),
('Bajaj Pulsar', 'bike', '2019', 'CTG-B-3004', 1100, 'available'),
('TVS Apache', 'bike', '2021', 'CTG-B-3005', 1250, 'available'),

('Toyota Hiace', 'microbus', '2018', 'DHA-M-4001', 6000, 'available'),
('Nissan Caravan', 'microbus', '2019', 'DHA-M-4002', 6500, 'available'),
('Hyundai H1', 'microbus', '2020', 'CTG-M-4003', 7000, 'available'),
('Isuzu Truck', 'truck', '2017', 'KHL-T-5001', 8000, 'available'),
('Tata Truck', 'truck', '2016', 'KHL-T-5002', 7500, 'available'),

('Mahindra Pickup', 'pickup', '2019', 'RAJ-P-6001', 5000, 'available'),
('Ford Ranger', 'pickup', '2020', 'RAJ-P-6002', 5500, 'available'),
('Mitsubishi L200', 'pickup', '2021', 'DHA-P-6003', 5800, 'available'),
('BMW X1', 'car', '2022', 'DHA-1004', 9000, 'available'),
('Toyota Premio', 'car', '2021', 'DHA-1005', 4500, 'available');


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

-- drop table bookings


insert into bookings (user_id, vehicle_id, start_date, end_date, total_cost, status)
values 
  (5, 2, '2025-03-10', '2025-03-22', 2400, 'cancelled');
(7, 1, '2025-02-01', '2025-02-03', 7000, 'confirmed'),
(6, 3, '2025-02-05', '2025-02-07', 3600, 'pending'),
(3, 2, '2025-02-10', '2025-02-12', 6400, 'confirmed'),
(4, 5, '2025-02-15', '2025-02-18', 13500, 'completed'),
(5, 4, '2025-02-20', '2025-02-22', 2400, 'cancelled');