/*Select pc.model, price
from pc
UNION
Select printer.model, price
from printer
UNION
Select laptop.model, price
from laptop
inner join product
on laptop.model = product.model
where product.maker='B'*/



7
Select u.model, u.price
from (
select pc.model, price from pc
UNION
Select printer.model, price from printer
UNION
Select laptop.model, price from laptop
) AS u
JOIN product t on u.model=t.model
WHERE t.maker='B'
-----------------------
8
select distinct maker
from product as p
where p.type in ('pc')
except
select distinct maker
from product as p
where p.type in ('laptop')

9
Select distinct maker
from product as p
join pc o on p.model = o.model
where o.speed >='450'

10
Select model, price
from printer
where price in
(select max(price) from printer)

11
Select avg(speed)
from pc

12
Select avg(speed)
from laptop as l
where l.price > 1000

13
select avg(speed) from product as p 
join pc o on p.model = o.model
where p.maker='A'

14
select s.class, name, country
from ships as s
inner join classes c on c.class = s.class
where c.numGuns >= 10

15
select hd
from pc
group by hd
having count(*)>1

16
Select distinct a.model, b.model, a.speed, a.ram
from pc as A, pc B
where a.speed = b.speed
and a.ram = b.ram
AND b.model < a.model
order by a.model

17
Select distinct product.type, laptop.model, laptop.speed
from laptop, pc, product
WHERE laptop.speed < ALL
(select speed from pc)
AND product.type='Laptop'

-----
18 mistakes
/*Select distinct maker, product.type, (select min(price)
from printer
) as price 
from product
join printer p on p.model = product.model
where p.color='y'
---
Select distinct maker, (select min(price)
from printer
where printer.color='y'
) as price
from printer
inner join product p on p.model = printer.model
----
Select min(price) as min_price
from (
    select price
    FROM printer
    inner join product p on p.model = printer.model
    WHERE printer.color='y'
) as sub
----
SELECT prod.maker, new.price_min price
FROM (SELECT MIN(price) price_min 
   FROM Printer 
   WHERE Color ='y'
 ) new
INNER JOIN Printer prin ON new.price_min = prin.price 
INNER JOIN Product prod ON prin.model = prod.model
----
Select maker, min(price) as price
FROM printer pr
inner join product p on p.model = pr.model
WHERE pr.color='y'  */

--------
correct 18

Select distinct prod.maker, new_table.min_price as price
from (
    select min(price) min_price
    FROM printer
WHERE printer.color='y'
) new_table
join printer prin on prin.price = new_table.min_price
join product prod on prod.model = prin.model
WHERE prin.color='y'

----
19
Select p.maker, avg(screen)
from laptop l
join product p on p.model = l.model
group by p.maker

----
20
/* по условию непонятно, с какими таблицами надо работать. Дрочилась с джойнами, хотя можно было одной обойтись*/
select 
maker,
COUNT(distinct model) AS q
from product
where type='pc'
group by maker
having COUNT(model)>=3

21
Select maker, max(price) as max
from pc
join product p on p.model=pc.model
group by maker

22
Select speed, avg(price)
from pc
where speed>600
group by speed

23
/* неправильный ответ
Select distinct maker
from product
join pc p on p.model=product.model and p.speed>=750
left join laptop l on l.model=product.model and l.speed>=750
*/



