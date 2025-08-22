-- Initialize test database and user
CREATE DATABASE IF NOT EXISTS yrtuber_testing;
CREATE USER IF NOT EXISTS 'testuser'@'%' IDENTIFIED BY 'testpassword';
GRANT ALL PRIVILEGES ON yrtuber_testing.* TO 'testuser'@'%';
FLUSH PRIVILEGES;
