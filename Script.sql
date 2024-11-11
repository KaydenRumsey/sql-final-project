-- find each directors longest movie and its rating
SELECT MAX(duration) AS longest_movie , director, rating 
FROM Netflix_dataset nd 
WHERE director IS NOT NULL AND rating = "PG-13"
GROUP BY director;

-- use a subquerie to find the average release_year
SELECT DISTINCT (SELECT ROUND(AVG(release_year),0) 
		FROM Netflix_dataset nd) AS avg_release_year
FROM Netflix_dataset nd; 

-- find the rating and show id from movies that came out before the year 2000 
SELECT DISTINCT rating, show_id, release_year 
FROM Netflix_dataset nd 
WHERE release_year < 2000
ORDER BY show_id;

-- Join the dataset with itself and use parts from both to find the title and directore for movies that came out between 1990 and 1993
SELECT nd.title, nd2.director, nd2.release_year 
FROM Netflix_dataset nd LEFT JOIN Netflix_dataset nd2 
	ON nd.show_id = nd2.show_id 
WHERE nd.release_year BETWEEN "1990" AND "1993"
ORDER BY nd2.release_year ASC;

-- use a cte to find all info on tv shows from india that came out before 2011
WITH cte AS (
SELECT *
FROM Netflix_dataset nd 
WHERE type = "TV Show" AND country = "India" AND release_year < 2011
)
SELECT *
FROM cte;

