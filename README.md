Project Goals

-Find out as much information as I can from a Netflix dataset using the skills I have learned 

Table and relationships

![Capture](https://github.com/user-attachments/assets/579702d6-4498-4e5b-911f-7f403e344fe5)

SQL queries and their key insights

![image](https://github.com/user-attachments/assets/fea56b5b-48a7-4559-9a53-c43befe8b41a)


![image](https://github.com/user-attachments/assets/118599ad-e9d7-41ee-9627-46e8ba1dd1c6)


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
