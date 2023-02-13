--CONSUMER ANALYSIS
SELECT * FROM consumers;

--Total Consumers
SELECT COUNT(Consumer_ID) AS Total_Consumers FROM consumers;

--Total Consumers by City
SELECT City,COUNT(Consumer_ID) AS Total_Consumers 
FROM consumers
GROUP BY City
ORDER BY Total_Consumers DESC;

--Total Consumers by State
SELECT State,COUNT(Consumer_ID) AS Total_Consumers 
FROM consumers
GROUP BY State
ORDER BY Total_Consumers DESC;

--Smoking Habit of consumers
SELECT Smoker,COUNT(Consumer_ID) AS Total_Consumers 
FROM consumers
WHERE Smoker IS NOT NULL
GROUP BY Smoker
ORDER BY Total_Consumers DESC;

--Drinking level of consumers
SELECT Drink_Level,COUNT(Consumer_ID) AS Total_Consumers 
FROM consumers
GROUP BY Drink_Level
ORDER BY Total_Consumers DESC;

--Transportation methods of consumers
SELECT Transportation_Method,COUNT(Consumer_ID) AS Total_Consumers 
FROM consumers
WHERE Transportation_Method IS NOT NULL
GROUP BY Transportation_Method
ORDER BY Total_Consumers DESC;

--Consumers based on marital status
SELECT Marital_Status,COUNT(Consumer_ID) AS Total_Consumers 
FROM consumers
WHERE Marital_Status IS NOT NULL
GROUP BY Marital_Status
ORDER BY Total_Consumers DESC;

--Consumers children details
SELECT Children,COUNT(Consumer_ID) AS Total_Consumers 
FROM consumers
WHERE Children IS NOT NULL
GROUP BY Children
ORDER BY Total_Consumers DESC;

--Occupation of Consumers
SELECT Occupation,COUNT(Consumer_ID) AS Total_Consumers 
FROM consumers
WHERE Occupation IS NOT NULL
GROUP BY Occupation
ORDER BY Total_Consumers DESC;

--Budget level of consumers
SELECT Budget,COUNT(Consumer_ID) AS Total_Consumers 
FROM consumers
WHERE Budget IS NOT NULL
GROUP BY Budget
ORDER BY Total_Consumers DESC;

--Maximum age of consumer
SELECT MAX(Age) AS Maximum_age
FROM consumers;

--Minimum age of consumer
SELECT MIN(Age) AS Minimum_age
FROM consumers;

-- Add a new column Age_Group to the table consumers
ALTER TABLE consumers
ADD Age_Group nvarchar(50);

--Updating the values in Age_Group using case when condition
UPDATE Consumers
SET Age_Group = 
CASE 
    WHEN age > 60 THEN '61 and Above'
    WHEN age > 40 THEN '41 - 60'
    WHEN age > 25 THEN '26 - 40'
    WHEN age >= 18 THEN '18 - 25'
END;

--Total consumers in each age group
SELECT Age_Group,COUNT(Consumer_ID) AS Total_Consumers 
FROM consumers
GROUP BY Age_Group
ORDER BY Total_Consumers DESC;

--Total consumers and the count of smokers based on age group
SELECT Age_Group,COUNT(Consumer_ID) AS Total_Consumers,
COUNT(CASE WHEN Smoker='Yes' THEN Consumer_ID END ) AS Smokers_Count
FROM Consumers
GROUP BY Age_Group
ORDER BY Total_Consumers DESC;

--Count of student smokers
SELECT Occupation,Age_Group,COUNT(Consumer_ID) AS Smokers_Count
FROM Consumers
WHERE Smoker='Yes' and Occupation='Student'
GROUP BY Occupation,Age_Group
ORDER BY Smokers_Count DESC;

SELECT * FROM Consumer_preferences

--Count of consumer preferences for each preferred cuisine
SELECT Preferred_Cuisine,COUNT(Consumer_ID) AS Total_Preference
FROM Consumer_preferences
GROUP BY Preferred_Cuisine
ORDER BY Total_Preference DESC;

--Top 10 Preferred cuisine
SELECT TOP 10 Preferred_Cuisine,COUNT(Consumer_ID) AS Total_Preference
FROM Consumer_preferences
GROUP BY Preferred_Cuisine
ORDER BY Total_Preference DESC;

--Preferred cuisine of the consumers by State
SELECT C.State,P.Preferred_Cuisine
FROM Consumers C
JOIN consumer_preferences P
ON C.Consumer_ID=P.Consumer_ID
GROUP BY  C.State,P.Preferred_Cuisine
ORDER BY C.State ;

