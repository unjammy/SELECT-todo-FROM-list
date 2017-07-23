DROP USER IF EXISTS micheal;

CREATE USER micheal WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\connect todo_app

CREATE SEQUENCE auto_incrementing start 1 increment 1;

CREATE TABLE tasks (

  id INTEGER NOT NULL DEFAULT nextval('auto_incrementing'),
  title VARCHAR(255) NOT NULL,
  description text,
  created_at time without time zone NOT NULL DEFAULT NOW(),
  updated_at time without time zone,
  completed boolean NOT NULL DEFAULT false,
  CONSTRAINT tasks_pk PRIMARY KEY (id)

);

ALTER TABLE tasks DROP COLUMN completed;
ALTER TABLE tasks ADD COLUMN completed_at time without time zone DEFAULT NULL;
ALTER TABLE tasks ALTER updated_at SET DEFAULT NOW();
ALTER TABLE tasks ALTER updated_at SET NOT NULL;

INSERT INTO tasks VALUES (0, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description) VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';

SELECT title FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');
INSERT INTO tasks (title, description) VALUES ('mistake 2', 'another test entry');
INSERT INTO tasks (title, description) VALUES ('third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';