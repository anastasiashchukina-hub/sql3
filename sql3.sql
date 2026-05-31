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

--Название и продолжительность самого длительного трека.
select name_song, duration 
from song
where duration = (select max(duration) from song);

--Название треков, продолжительность которых не менее 3,5 минут.
select name_song
from song
where duration >= '00:03:30'
order by duration;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name_sbornik
from sbornik
where year between 2018 and 2020;

--Исполнители, чьё имя состоит из одного слова.
select name_singer
from singer 
where name_singer not like '% %';

--Название треков, которые содержат слово «мой» или «my»
select name_song
from song
where lower(name_song) like '%my%' or lower(name_song) like '%мой%';

--Количество исполнителей в каждом жанре.
select name_genre, count(*) as Количество
from jenre j join jenre_singer js on j.id = js.genre_id
join singer s on s.id = js.singer_id
group by name_genre;
 
--Количество треков, вошедших в альбомы 2019–2020 годов
select count(*) as Количество
from song s join album a on a.id = s.album_id
where a.year between 2019 and 2020;

--Средняя продолжительность треков по каждому альбому
select name_album, avg(duration) as "Средняя продолжительность"
from song s join album a on a.id = s.album_id
group by name_album;

--Все исполнители, которые не выпустили альбомы в 2020 году
select name_singer 
from singer s 
where s.id not in (select distinct s.id 
		from singer s join album_singer als on s.id = als.singer_id
		join album a on a.id = als.album_id
		where a.year = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель (Queen)
select distinct name_sbornik 
from sbornik sb
join sbornik_song ss on sb.id = ss.sbornik_id
join song so on ss.song_id = so.id
join album a on so.album_id = a.id
join album_singer a_s on a.id = a_s.album_id
where a_s.singer_id = 1;
