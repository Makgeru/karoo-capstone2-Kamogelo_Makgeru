-- Schema and test data for Karoo Audit
CREATE TABLE IF NOT EXISTS sales_target (region_id INTEGER PRIMARY KEY, region TEXT, quarter INTEGER, year INTEGER, target_amount FLOAT);
CREATE TABLE IF NOT EXISTS suppliers (supplier_id INTEGER PRIMARY KEY, region_id INTEGER, farm_name TEXT, phone_number TEXT, email_address TEXT, status TEXT DEFAULT 'Active');
CREATE TABLE IF NOT EXISTS orders (order_id INTEGER PRIMARY KEY, supplier_id INTEGER, order_date DATE, total_price FLOAT);
CREATE TABLE IF NOT EXISTS certification (cert_id INTEGER PRIMARY KEY, supplier_id INTEGER, cert_name TEXT, expiry_date DATE);
CREATE TABLE IF NOT EXISTS harvest (harvest_id INTEGER PRIMARY KEY, supplier_id INTEGER, crop_name TEXT, harvest_date DATE, yield_kg FLOAT);

INSERT OR IGNORE INTO suppliers VALUES (1, 3, 'Karoo Lamb Estate', '0211515121', 'karoo@gmail.com', 'Active');
INSERT OR IGNORE INTO sales_target VALUES (1, 'Western Cape', 4, 2025, 50000);
