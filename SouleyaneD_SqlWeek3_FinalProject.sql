-- SQL WEEK 3: FINAL PROJECT
-- SOULEYMANE DOUMBIA

/*
	DESIGNING THE DATABASE TO SUPPORT THE KEY CARD SYSTEM:
		I assumed that a user belongs to one group only.
*/

DROP TABLE if exists grups;
create table grups(group_id int primary key, group_name text);
insert into grups(group_id, group_name) values(11, 'I.T.');
insert into grups(group_id, group_name) values(12, 'Sales');
insert into grups(group_id, group_name) values(13, 'Administration');
insert into grups(group_id, group_name) values(14, 'Operations');
SELECT * from grups;


DROP TABLE if exists users;
create table users(user_id int primary key, user_name text, 
group_id int REFERENCES grups.group_id);

insert into users(user_id, user_name, group_id) values(21, 'Modesto', 11);
insert into users(user_id, user_name, group_id) values(22, 'Ayine', 11);
insert into users(user_id, user_name, group_id) values(23, 'Christopher', 12);
insert into users(user_id, user_name, group_id) values(24, 'Cheong woo', 12);
insert into users(user_id, user_name, group_id) values(25, 'Saulat', 13);
insert into users(user_id, user_name) values(26, 'Heidy');
SELECT * from users;


DROP TABLE if exists rooms;
create table rooms(room_id int primary key, room_name text);

insert into  rooms(room_id, room_name) values(31, '101');
insert into rooms(room_id, room_name) values(32, '102');
insert into rooms(room_id, room_name) values(33, 'Auditorium A');
insert into rooms(room_id, room_name) values(34, 'Auditorium B');
SELECT * from rooms;


DROP TABLE if exists group_rooms;
create table group_rooms(group_id int references grups.group_id, 
room_id int references rooms.room_id,
CONSTRAINT pk_group_rooms PRIMARY KEY(group_id, room_id));

insert into group_rooms(group_id, room_id) values(11, 31);
insert into group_rooms(group_id, room_id) values(11, 32);
insert into group_rooms(group_id, room_id) values(12, 32);
insert into group_rooms(group_id, room_id) values(12, 33);
SELECT * from group_rooms;

-- QUESTION 1:
select grups.group_name as 'GROUP DEPARTMENT', user_name as 'USER' from users right join grups 
on grups.group_id = users.group_id
UNION
select  grups.group_name, user_name from users left join grups 
on grups.group_id = users.group_id;

-- QUESTION 2:
select rooms.room_name as 'ROOM', grups.group_name as 'DEPARTMENT'
from rooms
left join group_rooms as gr
on rooms.room_id = gr.room_id
left join grups
on  gr.group_id = grups.group_id;

-- QUESTION 3:
select users.user_name as 'USER', grups.group_name as 'DEPARTMENT', rooms.room_name as 'ROOM'
from users 
left join grups 
on users.group_id = grups.group_id
left join group_rooms as gr
on grups.group_id = gr.group_id
left join rooms
on rooms.room_id = gr.room_id
order by USER asc, DEPARTMENT, ROOM;


