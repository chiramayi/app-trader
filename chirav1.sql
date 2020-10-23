--												app trader project
with average_review_counts as (select app_store_apps.name,
							   (cast(app_store_apps.review_count as int) + cast(play_store_apps.review_count as int)/2) as average_review_count
							   from app_store_apps inner join play_store_apps
								on app_store_apps.name = play_store_apps.name
							   order by average_review_count)

select distinct(app_store_apps.name), 
				ROUND(play_store_apps.rating / .5, 0) * .5 as Play_store_rating , 
				ROUND(app_store_apps.rating / .5, 0) * .5 as app_store_rating ,
				primary_genre, app_store_apps.price,
				(ROUND(play_store_apps.rating / .5, 0) * .5 +ROUND(app_store_apps.rating / .5, 0) * .5)/2 as avg_rating,
				cast(app_store_apps.review_count as int) as app_store_review_count,
				play_store_apps.review_count as play_store_app_review_count,
				average_review_count
from app_store_apps inner join play_store_apps
				on app_store_apps.name = play_store_apps.name
				inner join average_review_counts on app_store_apps.name = average_review_counts.name
where average_review_count > 1000000
				and app_store_apps.price <= 1.00
or play_store_apps.type= 'free'
order by avg_rating desc

