-- How many tracks does each album have? 
-- Your solution should include Album id 
-- and its number of tracks sorted from highest to lowest.

SELECT AlbumId, COUNT(TrackId)
FROM tracks
GROUP BY AlbumId
ORDER BY COUNT(TrackId) DESC;

-- Find the album title of the tracks. 
-- Your solution should include track name and its album title.

SELECT tracks.name AS "Track_Name", albums.Title AS "Album_Title"
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId;

-- Find the minimum duration of the track in an album. 
-- Your solution should include track name, album id, 
-- album title and duration of the track sorted from highest to lowest.

SELECT tracks.name, albums.AlbumId, albums.Title, MIN(tracks.Milliseconds) AS min_dur
FROM tracks
LEFT JOIN albums ON tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId
ORDER BY min_dur DESC;

-- Find the total duration of each album. 
-- Your solution should include track name, album id, 
-- album title and its total duration sorted from highest to lowest.

SELECT tracks.AlbumId, albums.Title, SUM(tracks.Milliseconds) AS tot_dur
FROM tracks
LEFT JOIN albums ON albums.AlbumId = tracks.AlbumId
GROUP BY tracks.AlbumId
ORDER BY tot_dur DESC;

-- Based on the previous question, find the albums 
-- whose total duration is higher than 70 minutes. 
-- Your solution should include album title and total duration.

SELECT AlbumId, Title, tot_dur
FROM (SELECT tracks.AlbumId, albums.Title, SUM(tracks.Milliseconds) AS tot_dur
FROM tracks
LEFT JOIN albums ON albums.AlbumId = tracks.AlbumId
GROUP BY tracks.AlbumId
ORDER BY tot_dur DESC)tablom
WHERE tot_dur > 4200000;