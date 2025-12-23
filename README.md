# 🚗 Vehicle Rental System - Database Design & SQL Queries

## 📖 Project Overview

The Vehicle Rental System is a simplified database project designed to manage vehicle rentals efficiently. It focuses on tracking users, vehicles, and bookings while ensuring proper data relationships, constraints, and querying capabilities.

The system supports operations such as checking vehicle availability, managing bookings, and generating rental reports.

| Entity       | Description                                                                      |
| ------------ | -------------------------------------------------------------------------------- |
| **Users**    | Customers and administrators with roles, contact info, and unique email accounts |
| **Vehicles** | Cars, bikes, and trucks with rental pricing and availability status              |
| **Bookings** | Rental reservations linking users to vehicles with dates, status, and costs      |

---

### 🔗 Entity Relationships

- **One-to-Many**: User → Bookings (A user can have multiple bookings)
- **Many-to-One**: Bookings → Vehicle (Multiple bookings can reference vehicles)
- **One-to-One (logical)**: Each booking connects exactly one user and one vehicle

---

## 🏗️ Database Schema Design

### Users Table

| Column   | Type         | Constraints                      |
| -------- | ------------ | -------------------------------- |
| user_id  | INT          | PRIMARY KEY                      |
| name     | VARCHAR(100) | NOT NULL                         |
| email    | VARCHAR(100) | UNIQUE, NOT NULL                 |
| password | VARCHAR(255) | NOT NULL CHECK (Password Length) |
| phone    | VARCHAR(15)  | NOT NULL                         |
| role     | VARCHAR(50)  | CHECK ('Admin', 'Customer')      |

### Vehicles Table

| Column              | Type          | Constraints                                  |
| ------------------- | ------------- | -------------------------------------------- |
| vehicle_id          | INT           | PRIMARY KEY                                  |
| name                | VARCHAR(255)  | NOT NULL                                     |
| type                | VARCHAR(25)   | NOT NULL CHECK ('car', 'bike', 'truck')      |
| model               | VARCHAR(50)   | NOT NULL                                     |
| registration_number | VARCHAR(255)  | UNIQUE, NOT NULL                             |
| rental_price        | DECIMAL(10,2) | NOT NULL CHECK (rental_price > 0)            |
| status              | VARCHAR(50)   | CHECK ('available', 'rented', 'maintenance') |

### Bookings Table

| Column     | Type          | Constraints                                                       |
| ---------- | ------------- | ----------------------------------------------------------------- |
| booking_id | INT           | PRIMARY KEY                                                       |
| user_id    | INT           | FOREIGN KEY → users(user_id)                                      |
| vehicle_id | INT           | FOREIGN KEY → vehicles(vehicle_id)                                |
| start_date | DATE          | NOT NULL                                                          |
| end_date   | DATE          | NOT NULL CHECK (end_date > start_date)                            |
| status     | VARCHAR(20)   | NOT NULL CHECK ('pending', 'confirmed', 'completed', 'cancelled') |
| total_cost | DECIMAL(10,2) | NOT NULL CHECK (total_cost > 0)                                   |

---

## 📊 Entity-Relationship Diagram (ERD)

The ERD visually represents the relationships and constraints between tables.

**ERD Features:**

- Primary keys (PK)
- Foreign keys (FK)
- Relationship cardinality
- Status fields (booking status, vehicle availability)

---

## 📝 SQL Queries

The project includes SQL queries for common operations:

1. **JOIN**: Retrieve booking information along with customer and vehicle names.

```sql query

SELECT
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status
FROM
  bookings AS b
  INNER JOIN users AS u ON b.user_id = u.user_id
  INNER JOIN vehicles AS v ON b.vehicle_id = v.vehicle_id;
```

2. **EXISTS / NOT EXISTS**: Find vehicles that have never been booked.

```sql query
SELECT
    *
FROM
    vehicles AS v
WHERE
    NOT EXISTS (
        SELECT
            b.vehicle_id
        FROM
            bookings AS b
        WHERE
            b.vehicle_id = v.vehicle_id
    )
ORDER BY
    vehicle_id ASC;
```

3. **WHERE**: Retrieve available vehicles of a specific type.

```sql query
SELECT
    *
FROM
    vehicles
WHERE
    status = 'available'
    AND type = 'car';
```

4. **GROUP BY & HAVING**: Find vehicles with more than 2 bookings.

```sql query
SELECT
    v.name AS vehicle_name,
    count(b.booking_id) AS total_bookings
FROM
    vehicles AS v
    INNER JOIN bookings AS b ON b.vehicle_id = v.vehicle_id
GROUP BY
    (v.name, v.vehicle_id)
HAVING
    count(b.booking_id) > 2;
```

Refer to `queries.sql` for detailed query solutions.

---

## 📁 Project Structure

```

assaignment-3/
├── db-create.sql # Database Create queries
├── queries.sql # SQL schema and queries
├── insert.sql # Sample data for testing
├── table-create.sql # Table create queries
├── README.md # Project documentation

```

---

## 🔗 Submission Links

| Resource              | Link                  |
| --------------------- | --------------------- |
| **GitHub Repository** | [GitHub Repo][github] |
| **ERD Diagram**       | [ERD Link][erd]       |
| **Viva Video**        | [Viva Video][viva]    |

[github]: https://github.com/monir6163/assaignment-3
[erd]: https://lucid.app/lucidchart/84be5669-16a7-4e40-b426-820fa537741f/edit?viewport_loc=-951%2C-406%2C1995%2C844%2C0_0&invitationId=inv_b0c16ffa-cdd3-41f3-a5fd-fa4e3c026ffd
[viva]: https://drive.google.com/drive/folders/

---

## 👤 Author

- **Monir Hossain**
- Email: monirhossain6163@gmail.com
- GitHub: [monir6163](https://github.com/monir6163)
- LinkedIn: [Monir Hossain](https://www.linkedin.com/in/monirweb/)

---
