select 
	*
from game_sales
order by games_sold desc
limit 10

SELECT g.year, COUNT(g.name) AS num_games, ROUND(AVG(r.critic_score),2) AS avg_critic_score
FROM game_sales g
INNER JOIN reviews r
ON g.name = r.name
GROUP BY g.year
HAVING COUNT(g.name) >= 4
ORDER BY avg_critic_score DESC
LIMIT 10;

-- golden_years
select 
	u.year
	,c.num_games
	,c.avg_critic_score
	,u.avg_user_score
	,(c.avg_critic_score - u.avg_user_score) as diff
from critics_avg_year_rating c
inner join users_avg_year_rating u on u.year = c.year
group by 1,2,3,4,5
having avg(avg_critic_score) > 9 or avg(avg_user_score) > 9
order by 1 asc
limit 10
