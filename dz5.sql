DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

-- таблица музыкальных жанров
DROP TABLE IF EXISTS genres;
CREATE TABLE genres(
	id SERIAL PRIMARY KEY,
    genre INT UNSIGNED NOT NULL,
    
    INDEX (genre)
);
