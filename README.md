# GoodCabs Analysis

### Provide Insights to Chief of Operations in Transportation Domain

## Overview:

Goodcabs, founded in 2022, is a rising cab service company like Ola, Uber etc making waves in the Indian market by focusing on tier-2 cities.

It is Dedicated to empowering local drivers and providing exceptional service.
Goodcabs operates in ten cities across India.

With a mission to foster sustainability and customer satisfaction, the company has set
 ambitious goals for 2024 to accelerate growth and elevate passenger experiences.

## Table of Contents:

- [Project Presentation (Video)]()
- [Live Dashboard]()
- [Tools Used]()
- [Problem Statement]()
- [Objectives]()
- [Dataset]()
- [Data Model]()
- [Dashboard Preview]()
- [Primary Questions]()
- [Secondary Questions]()
- [Insights]()
- [Recommendations]()

## Project Presentation (Video)

<p align="center">
  <a href="https://www.youtube.com/watch?v=jQbHM1GvCmE" target="_blank" rel="noopener noreferrer">
    <img 
      src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Dashboard%20Preview/1)%20Home%20Page.png" 
      alt="Presentation Preview" 
      style="width: 70%; max-width: 360px;"
    >
  </a>
</p>

## Live Dashboard:

Checkout the live dashboard here 👉🏻 [Live Dashboard](https://app.powerbi.com/view?r=eyJrIjoiMTc3OGMyZmYtMzRjYy00YmM0LWJjOGMtMmZiYTJmNDUxZDRlIiwidCI6ImM2ZTU0OWIzLTVmNDUtNDAzMi1hYWU5LWQ0MjQ0ZGM1YjJjNCJ9)

## Tools Used

- **SQL**  for Ad Hoc Requests & Database Import

- **Power BI** For Data Visualization & Dashboard

- **Canva** For Presentation Preparation

- **OBS Studio** For Audio & Video Recording & Editing

## Problem Statement

- Goodcabs management wants to evaluate key metrics like:

        1. Trip volume
        2. Passenger satisfaction
        3. Repeat passenger rate
        4. Trip distribution
        5. Balance between new and repeat passengers

- The Chief of Operations, Bruce Haryali, requires these insights urgently.

- Since Tony, the analytics manager, is busy with another project, this task has been assigned to me.

- I must deliver clear and actionable insights to Bruce within the given timeline.

## Objectives

- Review the datasets to understand the data thoroughly.

- Generate SQL reports for business questions from the Ad Hoc Requests provided from Chief of Operations

- Create a simple, easy-to-understand dashboard to showcase analysis.

- Answer key questions from the provided document using tools : SQL & Power BI.

- Preparing a convincing presentation with insights and recommendations.

## Dataset 

trips_db

    1. dim_city
    2. dim_date
    3. fact_passenger_summary (Aggregated Data)
    4. dim_repeat_trip_distribution (Aggregated Data)
    5. fact_trips

targets_db

    1. city_target_passenger_rating
    2. monthly_target_new_passengers
    3. monthly_target_trips

## Data Model

<div style="text-align: center;">
  <img 
    src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/data%20model/Data%20Model%20Preview.png" 
    alt="Data Model Preview" 
    style="max-width: 100%; height: auto;"
  >
</div>

## Dashboard Preview

  <h3>Home Page</h3>
  <img 
    src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Dashboard%20Preview/1)%20Home%20Page.png" 
    alt="Home Page" 
    style="max-width: 100%; height: auto;"
  >
  <hr>

  <h3>City Performance Page</h3>
  <p>This page highlights key metrics, showcasing top and bottom-performing cities, average fare vs. distance comparisons, and city-wise revenue with max/min trip distances.</p>
  <img 
    src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Dashboard%20Preview/2)%20City%20Performance%20Page.png" 
    alt="City Performance Page" 
    style="max-width: 100%; height: auto;"
  >
  <hr>

  <h3>Demand Patterns Page</h3>
  <p>This page provides passenger insights, including repeat trip counts, weekend vs. weekday trends, peak and low demand by month, and total trips categorized by passenger type.</p>
  <img 
    src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Dashboard%20Preview/3)%20Demand%20Patterns%20Page.png" 
    alt="Demand Patterns Page" 
    style="max-width: 100%; height: auto;"
  >
  <hr>

  <h3>Behavorial Insights Page</h3>
  <p>This page covers average driver and passenger ratings, highlights top and bottom cities by repeat passenger rate, and compares repeat passenger rates across regions.</p>
  <img 
    src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Dashboard%20Preview/4)%20Behavorial%20Insights%20Page.png" 
    alt="Behavorial Insights Page" 
    style="max-width: 100%; height: auto;"
  >
