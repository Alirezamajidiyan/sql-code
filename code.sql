CREATE DATABASE IF NOT EXISTS office_automation 

USE office_automation;

CREATE TABLE Departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role_id INT NOT NULL,
    department_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES Roles(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES Departments(id) ON DELETE CASCADE
);

CREATE TABLE Letters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    status ENUM('pending', 'approved', 'rejected', 'in-progress') DEFAULT 'pending',
    priority ENUM('normal', 'high', 'critical') DEFAULT 'normal',
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES Users(id) ON DELETE CASCADE,
    INDEX (sender_id, receiver_id)
);

CREATE TABLE LetterUpdates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    letter_id INT NOT NULL,
    status ENUM('pending', 'approved', 'rejected', 'in-progress') NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT NOT NULL,
    note TEXT,
    FOREIGN KEY (letter_id) REFERENCES Letters(id) ON DELETE CASCADE,
    FOREIGN KEY (updated_by) REFERENCES Users(id) ON DELETE CASCADE,
    INDEX (letter_id, status)
);

INSERT INTO Roles (name) VALUES 
('admin'),
('manager'),
('staff');
