# Business Request-1: City-Level Fare and Trip Summary Report.
# Generate a report that displays the total trips, average fare per km, average fare per trip,
# and the percentage contribution of each city's trips to the overall trips.
# This report will help in assessing trip volume, pricing efficiency, and each city's contribution to the overall trip count.

# Fields :  city_name
# 			total_trips 
#           avg_fare_per_km 
#           avg_fare_per_trip 
#           %_contribution_to_total_trips

SELECT
	city_name, 
    COUNT(trip_id) AS total_trips,
    ROUND(SUM(fare_amount)/SUM(distance_travelled_km),0) AS avg_fare_per_km,
    ROUND(AVG(fare_amount),0) AS avg_fare_per_trip,
    ROUND(COUNT(trip_id)/(SELECT COUNT(*) FROM fact_trips)*100,2) AS pct_contribution_to_total_trips
FROM fact_trips
JOIN dim_city 
USING (city_id)
GROUP BY city_name
ORDER BY pct_contribution_to_total_trips DESC;

# Business Request - 2: Monthly City-Level Trips Target Performance Report
# Generate a report that evaluates the target performance for trips at the monthly and city level.
# For each city and month, compare the actual total trips with the target trips and categorise 
# the performance as follows: If actual trips are greater than target trips, mark it as "Above Target".
# If actual trips are less than or equal to target trips, mark it as "Below Target".
# Additionally, calculate the % difference between actual and target trips to quantify the performance gap.
# Fields: City_name
#		  month name
#		  actual trips 
#  		  target_trips
# 		  performance_status
#  		  % difference

set sql_mode = "";

WITH TripData AS (SELECT 
	c.city_name,
    d.month_name,
    COUNT(f.trip_id) AS actual_trips,
    m.total_target_trips AS target_trips
FROM fact_trips f 
JOIN targets_db.monthly_target_trips m 
ON f.city_id = m.city_id
AND f.date = m.month
JOIN dim_city c
ON c.city_id = f.city_id
JOIN dim_date d 
ON d.start_of_month = f.date
GROUP BY city_name, month_name)

SELECT 
	*,
    CASE
    WHEN actual_trips > target_trips THEN "Above Target"
    WHEN actual_trips <= target_trips THEN "Below Target"
    END AS performance_status,
    ROUND((actual_trips - target_trips)*100/target_trips,2) AS pct_difference
FROM TripData;

# Business Request-3: City-Level Repeat Passenger Trip Frequency Report
# Generate a report that shows the percentage distribution of repeat passengers by the number of trips they have taken in each city.
# Calculate the percentage of repeat passengers who took 2 trips, 3 trips, and so on, up to 10 trips. 
# Each column should represent a trip count category, displaying the percentage of repeat passengers who fall into that category out of the total repeat passengers for that city. 
# This report will help identify cities with high repeat trip frequency, which can indicate strong customer loyalty or frequent usage patterns. 
# Fields: city_name, 2-Trips, 3-Trips, 4-Trips, 5-Trips, 6-Trips, 7-Trips, 8-Trips, 9-Trips, 10-Trips

WITH RepeatPassengerData AS (SELECT 
	city_id,
    trip_count,
    repeat_passenger_count AS repeat_passenger_per_trip_count,
    repeat_passengers AS total_repeat_passengers
FROM dim_repeat_trip_distribution
JOIN fact_passenger_summary
USING (city_id, month)),

PctData AS (SELECT 
	city_id,
    city_name,
    trip_count,
    repeat_passenger_per_trip_count,
    total_repeat_passengers,
    ROUND((repeat_passenger_per_trip_count/total_repeat_passengers)*100,2) AS percentage_contribution
FROM RepeatPassengerData 
JOIN dim_city 
USING (city_id))

SELECT 
	city_name,
    MAX(CASE WHEN trip_count = '2-Trips' THEN percentage_contribution ELSE 0 END) AS 2_Trips,
	MAX(CASE WHEN trip_count = '3-Trips' THEN percentage_contribution ELSE 0 END) AS 3_Trips,
    MAX(CASE WHEN trip_count = '4-Trips' THEN percentage_contribution ELSE 0 END) AS 4_Trips,
    MAX(CASE WHEN trip_count = '5-Trips' THEN percentage_contribution ELSE 0 END) AS 5_Trips,
    MAX(CASE WHEN trip_count = '6-Trips' THEN percentage_contribution ELSE 0 END) AS 6_Trips,
    MAX(CASE WHEN trip_count = '7-Trips' THEN percentage_contribution ELSE 0 END) AS 7_Trips,
    MAX(CASE WHEN trip_count = '8-Trips' THEN percentage_contribution ELSE 0 END) AS 8_Trips,
    MAX(CASE WHEN trip_count = '9-Trips' THEN percentage_contribution ELSE 0 END) AS 9_Trips,
    MAX(CASE WHEN trip_count = '10-Trips' THEN percentage_contribution ELSE 0 END) AS 10_Trips
