1.Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd 
SELECT model, speed, hd
FROM PC
WHERE price < 500
===========================================
2.Найдите производителей принтеров. Вывести: maker 
SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer'
===========================================
3.Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол 
SELECT model, ram, screen
FROM laptop
WHERE price > 1000
===========================================
4.Найдите все записи таблицы Printer для цветных принтеров
SELECT *
FROM printer
WHERE color = 'y'
===========================================
5.Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол
SELECT model, speed, hd
FROM pc
WHERE cd IN ('12x', '24x')
AND price < 600
==========================================
6.Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость
SELECT DISTINCT Product.maker, Laptop.speed
FROM Product, Laptop 
WHERE Product.model = Laptop.model 
AND Laptop.hd >= 10
==========================================
7.Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква)
SELECT model, price
FROM laptop
WHERE model IN (SELECT model
FROM product
WHERE maker = 'B')
UNION
SELECT model, price
FROM pc
WHERE model IN (SELECT model
FROM product
WHERE maker = 'B')
UNION
SELECT model, price
FROM printer
WHERE model IN (SELECT model
FROM product
WHERE maker = 'B')
==========================================
8.Найдите производителя, выпускающего ПК, но не ПК-блокноты
SELECT maker
FROM product
WHERE type = 'pc'
EXCEPT
SELECT maker
FROM product
WHERE type = 'laptop'
==========================================
9.Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker 
SELECT DISTINCT maker
FROM product
WHERE model IN (
SELECT model
FROM pc
WHERE speed >= 450)
==========================================
10.Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price 
SELECT model, price
FROM printer
WHERE price = (
SELECT MAX(price)
FROM printer)
==========================================
11.Найдите среднюю скорость ПК
SELECT AVG(speed)
FROM pc
==========================================
12.Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT AVG(speed)
FROM laptop
WHERE price > 1000
==========================================
13.Найдите среднюю скорость ПК, выпущенных производителем A
SELECT AVG(speed)
FROM pc
WHERE model IN (
SELECT model
FROM product
WHERE maker = 'A')
==========================================
14.Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий
SELECT ships.class, ships.name, classes.country
FROM classes INNER JOIN
ships ON ships.class = classes.class
WHERE numGuns >= 10
==========================================
15.Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD 
SELECT DISTINCT hd
FROM pc
GROUP BY hd
HAVING COUNT(code) > 1
==========================================
16.Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM
select distinct a.model as big_model, b.model as small_model, a.speed, a.ram
from pc as a, pc as b
where a.speed = b.speed
and a.ram = b.ram
and a.model > b.model
==========================================
17.Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
SELECT DISTINCT product.type, laptop.model, laptop.speed
FROM product, laptop
WHERE laptop.speed < (
SELECT MIN(speed)
FROM pc)
AND product.type = 'laptop'
==========================================
18.Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price 
SELECT DISTINCT product.maker, printer.price
FROM product INNER JOIN
printer ON printer.model = product.model
WHERE printer.price = (
SELECT MIN(price)
FROM printer
WHERE printer.color = 'y')
AND printer.color = 'y'
==========================================
19.Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана
SELECT maker, AVG(screen)
FROM product INNER JOIN
laptop ON laptop.model = product.model
GROUP BY maker
=========================================
20.Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК
SELECT maker, COUNT(model)
FROM product
WHERE type = 'pc'
GROUP BY maker
HAVING COUNT(model) >=3
=========================================
21.Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена
SELECT maker, MAX(pc.price)
FROM product INNER JOIN
pc ON pc.model = product.model
GROUP BY maker
========================================
22.Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена
SELECT speed, AVG(price) AS AVG_price
FROM pc
WHERE speed > 600
GROUP BY speed
========================================
23.Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker 
SELECT maker
FROM product
WHERE model IN (
SELECT model
FROM laptop
WHERE speed >= 750)
INTERSECT
SELECT maker
FROM product
WHERE model IN (
SELECT model
FROM pc
WHERE speed >= 750)
=========================================
24.Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции
with models as (
select pc.model, pc.price
from pc
union
select laptop.model, laptop.price
from laptop
union
select printer.model, printer.price
from printer )
select model
from models
where price = (
select max(price)
from models)
==========================================

