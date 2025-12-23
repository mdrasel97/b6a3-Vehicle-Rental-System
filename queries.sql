-- join data 
select
  b.booking_id,
  u.name as customer_name,
  v.name as vehicle_name,
  b.start_date,
  b.end_date,
  b.status
from
  bookings as b
  INNER JOIN users AS u ON b.user_id = u.user_id
  INNER JOIN vehicles AS v ON b.vehicle_id = v.vehicle_id;


  -- exists 
SELECT
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  v.rental_price,
  v.status
FROM vehicles v
WHERE NOT EXISTS (
  SELECT b.vehicle_id
  FROM bookings as b
  WHERE b.vehicle_id = v.vehicle_id
);


-- where 
SELECT
    *
FROM
    vehicles
WHERE
    status = 'available'
    AND type = 'car';


-- group 
SELECT
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM vehicles AS v
INNER JOIN bookings AS b
    ON b.vehicle_id = v.vehicle_id
GROUP BY v.vehicle_id, v.name
HAVING COUNT(b.booking_id) > 2;