
use warehouse;
									        --  Query 1 --	
                                            
(select f.store_id,s.store_name, sum(f.sale) as Sale_Sept_2017 from facts f,stores s where
            f.store_id=s.store_id and
            monthname(f.date_id)="September" and year(f.date_id)="2017"
            group by f.store_id 
            order by sum(f.sale)desc
            limit 3 );
            
										 --  Query 2 --	
 select s.SUPPLIER_ID, SUM(sa.SALE) as Total_sale
 from suppliers s, facts sa,dates d
 where weekday(d.date_id)=5 OR weekday(d.date_id)=6 and sa.SUPPLIER_ID = s.SUPPLIER_ID 
 group by SUPPLIER_ID
 order by sale limit 10;
            
            
            
            
											--  Query 3 --
                                            
	-- Query3(a)
select store_id,supplier_id,quarter(date_id),year(date_id),SUM(SALE)AS "SALE"  
from facts 
GROUP BY SUPPLIER_ID,STORE_ID,quarter(date_id),year(date_id)
order by store_id,supplier_id,quarter(date_id),year(date_id);
 #Query3(b)
select store_id,supplier_id,monthname(date_id),year(date_id),SUM(SALE)AS "SALE"  
from facts 
GROUP BY SUPPLIER_ID,STORE_ID,month(date_id),year(date_id)
order by store_id,supplier_id,month(date_id),year(date_id);

								
									--  Query 4 --  
SELECT STORE_ID,PRODUCT_ID,SUM(SALE)
FROM FACTS
GROUP BY STORE_ID,PRODUCT_ID
ORDER BY STORE_ID,PRODUCT_ID;


                                   --  Query 5 --  
                                   
SELECT SUM(CASE WHEN QUARTER(d.DATE_ID)=1 THEN SALE END) AS Quarter1,
SUM(CASE  WHEN QUARTER(d.DATE_ID)=2 THEN SALE END) AS Quarter2,
SUM(CASE  WHEN QUARTER(d.DATE_ID)=3 THEN SALE END) AS Quarter3,
SUM(CASE WHEN QUARTER(d.DATE_ID)=4 THEN SALE END) AS Quarter4
FROM facts f , dates d
WHERE d.date_ID= f.date_ID;


											--  Query 6 -- 
                                            
SELECT PRODUCT_ID,SUM(SALE) AS SALE FROM FACTS
WHERE WEEKDAY(DATE_ID) = 5 OR WEEKDAY(DATE_ID)=6
GROUP BY (PRODUCT_ID)
ORDER BY SALE DESC
LIMIT 0,5;

								             -- Query 7 --
                                
SELECT store_ID,supplier_ID,product_ID, sum(s.SALE)
FROM facts s
GROUP BY store_ID,supplier_ID,product_ID WITH ROLLUP;


										--  Query 8 -- 
SELECT PRODUCT_ID,
(CASE
    WHEN QUARTER(DATE_ID) < 3 THEN "First Half"
    WHEN QUARTER(DATE_ID) > 2 THEN "Second Half"
END) AS YEAR_PART  ,SUM(SALE) 
FROM FACTS
WHERE YEAR(DATE_ID)=2017
GROUP BY year_part,PRODUCT_ID
ORDER BY product_id,YEAR_PART;    


												--  Query 9 -- 

SELECT product_name,product_id,Price from productss
 where product_name in
			(SELECT product_name 
			 FROM productss
			 GROUP BY product_name
			 HAVING COUNT(product_name) > 1);





												-- QUERY 10 --
                                                    
#---------------------------------------------------------
DROP TABLE IF EXISTS DW_analysis;
CREATE TABLE DW_analysis(
`STORE_NAME` VARCHAR(30) NOT NULL, 
`PRODUCT_NAME` VARCHAR(30) NOT NULL, 
`SALE` DECIMAL(10,2) DEFAULT (0.0) NOT NULL
);
INSERT INTO DW_analysis
SELECT STORE_Name , PRODUCT_Name,SUM(SALE) AS SALE
FROM FACTS  f,productss  p,stores  s
where f.store_id=s.store_id and f.product_id=p.product_id
GROUP BY s.STORE_NAME,p.PRODUCT_NAME
ORDER BY s.STORE_NAME,p.PRODUCT_NAME;

SELECT * FROM  DW_analysis;
    
