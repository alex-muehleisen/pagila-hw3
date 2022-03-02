/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

select first_name || ' ' || last_name as "Actor Name"
from actor
join film_actor using (actor_id)
where film_id in (
    select film_id from film_actor
    join actor a using (actor_id)
    where a.first_name || ' ' || a.last_name  = 'RUSSELL BACALL'
)
and first_name || ' ' || last_name != 'RUSSELL BACALL' 
group by "Actor Name"
order by "Actor Name";
