CREATE ROLE your_username WITH LOGIN PASSWORD 'your_password';
CREATE DATABASE db_ordira OWNER your_username;
GRANT ALL PRIVILEGES ON DATABASE db_ordira TO your_username;
