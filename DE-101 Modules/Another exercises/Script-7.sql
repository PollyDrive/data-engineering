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


