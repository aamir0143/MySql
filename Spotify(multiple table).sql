create database spotify;
use spotify;
create table users(
uid varchar(90) not null,
uname varchar(40) not null,
uemail varchar(66) not null,
PRIMARY KEY (uid) 
);
insert into users(uid,uname,uemail)
values('31wfuftsf35o5f3x367ud4elwrtq','Aamir','aamirreza156@gmail.com'),
('32wfuftsf35o5f3x367ud4elwrtq','Reza','mdaamirreza00@gmail.com');
select* from users;
create table playlist(
pid varchar(90) primary key,
pname varchar(40) not null,
uid varchar(90) not null
);
insert into playlist values
('63jofKqtMq4kIPDPRyD3FI','rockmusic','31wfuftsf35o5f3x367ud4elwrtq'),
('63jofKqtMq4kIPDPRyD3FN','localmusic','32wfuftsf35o5f3x367ud4elwrtq');
select* from playlist;
create table tracks(
tid varbinary(90) primary key,
tnmae varchar(40) not null,
pid varchar(90) not null
);
insert into tracks values
('3W9EFWiTzexkdlCm2zHBqK','album','63jofKqtMq4kIPDPRyD3FI'),
('6f3C6rJo7zvmfr1h5SRvxg','airtits','63jofKqtMq4kIPDPRyD3FN');
select* from tracks;
select* from users as u
inner join playlist as p
on u.uid=p.uid
inner join tracks as t
on p.pid=t.pid;

select* from users as u
left join playlist as p
on u.uid=p.uid
left join tracks as t
on p.uid=t.pid;

select* from users as u
right join playlist as p
on u.uid=p.uid
right join tracks as t
on p.pid=t.pid;

select * from users 
cross join playlist 
on users.uid=playlist.uid
cross join tracks
on playlist.pid=tracks.pid;