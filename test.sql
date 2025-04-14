use your_social_network;

SELECT u.username
FROM Users u
WHERE u.id IN (
    -- Friends of friends (user_id = 1)
    SELECT f2.friend_id
    FROM Friendships f1
    JOIN Friendships f2 ON f1.friend_id = f2.user_id
    WHERE f1.user_id = 1
);

