-- DROP DATABASE IF EXISTS skillsocial;
-- CREATE DATABASE skillsocial;
-- dropdb skillsocial
-- createdb skillsocial
-- psql skillsocial < schema.sql

-- \c skillsocial

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    username VARCHAR(200) UNIQUE NOT NULL,
    password_digest VARCHAR(1000) NOT NULL,
    image_url VARCHAR(200),
    email VARCHAR(200) UNIQUE NOT NULL,
    phone VARCHAR(50),
    about_me VARCHAR(2000),
    skills VARCHAR(1000),
    interests VARCHAR(1000)
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    date_time timestamptz,
    location VARCHAR(200) NOT NULL,
    description VARCHAR(1000),
    image_url VARCHAR(1000),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE RESTRICT
);

CREATE TABLE event_subscriptions (
    id SERIAL PRIMARY KEY,
    subscribed_user_id INTEGER,
    subscribed_event_id INTEGER,
    FOREIGN KEY (subscribed_user_id) REFERENCES users (id),
    FOREIGN KEY (subscribed_event_id) REFERENCES events (id)
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    body VARCHAR(2000),
    rating INTEGER,
    student_id INTEGER,
    teacher_id INTEGER,
    created_at timestamptz,
    FOREIGN KEY (teacher_id) REFERENCES users (id),
    FOREIGN KEY (student_id) REFERENCES users (id)
);