</div>

<h3>Trends Vs Targets Page</h3>
  <p>This page presents key metrics on target achievement and revenue growth rates across months and cities, along with the status of target achievement across cities.</p>
  <img 
    src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Dashboard%20Preview/5)%20Trends%20vs%20Targets%20Page.png" 
    alt="Trends Vs Targets Page" 
    style="max-width: 100%; height: auto;"
  >
</div>

## Primary Analysis: 

1. Identify the top 3 and bottom 3 cities by total trips over the entire analysis period.

<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%201%20a).png">
</p>

<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%201%20b).png">
</p>

2. Calculate the average fare per trip for each city and compare it with the city's average trip distance. Identify the cities with the highest and lowest average fare per trip to assess pricing efficiency across locations.

<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%202.png">
</p>

3. Calculate the average passenger and driver ratings for each city, segmented by passenger type (new vs. repeat). Identify cities with the highest and lowest average ratings.

<p align="center"><strong> For New Passengers </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%203%20a).png">
</p>

<p align="center"><strong> For Repeat Passengers </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%203%20b).png">
</p>

4. For each city, identify the month with the highest total trips (peak demand) and the month with the lowest total trips (low demand). 

<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%204.png">
</p>

5. Compare the total trips taken on weekdays versus weekends for each city over the six-month period. Identify cities with a strong preference for either weekend or weekday trips to understand demand variations.

<p align="center"><strong> Weekdays </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%205%20b).png">
</p>

<p align="center"><strong> Weekends </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%205%20a).png">
</p>

6. Identify which cities contribute most to higher trip frequencies among repeat passengers, and examine if there are distinguishable patterns between tourism-focused and business-focused cities.

<p align="center"><strong> Business Focused Cities </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%206%20a).png">
</p>

<p align="center"><strong> Tourism Focused Cities </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%206%20b).png">
</p>

7. For each city, evaluate monthly performance against targets for total trips, new passengers, and average passenger ratings. Determine if each metric met, exceeded, or missed the target, and calculate the percentage difference.

<p align="center"><strong> For Total Trips </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%207%20a).png">
</p>

<p align="center"><strong> For New Passengers </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%207%20b).png">
</p>

<p align="center"><strong> For Avg Passenger Rating </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%207%20c).png">
</p>

<p align="center"><strong> Trends Across Business Vs Tourism Focused Cities </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%207%20d).png">
</p>

8. Identify the top 2 and bottom 2 cities based on their RPR% to determine which locations have the strongest and weakest rates. Similarly, analyze the RPR% by month across all cities and identify the months with the highest and lowest repeat passenger rates.

<p align="center"><strong> RPR % Between Cities Across Months </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%208%20a).png">
</p>

<p align="center"><strong> Top 2 Cities </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%208%20b).png">
</p>

<p align="center"><strong> Bottom 2 Cities </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%208%20c).png">
</p>

<p align="center"><strong> RPR % Between Months Across Cities </strong></p>
<p align="center">
  <img src="https://github.com/aditya-da-3/GoodCabs-Analysis-Codebasics-RPC-13-/blob/main/Images/Primary%20Analysis%20Output/Q%208%20e).png">
</p>