FROM
	PctData
GROUP BY 
	city_name
ORDER BY
	2_Trips DESC;
    
# Business Request-4: Identify Cities with Highest and Lowest Total New Passengers 
# Generate a report that calculates the total new passengers for each city and ranks them based on this value. 
# Identify the top 3 cities with the highest number of new passengers as well as the bottom 3 cities with the lowest number of new passengers, categorising them as "Top 3" or "Bottom 3" accordingly. 
# Fields: city_name
#		  total_new_passengers
#		  city_category ("Top 3" or "Bottom 3")

WITH CityNewPassengers AS (SELECT 
	city_name,
    SUM(new_passengers) AS total_new_passengers
FROM fact_passenger_summary 
JOIN dim_city 
USING (city_id)
GROUP BY city_name),

TopCities AS (
    SELECT 
        city_name,
        total_new_passengers,
        'Top 3' AS city_category
    FROM 
        CityNewPassengers
    ORDER BY 
        total_new_passengers DESC
    LIMIT 3
),

BottomCities AS (
    SELECT 
        city_name,
        total_new_passengers,
        'Bottom 3' AS city_category
    FROM 
        CityNewPassengers
    ORDER BY 
        total_new_passengers ASC
    LIMIT 3 
)

SELECT * FROM TopCities
UNION ALL
SELECT * FROM BottomCities;

# Business Request-5: Identify Month with Highest Revenue for Each City 
# Generate a report that identifies the month with the highest revenue for each city. 
# For each city, display the month_name, the revenue amount for that month, 
# and the percentage contribution of that month's revenue to the city's total revenue. 
# Fields : city_name
#		   highest_revenue_month
#		   revenue
# 	 	   percentage_contribution (%)

WITH TotalRevenueData AS (SELECT 
	city_name,
    SUM(fare_amount) AS total_revenue
FROM fact_trips
JOIN dim_city
USING (city_id)
GROUP BY city_name),

MontlyRevenueData AS (SELECT 
	city_name,
    MONTHNAME(date) AS month_name,
	SUM(fare_amount) AS monthly_revenue,
    RANK() OVER (PARTITION BY city_name ORDER BY SUM(fare_amount) DESC) AS revenue_rank
FROM fact_trips
JOIN dim_city
USING (city_id)
GROUP BY city_name, month_name)

SELECT 
	city_name,
    month_name AS highest_revenue_month,
    monthly_revenue AS revenue,
    ROUND((monthly_revenue *100 / total_revenue),2) AS percentage_contribution
FROM TotalRevenueData
JOIN MontlyRevenueData
USING (city_name)
WHERE 
    revenue_rank = 1
ORDER BY 
    percentage_contribution DESC;
    
# Business Request-6: Repeat Passenger Rate Analysis
# Generate a report that calculates two metrics: 
#				1. Monthly Repeat Passenger Rate: Calculate the repeat passenger rate for each city and month
#										 by comparing the number of repeat passengers to the total passengers. 
#				2. City-wide Repeat Passenger Rate: Calculate the overall repeat passenger rate for each city, considering all passengers across months.

# These metrics will provide insights into monthly repeat trends as well as the overall repeat behaviour for each city. 

# Fields: city_name 
#		  month 
#		  total_passengers
# 		  repeat_passengers
# 		  monthly_repeat_passenger_rate (%): Repeat passenger rate at the city and month level 
# 		  city_repeat_passenger_rate (%): Overall repeat passenger rate for each city, aggregated across months

WITH MonthlyPassengerData AS (SELECT
	city_name,
    MONTHNAME(month) AS month,
    total_passengers,
    repeat_passengers,
    ROUND((repeat_passengers / total_passengers)*100,2) AS monthly_repeat_passenger_rate
FROM fact_passenger_summary
JOIN dim_city 
USING (city_id)),

CityPassengerData AS (SELECT 
	city_name,
    ROUND(SUM(repeat_passengers) / SUM(total_passengers)*100,2) AS city_repeat_passenger_rate
FROM fact_passenger_summary
JOIN dim_city 
USING (city_id)
GROUP BY city_name)

SELECT 
	*
FROM MonthlyPassengerData
JOIN CityPassengerData
USING (city_name)
ORDER BY city_name;