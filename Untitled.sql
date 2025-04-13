use your_social_network;

-- if we whant to get the frends of frends
select username from Users
where id in (select fr.friend_id from(
	select * from users u, Friendships f
	where f.user_id = u.id
	and u.id = 1) ff
    , Friendships fr
    where ff.user_id = fr.user_id)


