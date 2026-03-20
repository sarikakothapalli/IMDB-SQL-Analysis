--Top movies contributing highest revenue-blockbuster identification--
SELECT TOP 10 Title, Revenue_Millions
FROM imdb_movie_dataset
ORDER BY Revenue_Millions DESC;

--Which genres dominate the industry--
SELECT Genre, COUNT(*) AS total_movies
FROM imdb_movie_dataset
GROUP BY Genre
ORDER BY total_movies DESC;

--Critically loved movies--
SELECT TOP 10 Title, Rating
FROM imdb_movie_dataset
ORDER BY Rating DESC;

--Directors who consistently deliver quality--
SELECT Director, AVG(Rating) AS avg_rating, COUNT(*) AS total_movies
FROM imdb_movie_dataset
GROUP BY Director
HAVING COUNT(*) >= 3
ORDER BY avg_rating DESC;

--Growth or decline of movie industry revenue over time--
SELECT Year, SUM([Revenue_Millions]) AS total_revenue
FROM imdb_movie_dataset
GROUP BY Year
ORDER BY Year;

--General relationship between movie length and ratings--
SELECT 
    AVG([Runtime_Minutes]) AS avg_runtime,
    AVG(Rating) AS avg_rating
FROM imdb_movie_dataset;

--Frequent actors in dataset--
SELECT Actors, COUNT(*) AS appearances
FROM imdb_movie_dataset
GROUP BY Actors
ORDER BY appearances DESC;

--High Revenue but Low Ratings--
SELECT Title, Rating, [Revenue_Millions]
FROM imdb_movie_dataset
WHERE Rating < 6 AND [Revenue_Millions] > 100
ORDER BY [Revenue_Millions] DESC;

--(Votes vs Rating)--
SELECT Rating, Votes
FROM imdb_movie_dataset
ORDER BY Votes DESC;

--Which year had the best quality movies--
SELECT Year, AVG(Rating) AS avg_rating
FROM imdb_movie_dataset
GROUP BY Year
ORDER BY avg_rating DESC;

SELECT TOP 1 * FROM imdb_movie_dataset;

EXEC sp_rename 'imdb_movie_dataset.[Revenue (Millions)]', 'Revenue_Millions', 'COLUMN';
EXEC sp_rename 'imdb_movie_dataset.[Runtime (Minutes)]', 'Runtime_Minutes', 'COLUMN';

SELECT TOP 10 Title, Revenue_Millions
FROM imdb_movie_dataset
ORDER BY Revenue_Millions DESC;