--Preferred cuisine of the consumers by city
SELECT C.City,P.Preferred_Cuisine
FROM Consumers C
JOIN consumer_preferences P
ON C.Consumer_ID=P.Consumer_ID
GROUP BY  C.City,P.Preferred_Cuisine
ORDER BY C.City ;


--RESTAURANT ANALYSIS

SELECT * FROM restaurants;

--Total restaurants
SELECT COUNT(Restaurant_ID) AS Total_Restaurant FROM restaurants;

--Total restaurants by City
SELECT City,COUNT(Restaurant_ID) AS Total_Restaurant 
FROM restaurants
GROUP BY City
ORDER BY Total_Restaurant DESC;

--Total restaurants by State
SELECT State,COUNT(Restaurant_ID) AS Total_Restaurant 
FROM restaurants
GROUP BY State
ORDER BY Total_Restaurant DESC;

--Restaurants count by alcohol service 
SELECT Alcohol_Service,COUNT(Restaurant_ID) AS Total_Restaurant 
FROM restaurants
GROUP BY Alcohol_Service
ORDER BY Total_Restaurant DESC;

--Restaurants count based on smoking details
SELECT Smoking_Allowed,COUNT(Restaurant_ID) AS Total_Restaurant 
FROM restaurants
GROUP BY Smoking_Allowed
ORDER BY Total_Restaurant DESC;

--Restaurants count by franchise details
SELECT Franchise,COUNT(Restaurant_ID) AS Total_Restaurant 
FROM restaurants
GROUP BY Franchise
ORDER BY Total_Restaurant DESC;

--Restaurants count by Price
SELECT Price,COUNT(Restaurant_ID) AS Total_Restaurant 
FROM restaurants
GROUP BY Price
ORDER BY Total_Restaurant DESC;

--Restaurants count by parking facilities
SELECT Parking,COUNT(Restaurant_ID) AS Total_Restaurant 
FROM restaurants
GROUP BY Parking
ORDER BY Total_Restaurant DESC;

--Restaurants count by Smoking and alcohol service
SELECT Smoking_Allowed,Alcohol_Service,COUNT(Restaurant_ID) AS Total_Restaurant 
FROM restaurants
GROUP BY Smoking_Allowed,Alcohol_Service
ORDER BY Total_Restaurant DESC;

SELECT * FROM restaurant_cuisines ;

--Count of restaurants based on cuisine
SELECT Cuisine,COUNT(Restaurant_ID) AS Total_Restaurant
FROM restaurant_cuisines
GROUP BY Cuisine
ORDER BY Total_Restaurant DESC;

--State and cuisine type 
SELECT R.State,C.Cuisine
FROM restaurants AS R
JOIN restaurant_cuisines AS C
ON R.Restaurant_ID = C.Restaurant_ID
ORDER BY R.State;

--City and cuisine type 
SELECT R.City,C.Cuisine
FROM restaurants AS R
JOIN restaurant_cuisines AS C
ON R.Restaurant_ID = C.Restaurant_ID
ORDER BY R.City;

--RATING ANALYSIS

SELECT * FROM ratings;

--Average ratings for all services
SELECT AVG(Service_rating) FROM ratings;
SELECT AVG(Food_rating) FROM ratings;
SELECT AVG(Overall_rating) FROM ratings;

--Ratings given for restaurants
SELECT S.Name, R.Service_rating,R.Food_Rating,R.Overall_rating 
FROM ratings AS R
JOIN restaurants AS S
ON R.Restaurant_ID=S.Restaurant_ID
ORDER BY R.Restaurant_ID;

--Average ratings of each restaurant along with cuisine type
SELECT 
	   S.Name,
	   AVG(R.Service_rating) as Service_rating,
	   AVG(R.Overall_rating) as Overall_rating,
	   AVG(R.Food_rating) as food_rating,
	   C.cuisine
FROM      ratings AS R
INNER JOIN restaurants AS S
ON R.Restaurant_ID=S.Restaurant_ID
INNER JOIN restaurant_cuisines AS C
ON         S.Restaurant_ID = C.Restaurant_ID
GROUP BY   S.Name,C.cuisine
ORDER BY   S.Name

--Maximum ratings for all services
SELECT MAX(Overall_rating) FROM ratings;
SELECT MAX(Food_rating) FROM ratings;
SELECT MAX(Service_rating) FROM ratings;

--Minimum ratings for all services
SELECT MIN(Overall_rating) FROM ratings;
SELECT MIN(Food_rating) FROM ratings;
SELECT MIN(Service_rating) FROM ratings;

--Total customers with highest ratings in all services
SELECT 
	count(Consumer_ID) as total_customers
FROM 	ratings
WHERE 	Overall_rating = 2 AND Food_rating = 2 AND Service_rating = 2;