--  STUDENT: SOULEYMANE DOUMBIA

-- QUESTION 1:
select distinct dest, origin, distance from flights order by distance desc;
 -- So the furthest destination  is HNL from JFK with a distance of 4983.

-- QUESTION 2:
select distinct engines from planes order by engines desc;
-- There are four differents engines number which are 1, 2, 3 and 4.

select  engines, tailnum, seats from planes where engines = '1' order by seats desc;
-- Engine 1: Aircraft  with tailnum N567AA has the most number of seats (16 seats).

select  engines, tailnum, seats from planes where engines = '2' order by seats desc;
-- Engine 2: 12 Aircrafts (check script below this line) with 400 seats have the most number of seats in this category.
select  engines, count(seats) from planes where engines = '2' and seats = '400';
 
select  engines, tailnum, seats from planes where engines = '3' order by seats desc;
-- Engine 3: 2 Aircrafts with 379 seats have the most number of seats in this category.

select  engines, tailnum, seats from planes where engines = '4' order by seats desc;
-- Engine 4: Aircrafts with tailnum N670US has the most number of seats (450 seats) in this category.

-- QUESTION 3:
select count(flight)  from flights where flight is not null;
-- Total number of flights is 336776.

-- QUESTION 4:
select carrier, count(flight) from flights where flight is not null Group by carrier;

-- QUESTION 5:
select carrier, count(flight) from flights where flight is not null Group by carrier 
order by count(flight) desc;
 
-- QUESTION 6:
select carrier as TOP_NF, count(flight) from flights
where flight is not null
Group by carrier 
having count(flight) > 32000
order by count(flight) desc;

-- QUESTION 7:
select carrier, count(flight) from flights
where flight is not null 
and distance >= 1000
Group by carrier 
order by count(flight) desc;

select carrier as TOP_5F, count(flight) from flights
where distance >= 1000 
Group by carrier 
having count(flight) > 6000
order by count(flight) desc;

-- QUESTION 8:
-- How many flights were operated by each airline (carrier) on January 3, 2013?
select carrier, year,month, day, count(flight) as TOTAL_FLIGHTS from flights
where (year = '2013' and month = '1' and day = '3')
group by  carrier order by count(flight) desc;
