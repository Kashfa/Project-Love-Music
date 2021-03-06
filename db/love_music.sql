DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  quantity INT4,
  buy_price INT4,
  sell_price INT4,
  artist_id INT4 REFERENCES artists(id)
);

CREATE TABLE stock (
id SERIAL4 PRIMARY KEY,
album_id INT4 REFERENCES albums(id),
stock_level INT4
);
