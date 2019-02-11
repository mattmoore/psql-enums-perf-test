CREATE OR REPLACE FUNCTION random_enum() RETURNS user_type AS $$
  SELECT e.enumlabel::user_type
  FROM pg_type t
  JOIN pg_enum e ON e.enumtypid = t.oid
  WHERE typname='user_type'
  ORDER BY random() limit 1
$$
VOLATILE
LANGUAGE SQL;

INSERT INTO users (id, type)
SELECT generate_series(1, 10000000), random_enum();
