/*Use a window function in the olympics database
to find the number of times each country had an athlete compete in the winter games
. Be sure to return the countryname
along with the count of times that country had an athlete competing.*/
--
--#2 

select distinct(country),country_id,
 		count(athlete_id) over(partition by country) as athletes_for_country

from winter_games inner join countries
on winter_games.country_id = countries.id
order by country_id








