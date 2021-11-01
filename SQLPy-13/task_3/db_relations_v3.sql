DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'staff') THEN

      CREATE ROLE staff LOGIN PASSWORD 'example';
   END IF;
END
$do$;

SELECT 'CREATE DATABASE staff_db WITH owner staff'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'staff_db')\gexec


\c staff_db

CREATE TABLE if NOT EXISTS Staff (
    staff_id serial PRIMARY KEY,
    staff_name VARCHAR (42) NOT NULL
);

CREATE TABLE if NOT EXISTS Department (
    department_id serial PRIMARY KEY,
    department_name VARCHAR (42) UNIQUE NOT NULL,
    chief INTEGER NOT NULL REFERENCES Staff(staff_id)
);

CREATE TABLE if NOT EXISTS StaffByDepartment (
    id serial PRIMARY KEY,
    staff_id INTEGER NOT NULL REFERENCES Staff(staff_id),
    department_id INTEGER NOT NULL REFERENCES Department(department_id)
);

