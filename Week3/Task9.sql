create table BST(N int , P int);

insert into BST values(1,2),(3,2),(6,8),(9,8),(2,5),(8,5),(5,NULL);

select N,
       case when P is null then 'Root'
            when (select count(*) from BST where P = B.N) > 0 then  
            'Inner'
            else 'Leaf'
       end
from BST as B 
order by N
;