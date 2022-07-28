-- WEEK 2 SQL ASSIGNMENT
-- STUDENT: SOULEYMANE DOUMBIA

-- QUESTION 1:--

DROP TABLE IF EXISTS Videos;

create table Videos(Id real, Title text, Length_mn real, URL text);
insert into Videos(Id, Title, Length_mn, URL) Values (1, 'Sequoia Platinum', 38.90, 'https://www.youtube.com/watch?v=4fW_SDOuCPo');
insert into Videos(Id, Title, Length_mn, URL) Values (2, 'The Range Rover', 17.42, 'https://www.youtube.com/watch?v=SBQlKwZnIFA');
insert into Videos(Id, Title, Length_mn, URL) Values (3, 'Ram1500 Truck Production in the USA', 14.00, 'https://www.youtube.com/watch?v=d1swC6zn9_g');
insert into Videos(Id, Title, Length_mn, URL) Values (4, 'What Does a Data Analyst Actually Do?', 4.28,  'https://www.youtube.com/watch?v=ywZXpfdqg1o');
insert into Videos(Id, Title, Length_mn, URL) Values (5, 'Learn SQL In 60 Minutes', 56.38,  'https://www.youtube.com/watch?v=p3qvj9hO_Bo');

select * from Videos;


-- QUESTION 2:--

DROP TABLE IF EXISTS Reviewers;

create table Reviewers(V_Watched real, User_name text, Rating int, Review text);
insert into Reviewers(V_Watched, User_name, Rating, Review) Values (5, 'Syd', 5, 'Loved it');
insert into Reviewers(V_Watched, User_name, Rating, Review) Values (5, 'Mam', 4, 'Well explained');
insert into Reviewers(V_Watched, User_name, Rating, Review) Values (3, 'hasd', 2, 'Not too bad');
insert into Reviewers(V_Watched, User_name, Rating, Review) Values (3, 'dice', 1, 'Not worth the time');
insert into Reviewers(V_Watched, User_name, Rating, Review) Values (1, 'fan', 5, 'Best video on this car');
insert into Reviewers(V_Watched, User_name, Rating, Review) Values (1, 'goro', 4, 'Was great!');
insert into Reviewers(V_Watched, User_name, Rating, Review) Values (1, 'ado', 3, 'like it');

select * from Reviewers;


-- QUESTION 3:--

select User_name as 'Person', Videos.Title as 'Video watched', Videos.Length_mn as 'Video lenght in minute', 
Rating, Review, Videos.URL as 'Link to the video'
from Reviewers
inner join Videos
on V_Watched = Videos.Id
order by Rating desc, User_name

