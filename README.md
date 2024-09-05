COVID-19 Data Analysis using MS SQL Server

1. Environment Setup

1.1. Creating the Database

Explanation: This step involves creating a new database named covid19 and setting it as the current database for executing subsequent queries.

1.2. Viewing Tables

Explanation: These steps allow you to retrieve and view all data from the deaths and vaccination tables, helping you inspect the structure and contents of these tables.

2. SQL Queries for Analysis

2.1. Displaying Total and New Cases by Country and Date

Explanation: This section retrieves the total and new COVID-19 cases, total deaths, and population data for each country and date. The results are ordered by country and date to track the progression of cases and deaths over time.

2.2. Calculating Death Rate (in %) for Each Location

Explanation: This section calculates the death rate for each location by dividing the total deaths by the total cases and multiplying by 100 to get a percentage. It is filtered to show data for locations containing 'India' in their name and is ordered by date in descending order.

2.3. Infection Rate and Death Rate for Each Location in India

Explanation: This analysis calculates both the infection rate (total cases divided by population) and the death rate (total deaths divided by total cases) for each location in India. It provides insight into the impact of COVID-19 relative to the population and the severity of cases.

2.4. Country with the Highest Infection Rate

Explanation: This analysis identifies the country with the highest infection rate by calculating the maximum infection rate for each country. Results are grouped by country and population and ordered by population in descending order.

2.5. Country with the Highest Death Rate per Population

Explanation: This section calculates the death rate per population for each country and identifies the country with the highest death rate. The death rate is computed as the ratio of total deaths to population, multiplied by 100.

2.6. Total Death Count for Each Continent

Explanation: This section provides the total death count for each continent by selecting the maximum death count per location. It helps understand the impact of COVID-19 across different continents.

2.7. Overall Total Cases and Deaths Worldwide

Explanation: This analysis calculates the global total cases and deaths by summing new cases and total deaths across all continents. It computes the global death percentage, providing a snapshot of the worldwide impact of COVID-19.

2.8. Total Number of Cases and Deaths for Each Date

Explanation: This section calculates the total number of cases and deaths for each date, grouping results by date and ordering them chronologically. It provides insight into the progression of the pandemic over time.

2.9. Retrieving All Data from the Vaccination Table

Explanation: This step retrieves all records from the vaccination table where the continent is not null, offering a comprehensive view of vaccination data.

2.10. Percentage of the Population Fully Vaccinated for Each Country in Asia

Explanation: This analysis calculates the percentage of the population fully vaccinated for each country in Asia. It joins the deaths and vaccination tables based on location and date and groups the results by country.

