DROP TABLE bookings;
DROP TABLE gym_classes;
DROP TABLE members;

CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  membership_type VARCHAR(255)
);

CREATE TABLE gym_classes(
 id SERIAL8 PRIMARY KEY,
 gymclass_name VARCHAR(255),
 description VARCHAR(255),
 instructor VARCHAR(255),
 cost INT4,
 classtime TIME
);

CREATE TABLE bookings(
   id SERIAL8 PRIMARY KEY,
   member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
   gym_class_id INT8 REFERENCES gym_classes(id) ON DELETE CASCADE
 );
