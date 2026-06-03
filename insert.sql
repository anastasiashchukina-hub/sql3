insert into jenre (name_genre) values
	('Rock'), ('Pop'), ('Jazz');

insert into singer (name_singer) values 
	('Queen'), ('Freddie Mercury'), ('Madonna'), ('Miles');

insert into jenre_singer (genre_id, singer_id) values
	(1, 1), (1, 2), (2, 3), (3, 4);

insert into album (name_album, year) values 
	('A night at the opera', 1975),
	('Like a prayer', 1989), 
	('kind of blue', 1959);

insert into album_singer (singer_id, album_id) values 
	(1, 1), (2, 1), (3, 2), (4, 3);

insert into song (name_song, duration, album_id) values 
	('Bohemian', '00:05:55', 1),
	('love of my life', '00:03:39', 1),
	('like a prayer', '00:05:39', 2),
	('Express Yourself', '00:04:39', 2),
	('So What', '00:09:22', 3),
	('Freddie Freeloader', '00:09:46', 3);

insert into sbornik (name_sbornik, year) values 
	('Rock Classics', 2018),      
        ('80s Hits', 2019),           
        ('Jazz Legends', 2020),       
        ('My Favorite Songs', 2021);

insert into sbornik_song (song_id, sbornik_id) values
	(1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3), (2, 4), (3, 4);