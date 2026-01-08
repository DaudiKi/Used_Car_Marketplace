# Car Marketplace Database

This is a simple **Car Marketplace** database system for managing users, cars, advertisements, and bids. It simulates a basic online car trading platform where sellers can list cars, and buyers can place bids.

---

## Database Structure

### Tables

1.  **Cities**
    -   `city_id` (PK)
    -   `city_name`
    -   `country`

2.  **Brands**
    -   `brand_id` (PK)
    -   `brand_name`

3.  **Models**
    -   `model_id` (PK)
    -   `model_name`
    -   `brand_id` (FK → Brands.brand_id)

4.  **Users**
    -   `user_id` (PK)
    -   `full_name`
    -   `email`
    -   `password_hash`
    -   `city_id` (FK → Cities.city_id)
    -   `role` (`buyer` or `seller`)

5.  **Cars**
    -   `vin` (PK)
    -   `model_id` (FK → Models.model_id)
    -   `year_manufacture`
    -   `mileage`
    -   `seller_id` (FK → Users.user_id)
    -   `transmission_type`

6.  **Advertisements**
    -   `advertisement_id` (PK)
    -   `car_id` (FK → Cars.vin)
    -   `title`
    -   `description`
    -   `price`

7.  **Bids**
    -   `bid_id` (PK)
    -   `ad_id` (FK → Advertisements.advertisement_id)
    -   `buyer_id` (FK → Users.user_id)
    -   `bid_amount`
    -   `bid_date`

---

## Sample Data

### Cities
- Nairobi, Mombasa, Kisumu (Kenya)  
- Kampala, Entebbe, Jinja (Uganda)  
- Dar es Salaam, Zanzibar City, Arusha (Tanzania)  
- Kigali (Rwanda), Bujumbura (Burundi), Addis Ababa (Ethiopia), Juba (South Sudan)

### Brands
- Toyota, Ford, Subaru

### Models
- Hilux (Toyota), Corolla (Toyota)  
- Explorer (Ford)  
- Forester (Subaru)

### Users
- **Kimani Roy** – Seller in Nairobi  
- **Daudi Makumbi** – Buyer in Nairobi  
- **Hussein Ahmed** – Buyer in Nairobi

### Cars
- Toyota Hilux 2020 – Automatic, 45,000 km, Seller: Kimani  
- Subaru Forester 2019 – Manual, 70,000 km, Seller: Kimani

### Advertisements
- Toyota Hilux 2020 Model (Nairobi) – Price: 3,500,000 KSh  
- Subaru Forester 2019 (Nairobi) – Price: 2,800,000 KSh

### Bids
| Bidder           | Car                     | Amount (KSh) | Date                  |
|-----------------|------------------------|--------------|---------------------|
| Daudi Makumbi    | Toyota Hilux 2020       | 3,600,000    | Auto-generated      |
| Hussein Ahmed    | Toyota Hilux 2020       | 3,700,000    | Auto-generated      |
| Daudi Makumbi    | Subaru Forester 2019    | 2,800,000    | Auto-generated      |
| Hussein Ahmed    | Subaru Forester 2019    | 2,900,000    | Auto-generated      |

---

## How to Use

1.  **Insert Users** – Ensure buyers and sellers exist.
2.  **Insert Cars** – Sellers add cars to the system.
3.  **Create Advertisements** – Link cars to ads with price and description.
4.  **Place Bids** – Buyers can bid on advertisements; each bid has a timestamp.
5.  **View Bids** – Query `Bids` to see all offers on cars.

---

## Sample Queries

**View all bids:**
```sql
SELECT 
    u.full_name AS bidder,
    a.title AS car,
    b.bid_amount,
    b.bid_date
FROM Bids b
JOIN Users u ON b.buyer_id = u.user_id
JOIN Advertisements a ON b.ad_id = a.advertisement_id;
```

---

## Authors
- Daudi Kirabo Makumbi Mawejje - 189657
- Kimani Roy Macharia - 191523
- Ahmed Hussein - 193285
