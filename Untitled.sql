use your_social_network;

-- if we whant to get the frends of frends
select u.username from Users u
where u.id in (
	select fr.friend_id from(
		select * from users u, Friendships f
		where f.user_id = u.id
		and u.id = 1) ff, Friendships fr
    where ff.user_id = fr.user_id);

SELECT u.username
FROM Users u
WHERE u.id IN (
    -- Friends of friends (user_id = 1)
    SELECT f2.friend_id
    FROM Friendships f1
    JOIN Friendships f2 ON f1.friend_id = f2.user_id
    WHERE f1.user_id = 1
);
