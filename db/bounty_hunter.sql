DROP TABLE IF EXISTS bounty_hunters;

CREATE TABLE bounty_hunters (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT2,
  homeworld VARCHAR(255)
);
