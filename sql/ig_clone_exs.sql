-- Find the 5 oldest users.
SELECT * FROM 
users
ORDER BY created_at LIMIT 5;

-- What day of the week do most users register on?
SELECT DAYNAME(created_at) as day,
    COUNT(*) as total
FROM users
GROUP BY day
ORDER BY total DESC;

-- Find the users who have never posted a photo
SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE image_url IS NULL;

-- most likes on a single photo
SELECT username,
    image_url,
    COUNT(*) as likes
FROM photos
LEFT JOIN likes
    ON photos.id = likes.photo_id
LEFT JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY likes DESC;

-- How many times does the average user post?
SELECT (SELECT Count(*) FROM   photos) / (SELECT Count(*) 
        FROM   users) AS avg; 

-- What are the top 5 most commonly used hashtags?
SELECT CONCAT('#',tag_name),
    COUNT(*) as count
FROM tags
LEFT JOIN photo_tags
    ON tags.id = photo_tags.tag_id
GROUP BY tag_name
ORDER BY count DESC LIMIT 5;

-- Find users who have liked every single photo on the site
SELECT username, 
    Count(*) AS num_likes 
FROM users 
INNER JOIN likes 
    ON users.id = likes.user_id 
GROUP BY likes.user_id 
HAVING num_likes = (SELECT Count(*) FROM photos);  