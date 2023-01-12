SELECT name, album_release FROM albums
where album_release = 2018;

select name, time from tracks
order by time desc
limit 1;

select name, time from tracks
where time >= 210;

select name, digests_release from digests
where digests_release between 2018 and 2020;

select name from musicians
where name not like '% %';

update tracks set name = replace (name, 'Мой', 'My')
where name like '%Мой%';

select * from tracks;