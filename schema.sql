CREATE DATABASE skillsocial;

\c skillsocial

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    username VARCHAR(200) UNIQUE NOT NULL,
    password_digest VARCHAR(1000) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    phone VARCHAR(50),
    skills VARCHAR(1000),
    interests VARCHAR(1000)
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    event_name VARCHAR(200) NOT NULL,
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    event_location VARCHAR(200) NOT NULL,
    event_description VARCHAR(1000)
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    content VARCHAR(1000) NOT NULL,
    user_id INTEGER,
    event_id INTEGER
);

CREATE TABLE feedback (
    id SERIAL PRIMARY KEY,
    receiver_id INTEGER,
    giver_id INTEGER,
    rating INTEGER
);