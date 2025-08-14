with hourly as (
    select * from {{ref("stg_UTS__hourly")}}
    where tcode = 'T0154'
)

select
    s.pass,
    s.date,
    s.tcode,
    s.total_hours,
    s.worktype,
    coalesce(s.job_num, '0') as job_num,
    s.rc,
    d.division,
    d.description as rc_desc,
    s.title,
    s.func,
    s.run
from hourly s
join {{ref("Divisions_list")}} d on d.rcode = s.rc