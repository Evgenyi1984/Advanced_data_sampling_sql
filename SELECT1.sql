-- Название и продолжительность самого длительного трека.
select "Название_трека", "длительность"  
from "Список_трекеров" 
WHERE "длительность" = (SELECT max("длительность") FROM "Список_трекеров");

-- Название треков, продолжительность которых не менее 3,5 минут.
select "Название_трека"  
from "Список_трекеров" 
WHERE "длительность" >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select "Название_сборника"
from "Сборник"
where "Год_выпуска" between '2018' and '2020';

-- Исполнители, чьё имя состоит из одного слова.
select "Имя_псевдоним"
from "Список_исполнителей"
where "Имя_псевдоним" not like '% %';

-- Название треков, которые содержат слово «мой» или «my»
select "Название_трека"
from "Список_трекеров" ст  
where STRING_TO_ARRAY(lower("Название_трека"), ' ') && array['my','мой'] ;

-- Количество исполнителей в каждом жанре.
SELECT "id", "Название", count("Список_исполнителей_id") as "Количество исполнителей"   
FROM "Список_музыкальных_жанров" as "s"
JOIN "Связь_исполнителей_и_жанров" as "a" ON s.id = a.Список_музыкальных_жанров_id
group by s.id 
order by s.id;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(ст.id) as "Количество исполнителей"
FROM "Список_трекеров" ст
join  "Список_альбомов" са ON ст.альбом_id=са.id
where "год_выпуска" between '2019' and '2020';

-- Средняя продолжительность треков по каждому альбому.
SELECT "Название", AVG("длительность") as "Средняя продолжительность"
FROM "Список_альбомов" as a join "Список_трекеров" as s
on a.id = s.альбом_id
group by "Название";

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT "Имя_псевдоним"
FROM "Список_исполнителей"
where "Имя_псевдоним" not in (select "Имя_псевдоним" from "Список_исполнителей" as si 
join "Связь_исполнителей_и_альбомов" as sia on si.id=sia.Список_альбомов_id 
join "Список_альбомов" as sa on si.id = sa.id where "год_выпуска"=2020);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
select distinct "Название_сборника"
from "Сборник" с join "Связь_сборника_и_трекера" ссит on с.id = ссит.Список_трекеров_id
join "Список_трекеров" ст on с.id = ст.id
join "Список_альбомов" са on с.id = са.id
join "Связь_исполнителей_и_альбомов" сиа on с.id = сиа.Список_исполнителей_id
join "Список_исполнителей" си on с.id = си.id
where "Имя_псевдоним" = 'Imagine Dragon'

