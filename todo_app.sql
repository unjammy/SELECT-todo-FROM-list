DROP USER IF EXISTS micheal;

CREATE USER micheal WITH ENCRYPTED_PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\connect todo_app

CREATE TABLE tasks (

  id INTEGER,
  title VARCHAR(45) NOT NULL,
  description VARCHAR(150),
  created_at = time without timezone NOT NULL DEFAULT NOW(),
  updated_at = time without timezone NOT NULL DEFAULT NOW(),
  completed_at = time DEFAULT NULL,
  CONSTRAINT tasks_pk PRIMARY KEY (id)

);
