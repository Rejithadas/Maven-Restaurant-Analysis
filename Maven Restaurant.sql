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