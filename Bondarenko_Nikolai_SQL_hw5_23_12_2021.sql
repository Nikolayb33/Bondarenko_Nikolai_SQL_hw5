-- опреаторы, фильтрация, сортировка и ограничение
/*1 Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем.*/


update users
set created_at = NOW();

update users
set updated_at = NOW();


/*2Таблица users была неудачно спроектирована.
 Записи created_at и updated_at были заданы типом VARCHAR и в них долгое 
 время помещались значения в формате 20.10.2017 8:10. 
 Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
 */
ALTER TABLE users MODIFY COLUMN created_at DATETIME NULL;


/*3 В таблице складских запасов storehouses_products в поле value могут
 *  встречаться самые разные цифры: 0, если товар закончился и выше нуля,
 *  если на складе имеются запасы. Необходимо отсортировать записи таким
 *  образом, чтобы они выводились в порядке увеличения значения value.
 * Однако нулевые запасы должны выводиться в конце, после всех записей.
 */ 
-- INSERT storehouses_products (id, value) values (1,0), (2,0), (3,0), (4,1), (5,2), (6,3), (7,4); вставка данных

SELECT * FROM storehouses_products
  ORDER BY CASE WHEN value = 0 THEN 256 ELSE value END;
 
-- агрегация данных 
-- 1 Подсчитайте средний возраст пользователей в таблице users.(подсчитал в таблице профиль)
 
SELECT AVG(timestampdiff(YEAR,birthday,now())) from profiles;

-- 2 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT week(birthday), COUNT(birthday)
from profiles group by week(birthday);
