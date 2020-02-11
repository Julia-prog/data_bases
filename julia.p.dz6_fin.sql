
DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;


/*
 * Пусть задан некоторый пользователь.
 * Из всех друзей этого пользователя найдите человека, 
 * который больше всех общался с нашим пользователем.
 */
    
ALTER TABLE messages
ADD COLUMN friend  BIGINT default NULL;
UPDATE messages
	SET friend = to_user_id 
WHERE 
	from_user_id = 2;   
UPDATE messages
	SET friend = from_user_id 
WHERE 
	to_user_id = 2;   
SELECT firstname,lastname FROM users 
	WHERE id = (SELECT friend FROM messages GROUP BY friend ORDER BY COUNT(friend) DESC LIMIT 1);   

/*
Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
 */
SELECT COUNT(*)
	FROM likes
WHERE user_id IN 
	(SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10);

/*
 * Определить кто больше поставил лайков (всего) - мужчины или женщины?
 */

SELECT gender, COUNT(gender) FROM `profiles` WHERE user_id IN (SELECT id FROM likes) GROUP BY gender; 
