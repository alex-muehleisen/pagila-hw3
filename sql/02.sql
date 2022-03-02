/*
 * Compute the country with the most customers in it. 
 */

select country.country from country
join city using (country_id)
join address using (city_id)
join customer using (address_id)
group by country.country
order by count(*) desc
limit 1;
