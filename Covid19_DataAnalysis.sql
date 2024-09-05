--creting database
create database COVID19

use covid19

select * from deaths

select * from [dbo].[vaccination]

--1--displaying total and new cases by country and date
select location
       ,date
       ,total_cases
       ,new_cases
       ,total_deaths
       ,population 
from deaths
order by location, date;

--2--death rate (in %) for each location, calculated as (total_deaths/total_cases) * 100

select location
       ,date
       ,total_cases
       ,total_deaths
       ,(cast(total_deaths as decimal(18,2)) / cast(total_cases as decimal(18,2))) * 100 as death_rate
from deaths
where location LIKE '%india%'
order by location, date desc;

--3--infection rate and death rate for each location in India

select location
       ,date
       ,total_cases
       ,total_deaths
       ,(cast(total_cases as decimal(18,2)) / population) * 100 as infection_rate
       ,(cast(total_deaths as decimal(18,2)) / total_cases) * 100 as death_rate
from deaths
where location LIKE '%india%'
order by location, date;


--4--Which country has the highest infection rate

select location
       ,population
       ,max(total_cases) as highestcase
       ,max((cast(total_cases as decimal(18,2)) / population) * 100) as infection_rate
from deaths
where continent is not null
group by location, population
order by population desc;


--5--ighest death rate per population

select location
       ,population
       ,max(cast(total_deaths as int)) as totaldeath
       ,max((cast(total_deaths as decimal(18,2)) / population) * 100) as death_per_population
from deaths
where continent is not null
group by location, population
order by totaldeath desc

--6--total death count for each continent

select location
       ,population
       ,max(cast(total_deaths as int)) as totaldeath
from deaths
where continent is not null
group by location, population
order by totaldeath desc

--7--overall total cases and deaths worldwide

select sum(new_cases) as totalcases
       ,sum(cast(total_deaths as int)) as totaldeaths
       ,(sum(cast(total_deaths as int)) / sum(new_cases)) * 100 as deathpercent
from deaths
where continent is not null;


--8--total number of cases and deaths for each date

select date
       ,sum(new_cases) as totalcases
       ,sum(cast(total_deaths as int)) as totaldeaths
       ,(sum(cast(total_deaths as int)) / sum(new_cases)) * 100 as deathpercent
from deaths
where continent is not null
group by date
order by date;


--9--retrieving all data from the VACCINATION table for countries in any continent

select * 
from vaccination
where continent is not null;

--10--percentage of the population is fully vaccinated for each country in Asia

select dea.location
       ,sum(dea.population) as population
       ,sum(cast(vac.new_vaccinations as int)) as vaccinated
       ,(max(cast(vac.people_fully_vaccinated as int)) / max(dea.population)) * 100 as vaccine_percent
from deaths as dea
join vaccination as vac
on dea.location = vac.location and dea.date = vac.date
where dea.continent is not null and dea.continent like '%asia%'
group by dea.location
order by vaccine_percent desc;