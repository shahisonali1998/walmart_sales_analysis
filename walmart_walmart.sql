

use walmart
select * from walmart_sales


  data cleaning
    step 1 - to check for duplicate
    
    select holiday_flag,count(*)
    from walmart_sales
    group by holiday_flag
    having count(holiday_flag) >1

step 2 - to check datatype

select column_name, data_type
from information_schema.columns
where table_name='walmart_sales'
   
   step 3 - to check null values
   
   select * from walmart_sales where store is null or holiday_flag is null
   
  --- DATA ANALYSIS---
  1.  WHAT IS THE TOTAL SALES MADE BY EACH STORE?
  
  select store,sum(weekly_sales) as total_sales
  from walmart_sales
  group by store
  order by total_sales desc;
  
  
  
  BUSINESS PROBLEM : WE DON'T KNOW which store are most in demand
  business impact : helps prioritize store and boost total_sales target promotions
  
  
  
  2. WHAT IS THE AVERAGE WEEKLY SALES DURING HOLIDAYS VS NON- HOLIDAYS?
  
  SELECT holiday_flag,
   AVG(weekly_sales) AS TOTTAL_SALES
   FROM walmart_sales
   group by holiday_flag;

BUSINESS PROBLEM : VERIFYING AVG WEEKLY SALE IN HOLIDAY AND NON HOLIDAY
BUSINESS IMPACT : IDENTIFY POOR PERFORM BY HOLIDAY AND NON HOLIDAY
  
    3. WHICH DATE HAD THE HIGHEST WEEKLY SALES?
    select date,weekly_sales
    from walmart_sales
    order by weekly_sales desc
    limit 1;
    
    BUSINESS PROBLEM : FIND PEAK WEEKLY SALE TIMES
    BUSINESS IMPACT : OPTIMIZE STORE,WEEKLY_SALES , HOLIDAY_FLAG
    
    
      4.WHich store experienced the highest average unemployment rate ?
      select store,
      avg(unemployment)as avg_unemployment
      from walmart_sales
      group by store
      order by avg_unemployment desc
      limit 1;
      
      business problem : verifying most unemployment store ?
      business impact :  optimize store performance by weekly_sale and holiday
      
       5. find the average temperature when sales were above 1.5 million ?
      select avg(temperature)as avg_temp
      from walmart_sales 
      where weekly_sales>1500000;
      
      business problem :  verify average temperature 
      business impact :  optimize the temperature by weekly_sales
      
      6. what's the coorelation between store and weekly sales?
      select store, avg(weekly_sales)as avg_sales
      from walmart_sales
      group by store
      order by store;
      business problem : verify coorelation between store and weekly sales
      business impact : by verify coorelation between store and weekly sales optimize avg_sales of store
      
      7. which store has the lowest average sales on holidays?
      select store,
      avg(weekly_sales)as avg_holiday_sales
      from walmart_sales
      where holiday_flag = 1
      group by store
      order by avg_holiday_sales asc;
      business problem: the lowest average sales on holidays
      business impact: optimize the stores lowest sales 
      
     8. which store has the highest average sales on holidays?
      select store,
      avg(weekly_sales) as avg_holiday_sales
      from walmart_sales
      where holiday_flag = 1
      group by store 
      order by avg_holiday_sales desc;
      business problem : verify sales on holiday_sales?
      business impact : avg_holiday_sales
      
      
      
  
  
  