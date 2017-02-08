DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists
(
  id SERIAL2 primary key,
  name VARCHAR(255) not null
 
);

CREATE TABLE albums
(
  id SERIAL8 primary key,
  title VARCHAR(255) not null,
  artist_id int2 references artists(id),
  genre VARCHAR(255),
  quantity INT4
);

