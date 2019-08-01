CREATE DATABASE skillsocial;

\c skillsocial

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    username VARCHAR(200) UNIQUE NOT NULL,
    password_digest VARCHAR(1000) NOT NULL,
    image_url VARCHAR(200),
    email VARCHAR(200) UNIQUE NOT NULL,
    phone VARCHAR(50),
    about_me VARCHAR(2000),
    skills text,
    interests text 
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    date_time timestamptz,
    location VARCHAR(200) NOT NULL,
    description VARCHAR(1000)
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