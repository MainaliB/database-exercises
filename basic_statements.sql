
#2
USE albums_db;
#3
DESCRIBE albums;

# 4
SELECT name as 'Albums by Pink Floyd' FROM albums
WHERE artist = 'Pink Floyd';

select release_date from albums 
where name = "Sgt. Pepper's Lonely Hearts Club Band";

select genre from albums
where name = 'Nevermind';

select * 
from albums
where release_date between '1990' and '1999';


select * 
from albums
where sales < '20.0';


select * from albums
where genre = 'Rock';

select * from albums
where genre LIKE '%rock%';





