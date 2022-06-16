-- 1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. 

select model,speed,hd
from pc
where price<500

=================================================================================

-- 2. Найдите производителей принтеров.

select distinct maker
from product
where type='printer'

=================================================================================

-- 3. Найдите номер модели, объем памяти и размеры экранов ноутбуков, цена которых превышает 1000 дол.

select model,ram,screen 
from laptop
where price>1000

=================================================================================

-- 4. Найдите все записи таблицы Printer для цветных принтеров.

select *
from printer
where color='y'

=================================================================================

-- 5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

select model,speed,hd
from pc
where cd in ('12x','24x') and price<600

=================================================================================

-- 6. Для каждого производителя, выпускающего ноутбуки c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ноутбуков. 
Вывод: производитель, скорость.

select distinct product.maker,laptop.speed 
from product join laptop
on product.model=laptop.model
where laptop.hd>=10

=================================================================================

-- 7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

select distinct product.model,laptop.price
from product join laptop
on product.model=laptop.model
where product.maker='B'
union
select distinct product.model,pc.price
from product join pc
on product.model=pc.model
where product.maker='B'
union
select distinct product.model,printer.price
from product join printer
on product.model=printer.model
where product.maker='B'

=================================================================================

-- 8. Найдите производителя, выпускающего ПК, но не ноутбуки.

select distinct maker
from product 
where type='pc'
except
select distinct maker
from product
where type='laptop'

=================================================================================

-- 9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

select distinct product.maker
from product join pc
on product.model=pc.model
where speed>=450

=================================================================================

-- 10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

select model,price
from printer
where price=(select max(price) from printer)

=================================================================================

-- 11. Найдите среднюю скорость ПК.

select avg(speed) 
from pc

=================================================================================

-- 12. Найдите среднюю скорость ноутбуков, цена которых превышает 1000 дол.

select avg(speed) 
from laptop 
where price>1000

=================================================================================

-- 13. Найдите среднюю скорость ПК, выпущенных производителем A.

select avg(speed) from pc join product 
on product.model=pc.model
where product.maker='A'

=================================================================================

-- 14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

select ships.class,ships.name,classes.country 
from ships join classes
on classes.class=ships.class
where numGuns>=10

=================================================================================

-- 15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

select hd 
from pc 
group by hd 
having count(model)>=2

=================================================================================

/*16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), 
но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM*/

select distinct pc.model,pc1.model,pc.speed,pc.ram 
from pc,pc pc1
where pc.speed=pc1.speed and pc.ram=pc1.ram and pc.model>pc1.model

=================================================================================

-- 17. Найдите модели ноутбуков, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed

select distinct product.type,laptop.model,laptop.speed
from laptop join product 
on laptop.model=product.model
where laptop.speed<ALL(select speed from pc)

=================================================================================

-- 18. Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

select distinct product.maker,printer.price
from product join printer
on product.model=printer.model
where printer.price=(select min(price) from printer where color='y') and printer.color='y'

=================================================================================

/*19. Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ноутбуков. 
Вывести: maker, средний размер экрана.*/

select distinct product.maker,avg(laptop.screen)
from product join laptop
on product.model=laptop.model
group by product.maker

=================================================================================

-- 20. Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.

select maker,count(model)
from product
where type='pc'
group by maker
having count(distinct model)>=3

=================================================================================

/*21. Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC. 
Вывести: maker, максимальная цена.*/

select distinct maker,max(price)
from product join pc
on product.model=pc.model
group by maker

=================================================================================

/*22. Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. 
Вывести: speed, средняя цена.*/

select speed, avg(price)
from pc
where speed>600
group by speed

=================================================================================

/*23. Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 
750 МГц. Вывести: Maker*/

select maker 
from product join pc
on product.model=pc.model
where pc.speed>=750
intersect
select maker 
from product join laptop
on product.model=laptop.model
where laptop.speed>=750

=================================================================================

-- 24. Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.

with model_max_price as 
(select model, price from pc where price = (select max(price) from pc)
union
select model, price from laptop where price = (select max(price) from laptop)
union
select model, price from printer where price = (select max(price) from printer))
select model from model_max_price where price = (select max(price) from model_max_price)

=================================================================================

-- 25. Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker

select distinct maker
from product join pc 
on product.model = pc.model
where pc.ram = (select min(ram) from pc)
and pc.speed = (select max(speed) from pc where ram = (select min(ram) from pc)) and product.maker in (select maker from product where type = 'printer')

=================================================================================

-- 26. Найдите среднюю цену ПК и ноутбуков, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.

select avg(price) 
from (select price 
 from pc 
 where model in (select model from product where maker='A' and type='pc')
 union all
 select price 
 from laptop 
 where model in (select model from product where maker='A' and type='laptop')) 
 as result

=================================================================================

/*27. Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. 
Вывести: maker, средний размер HD.*/

select product.maker,avg(pc.hd) 
from product join pc
on product.model=pc.model
where maker in(select maker from product where type='printer')
group by product.maker

=================================================================================

-- 28. Используя таблицу Product, определить количество производителей, выпускающих по одной модели.

select count(maker)
from product
where maker in(select maker from product group by maker having count(model) = 1)

=================================================================================

/*29. В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)],
написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.*/

select income_o.point,income_o.date,inc,out
from income_o left join outcome_o 
on income_o.point = outcome_o.point and income_o.date = outcome_o.date
union
select outcome_o.point,outcome_o.date,inc,out
from income_o right join outcome_o 
on income_o.point = outcome_o.point and income_o.date = outcome_o.date

=================================================================================

/*30. В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).*/

select point,date,sum(summa_o),sum(summa_i)
from (select point,date,sum(inc) as summa_i,null as summa_o
from Income 
group by point,date
union
select point,date,null as summa_i,sum(out) as summa_o 
from Outcome 
group by point,date) 
as result
group by point,date 
order by point

=================================================================================


