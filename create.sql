create table jenre (
	id serial primary key,
	name_genre varchar(30) unique not null);

create table singer (
	id serial primary key,
	name_singer varchar(40) not null);

create table jenre_singer (
	genre_id integer references jenre(id) on delete cascade on update cascade,
	singer_id integer references singer(id) on delete cascade on update cascade,
	primary key(genre_id, singer_id));

create table album (
	id serial primary key,
	name_album varchar(30) not null, 
	year integer);

create table album_singer (
	singer_id integer references singer(id) on delete cascade on update cascade,
	album_id integer references album(id) on delete cascade on update cascade,
	primary key(singer_id, album_id));

create table song (
	id serial primary key, 
	name_song varchar(30) not null, 
	duration interval not null,
	album_id integer references album (id) on delete cascade on update cascade);

create table sbornik (
	id serial primary key,
	name_sbornik varchar(30) not null, 
	year integer);
	
create table sbornik_song (
	song_id integer references song(id) on delete cascade,
	sbornik_id integer references sbornik(id) on delete cascade,
	primary key(song_id, sbornik_id));