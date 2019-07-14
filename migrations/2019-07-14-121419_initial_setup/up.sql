CREATE TYPE UserStatus AS ENUM ('pending','active','inactive','removed');
CREATE TABLE users (
  user_id serial PRIMARY KEY,
  user_name VARCHAR(64) UNIQUE NOT NULL CHECK (user_name <> ''),
  password VARCHAR(64) NOT NULL CHECK (password <> ''),
  status UserStatus NOT NULL DEFAULT 'pending',
  email VARCHAR(355) UNIQUE NOT NULL CHECK (email <> ''),
  real_name VARCHAR(128) NOT NULL CHECK (real_name <> ''),
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  active_time TIMESTAMP,
  inactive_time TIMESTAMP,
  remove_time TIMESTAMP,
  modify_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE TYPE LocationStatus AS ENUM ('draft','active','inactive','removed');;
CREATE TABLE locations (
  location_id serial PRIMARY KEY,
  user_id INTEGER NOT NULL,
  visit_id INTEGER NOT NULL,
  status LocationStatus NOT NULL DEFAULT 'draft',
  title VARCHAR(128),
  lat NUMERIC(11,8) NOT NULL,
  long NUMERIC(11,8) NOT NULL,
  description TEXT,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  post_time TIMESTAMP,
  unpost_time TIMESTAMP,
  modify_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TYPE RatingStatus AS ENUM ('draft','active','inactive','removed');
CREATE TABLE ratings (
  rating_id serial PRIMARY KEY,
  location_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  visit_id INTEGER NOT NULL,
  status RatingStatus NOT NULL DEFAULT 'draft',
  rating INTEGER NOT NULL CHECK (rating >= 0 AND rating <=5),
  comments TEXT,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  post_time TIMESTAMP,
  unpost_time TIMESTAMP,
  modify_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE TABLE visits (
  visit_id serial PRIMARY KEY,
  location_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  visit_time TIMESTAMP,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  modify_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE TYPE PhotoStatus AS ENUM ('active','inactive','removed');
CREATE TABLE photos (
  photo_id serial PRIMARY KEY,
  location_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  visit_id INTEGER NOT NULL,
  status PhotoStatus NOT NULL DEFAULT 'active',
  title VARCHAR(128) NOT NULL,
  description TEXT,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  post_time TIMESTAMP,
  unpost_time TIMESTAMP,
  modify_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TYPE LikeStatus AS ENUM ('active','inactive','removed');
CREATE TABLE likes (
  like_id serial PRIMARY KEY,
  photo_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  status LikeStatus NOT NULL DEFAULT 'active',
  comments TEXT,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  post_time TIMESTAMP,
  unpost_time TIMESTAMP,
  modify_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
