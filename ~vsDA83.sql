create database sql_project_p1;
--data cleaning

select* from [SQL - Retail Sales Analysis]

 select * from [SQL - Retail Sales Analysis]
 where transactions_id is null
    or sale_time       is null 
	or sale_date       is null
	or customer_id     is null
	or gender          is null
	or age             is null
	or quantiy         is null
	or price_per_unit  is null
	or cogs            is null
	or total_sale      is null;
	--
	delete from [SQL - Retail Sales Analysis]
	 where transactions_id is null
    or sale_time       is null 
	or sale_date       is null
	or customer_id     is null
	or gender          is null
	or age             is null
	or quantiy         is null
	or price_per_unit  is null
	or cogs            is null
	or total_sale      is null;

	--data exploration

	--how many sales 
	select COUNT(*) as total_sales
	from [SQL - Retail Sales Analysis]

	-- haw maany unique customers 
	select COUNT(distinct customer_id) as total_customers
	from [SQL - Retail Sales Analysis]
	--how many categories 
	select COUNT(distinct category) as total_catogories
	from [SQL - Retail Sales Analysis]

	--data analysis& business key problems* answers

	--all sales made on '2022-11-05'
	select* from [SQL - Retail Sales Analysis]
	where sale_date = '2022-11-05'
	--all transactions where the category is clothing and the quantitiy sold is more than 4 in nov-2022
	select * from [SQL - Retail Sales Analysis]
	where category='clothing' 
	and year(sale_date )=2022 and MONTH(sale_date)=11
	and quantiy>= 4
	--total sales for each category
	select category, sum(total_sale) as net_sale, count(*) as total_orders
	from [SQL - Retail Sales Analysis]
	group by category
	--avg age of customers purchased from beaty
	select AVG(age) as avg_age 
	from [SQL - Retail Sales Analysis]
	where category = 'beauty'
	--tatal sales is greater than 1000
	 select* from [SQL - Retail Sales Analysis]
	 where total_sale >1000
	 --number of transactions by gender and category
	 select gender,category, count(*) as total_trans
	 from [SQL - Retail Sales Analysis]
	 group by  gender,category
	 order by 1
--top 5 customers

select top 5
      customer_id,
	  sum(total_sale) as total_sales
from [SQL - Retail Sales Analysis]
    group by  customer_id 
	order by sum(total_sale)  desc
-- uniqe customers for each category
select 
      category,
      count (distinct customer_id) as cnt_unq_cs
from [SQL - Retail Sales Analysis]
    group by  category
	
--shifts
with hourly_sales as

(select*, 
        case
             when datepart(hour,sale_time) <12 then 'morning'
			 when datepart(hour,sale_time) between 12 and 17 then 'afternoon'
		     else 'evening'	 
       end as shift
from [SQL - Retail Sales Analysis]
  )     
select 
      shift,
	  count(*) as total_orders
from hourly_sales
group by shift;

--end of project

