select *
from (
         select t.supplier, sum(t.sum) as summ
         from (
                  select s.supplier,
                         a.price * a.qty as sum
                  from study.suppliers s
                      inner join study.actions a
                  on s.id = a.supplier_id
                  where a.action_date between '2016-01-01' and '2016-12-31') as t
         group by t.supplier) as sss
where summ > (select sum(a.qty * a.price)
              from study.actions a
                       inner join study.suppliers s on s.id = a.supplier_id
              where action_date between '2016-01-01' and '2016-12-31'
                and s.supplier = 'IDT'



select p.product
from study.products p
         left join study.actions a on p.id = a.product_id
         inner join study.suppliers s on a.supplier_id = s.id
where a.id is null


select distinct c.category
from study.actions a
         inner join study.suppliers s on s.id = a.supplier_id
         inner join study.products p on a.product_id = p.id
         inner join study.categories c on c.id = p.category_id
where s.supplier = 'IDT'
  and a.action_date between '2016-06-01' and '2016-08-31';


select distinct p.product
from study.actions a
         inner join study.products p on a.product_id = p.id
where a.action_date between '2017-01-01' and '2017-12-31';