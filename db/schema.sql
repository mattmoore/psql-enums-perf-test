DROP TABLE IF EXISTS users;
DROP TYPE IF EXISTS user_type CASCADE;

CREATE TYPE user_type AS ENUM ('sad', 'happy', 'bad');
CREATE TABLE users (
  id BIGSERIAL,
  type user_type
);
