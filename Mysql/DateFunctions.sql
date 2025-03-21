
select * from sh.sales
select sysdate from sh.sales
select systimestamp from sh.sales
select sysdate from sh.sales
select systimestamp from sh.sales
select current_date from sh.sales 
select current_timestamp from sh.sales
select dbtimezone from sh.sales
select sessiontimezone from  sh.sales
select sysdate ,sysdate+8  as nextweek from  sh.sales
select sysdate ,sysdate+8 from sh.sales
select sysdate ,sysdate-8 as previousweek from  sh.sales
select sysdate ,sysdate+8 from sh.sales
select systimestamp,systimestamp+interval'4' hour from dual
select systimestamp,systimestamp+interval'4' hour from sh.sales
select systimestamp,systimestamp+interval'4' minute from sh.sales
select systimestamp,systimestamp+interval'4' day from sh.sales
select systimestamp,systimestamp+interval'2' month from sh.sales
select systimestamp,systimestamp+interval'2' year from sh.sales
select systimestamp+interval '2' day+interval'4' hour from sh.sales
select systimestamp+interval'5' day+interval '3'hour from sh.sales
select time_id ,extract( year from time_id)year from sh.sales
select time_id,extract(month from time_id) month from sh.sales
  select time_id ,extract( year from time_id)year ,extract(month from time_id)as month ,
extract(day from time_id)as day from sh.sales
select add_months(sysdate,6) from sh.sales
select months_between (time_id,sysdate)from sh.sales
select time_id ,last_day(time_id) from sh.sales
select *from sh.sales
select prod_id from sh.sales
-- null function
select null from sh.sales
