-- Step 1: Create the database
DROP DATABASE IF EXISTS client_management;
CREATE DATABASE client_management;
USE client_management;

-- Step 2: Create the tables

-- Clients table
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    company_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Contacts table (linked to clients)
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    contact_name VARCHAR(100),
    contact_role VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20),
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

-- Projects table (linked to clients)
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    project_name VARCHAR(100),
    status VARCHAR(50),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

-- Interactions table (calls, meetings, etc.)
CREATE TABLE interactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    interaction_type VARCHAR(50),
    interaction_date DATE,
    notes TEXT,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

-- Step 3: Insert sample data

-- Clients
INSERT INTO clients (name, company_name, email, phone)
VALUES
('John Doe', 'Acme Corp', 'john@acme.com', '1234567890'),
('Jane Smith', 'Globex Ltd', 'jane@globex.com', '0987654321');

-- Contacts
INSERT INTO contacts (client_id, contact_name, contact_role, contact_email, contact_phone)
VALUES
(1, 'Mike Johnson', 'Manager', 'mike@acme.com', '1112223333'),
(2, 'Sara Lee', 'CEO', 'sara@globex.com', '4445556666');

-- Projects
INSERT INTO projects (client_id, project_name, status, start_date, end_date)
VALUES
(1, 'Website Redesign', 'In Progress', '2024-01-15', NULL),
(2, 'Mobile App Development', 'Completed', '2023-06-01', '2023-12-15');

-- Interactions
INSERT INTO interactions (client_id, interaction_type, interaction_date, notes)
VALUES
(1, 'Meeting', '2024-03-01', 'Discussed new UI design'),
(2, 'Call', '2023-11-10', 'Confirmed final project delivery');

-- Step 4: Sample queries

-- View all clients
SELECT * FROM clients;

-- View client projects
SELECT c.name AS client_name, p.project_name, p.status
FROM clients c
JOIN projects p ON c.id = p.client_id;

-- View interactions in last 60 days
SELECT * FROM interactions
WHERE interaction_date >= CURDATE() - INTERVAL 60 DAY;

-- Count projects per client
SELECT c.name AS client_name, COUNT(p.id) AS project_count
FROM clients c
LEFT JOIN projects p ON c.id = p.client_id
GROUP BY c.id;
-- List all client emails and phone numbers
SELECT name, email, phone FROM clients;

-- List all project names and their status
SELECT project_name, status FROM projects;

-- List all interactions in March 2024
SELECT * FROM interactions
WHERE interaction_date BETWEEN '2024-03-01' AND '2024-03-31';

-- Show all contacts for 'Jane Smith'
SELECT co.contact_name, co.contact_email
FROM contacts co
JOIN clients cl ON co.client_id = cl.id
WHERE cl.name = 'Jane Smith';
