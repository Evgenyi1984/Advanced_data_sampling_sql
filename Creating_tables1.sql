CREATE TABLE IF NOT EXISTS Список_музыкальных_жанров (
	id SERIAL PRIMARY KEY,
	Название VARCHAR(180) NOT NULL
);

CREATE TABLE IF NOT EXISTS Список_исполнителей (
	id SERIAL PRIMARY KEY,
	Имя_псевдоним VARCHAR(180) NOT NULL
	);


CREATE TABLE IF NOT EXISTS Список_альбомов (
	id SERIAL PRIMARY KEY,
	Название VARCHAR(180) NOT NULL,
	год_выпуска integer check (год_выпуска > '1900')
);



CREATE TABLE IF NOT EXISTS Список_трекеров (
	id SERIAL PRIMARY key ,
	альбом_id int REFERENCES Список_альбомов(id),
	Название_трека VARCHAR(180) NOT NULL,
	длительность INTEGER not NULL
);

CREATE TABLE IF NOT exists Сборник (
	id SERIAL PRIMARY KEY,
	Название_сборника VARCHAR(180) NOT null,
	Год_выпуска integer CHECK (Год_выпуска > '1900')
	);

CREATE TABLE IF NOT EXISTS Связь_исполнителей_и_жанров (
	Список_музыкальных_жанров_id INTEGER REFERENCES Список_музыкальных_жанров(id),
	Список_исполнителей_id INTEGER REFERENCES Список_исполнителей(id),
	CONSTRAINT iz PRIMARY KEY (Список_музыкальных_жанров_id, Список_исполнителей_id)
);

CREATE TABLE IF NOT EXISTS Связь_исполнителей_и_альбомов (
	Список_исполнителей_id INTEGER REFERENCES Список_исполнителей(id),
	Список_альбомов_id INTEGER REFERENCES Список_альбомов(id),
	CONSTRAINT ia PRIMARY KEY (Список_исполнителей_id, Список_альбомов_id)
);

CREATE TABLE IF NOT EXISTS Связь_сборника_и_трекера (
	Сборник_id INTEGER REFERENCES Сборник(id),
	Список_трекеров_id INTEGER REFERENCES Список_трекеров(id),
	CONSTRAINT it PRIMARY KEY (Сборник_id, Список_трекеров_id)
);
