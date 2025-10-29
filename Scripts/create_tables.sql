-- Use the target database
USE home_db;

-- Drop tables if they exist (optional, for clean reload)
DROP TABLE IF EXISTS valuation;
DROP TABLE IF EXISTS rehab;
DROP TABLE IF EXISTS hoa;
DROP TABLE IF EXISTS taxes;
DROP TABLE IF EXISTS leads;
DROP TABLE IF EXISTS property;

-- Main property table
CREATE TABLE property (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    bedrooms INT,
    bathrooms DECIMAL(3,1),
    sqft INT,
    year_built INT,
    property_type VARCHAR(50),
    status VARCHAR(50)
);

-- Leads table (linked to property)
CREATE TABLE leads (
    lead_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    lead_source VARCHAR(100),
    lead_date DATE,
    contact_name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    notes TEXT,
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE
);

-- Valuation history
CREATE TABLE valuation (
    valuation_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    valuation_date DATE,
    value DECIMAL(15,2),
    valuation_type VARCHAR(50),  
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE
);

-- Rehab/repair records
CREATE TABLE rehab (
    rehab_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    item_name VARCHAR(100),
    cost DECIMAL(12,2),
    contractor VARCHAR(100),
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE
);

-- HOA fees
CREATE TABLE hoa (
    hoa_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    HOA DECIMAL(10,2),         
    HOA_Flag VARCHAR(10),       
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE
);

-- Tax records
CREATE TABLE taxes (
    taxes_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    Taxes DECIMAL(12,2),        
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE
);