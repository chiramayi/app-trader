/*For each Tennessee county in the population table in the ecd database:
a. create a partition to find the maximum population(max_pop) values in the
table.
b. Also find the minimum population (min_pop) for each county.*/

select distinct(population.county),
max(population) over() as max_population,
min(population) over() as min_population
from population














