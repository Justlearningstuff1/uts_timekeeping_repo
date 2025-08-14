with hourly_ubot as (
    select * from {{ref("int_hourly_UBOT")}}
)

select date, round(sum(total_hours),2) as total_hours from hourly_ubot
group by date
order by date