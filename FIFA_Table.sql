-- CREATE DATABASE
CREATE DATABASE FIFA;

-- USING DATABASE
USE FIFA;

-- CREATE TABLE
CREATE TABLE Fifa_D(
ID int PRIMARY KEY,
Name	VARCHAR(60),
Age	INT,
Nationality	VARCHAR(50),
Overall_rating	INT,
Potential_rating	INT,
Club	VARCHAR(60),
Value	DECIMAL(15,2),
Wage	INT,
Preferred_Foot	VARCHAR(10),
Jersey_No INT,
Height	INT,
Weight	INT,
Penalties INT
);


-- LOAD CSV FILE
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/FIFA_Dataset.csv"
INTO TABLE Fifa_D
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
ignore 1 rows;


-- 1. Retrieve all players' information from the table 
select * from fifa_d;

-- 2. Get the names and ages of players with an overall rating above 85 
select name, age from fifa_d where overall_rating > 85;

-- 3. Find the nationality and potential rating of players with a 
-- value over 50 million
select name, nationality, potential_rating from fifa_d 
where value > 5000000;

-- 4. List the names, clubs, and wages of players who prefer their left foot 
select name, club, wage from fifa_d where preferred_foot like 'L%';

-- 5. Retrieve players' names, ages, and weights who weigh over 
-- 70 kg and have a penalty rating above 70 
select name, age, weight from fifa_d where weight > 70 and penalties > 70;

-- 6. Get the average overall rating of players in the table 
select avg(overall_rating) as average_overall_rating  from fifa_d;

-- 7. Find the tallest player's name, height, and jersey number 
select name, jersey_no, height from fifa_d order by height desc limit 1;

-- 8. List the name of the player whose age is between 18 to 25 
select name from fifa_d where age between 18 and 25;

-- 9. Find the nationality, value, and preferred foot of players 
-- with a potential rating above 90 
select name, nationality, value, preferred_foot, potential_rating 
from fifa_d where potential_rating > 90;

-- 10. Retrieve players with a wage greater than 100,000 and a 
-- potential rating above 85 
select name, wage, potential_rating from fifa_d 
where wage > 100000 and potential_rating > 85;

-- 11. List the names and heights of players who are taller 
-- than 180 cm and weigh less than 75 kg 
select name, height, weight from fifa_d 
where height > 70 and weight < 175;

-- 12. Retrieve players with a potential rating 
-- greater than their overall rating
select name, potential_rating, overall_rating from 
fifa_d where potential_rating > overall_rating;
 
-- 13. Find the average value of players from each nationality, 
-- ordered by average value in descending order 
select nationality, avg(value) as average_value from fifa_d 
group by nationality order by average_value desc;

-- 14. Get the total number of players in the table 
select count(name) as Total_players from fifa_d;

-- 15. Find the average age of players who prefer their right foot 
select name, age from fifa_d where preferred_foot like 'R%' and age in 
(select avg(age)  from fifa_d group by name);

-- 16. Retrieve players with a value greater than 
-- 30 million and a wage less than 100,000 
select name, value, wage from fifa_d where 
value > 30000000 and wage < 100000;

-- 17. List the names and clubs of players whose jersey 
-- number is less than 10 and have a potential rating above 80 
select name, club, potential_rating from fifa_d 
where jersey_no < 10 having potential_rating >80; 

-- 18. How many nationalities do these players belong to? 
select count(distinct(nationality)) as 
num_of_nationality from fifa_d;

-- 19. What is the total wage given to all players? 
-- What's the average and standard deviation? 
select sum(wage) as total_wage, avg(wage) as average_wage, 
std(wage) standard_deviation from fifa_d;

-- 20. Which player has the highest wage? Who has the lowest? 
select name, wage as player_wage, 'Highest' as wage_type 
from fifa_d where wage in (select max(wage) from fifa_d)
union all
select name, wage as lowest_wage, 'Lowest' as wage_type 
from fifa_d where wage in (select min(wage) from fifa_d);

-- 21. Who has the best overall rating? Who has the worst? 
select name, overall_rating as rating, 'Best Rating' as rating_lavel 
from fifa_d where overall_rating in (select max(overall_rating) from fifa_d)
union all
select name, overall_rating as rating, 'Worst Rating' as rating_lavel 
from fifa_d where overall_rating in (select min(overall_rating) from fifa_d);

-- 22. Which club has the highest total of overall ratings? 
-- Which has the highest average rating?
create view total_rating as
(SELECT club, SUM(overall_rating) AS highest_total_rating FROM fifa_d 
GROUP BY club ORDER BY highest_total_rating DESC LIMIT 1);
create view avg_rating as
(SELECT club, AVG(overall_rating) AS highest_average_rating FROM fifa_d 
GROUP BY club ORDER BY highest_average_rating DESC LIMIT 1);
SELECT total_rating.club AS club_with_highest_total, total_rating.highest_total_rating, 
avg_rating.club AS club_with_highest_average, avg_rating.highest_average_rating
FROM total_rating, avg_rating;

-- 23. What are the top 5 clubs based on the average ratings of their players? 
select club, overall_rating as average_rating from fifa_d where overall_rating in 
(select avg(overall_rating) from fifa_d group by name order by avg(overall_rating)) 
order by overall_rating limit 5;

-- 24. What is the distribution of players whose preferred foot is left vs right? 
select preferred_foot, count(*) as player_count, round(100.0 * count(*)/
(select count(*) from fifa_d),2) as percentage from fifa_d group by preferred_foot;

-- 25. Which jersey number corresponds to the highest total wage? 
select jersey_no, max(wage) as highest_total from fifa_d 
group by jersey_no order by highest_total desc limit 1;

-- 26. What is the frequency distribution of nationalities 
-- among players whose club name starts with ‘M’? 
select nationality, count(*) as player_count, 100.0 * count(*)/
(select count(*) from fifa_d) as percentage from fifa_d where club like 'M%'
group by nationality order by player_count desc;

-- 27. What is the most common age among players? 
select age, count(*) from fifa_d group by age order by count(*) desc limit 1;

-- 28. Which five players have the highest potential rating in the dataset? 
select name, max(potential_rating) as highest_potential from fifa_d 
group by name order by highest_potential desc limit 5;

-- 29. Which club has the most players in the dataset? 
select club, count(*) as most_player from fifa_d 
group by club order by most_player desc limit 1;

-- 30. List all players with missing wage or value data 
select * from fifa_d where wage is null or value is null;

-- 31. Which countries have players with an average overall rating above 80? 
select nationality, avg(overall_rating) as avg_rating from fifa_d
group by nationality having avg_rating >80;

-- 32. What is the median wage of players grouped by preferred foot? 
select preferred_foot, round(avg(wage), 2) as median_wage from 
(select preferred_foot, wage, row_number() over 
(partition by preferred_foot order by wage) as rn, 
count(*) over (partition by preferred_foot) as total_count 
from fifa_d) ranked where rn in (floor((total_count + 1)/2), 
ceil((total_count + 1)/2)) group by preferred_foot;

-- 33. Which club has the youngest average player age? 
select club, min(age) as age from fifa_d where age in 
(select avg(age) from fifa_d group by club) group by club limit 1;

-- 34. List players who have the same overall and potential rating 
select name, overall_rating, potential_rating 
from fifa_d where overall_rating = potential_rating;

-- 35. How many left-footed players are in each club? 
select club, count(*) from fifa_d where preferred_foot like 'L%' group by club;
