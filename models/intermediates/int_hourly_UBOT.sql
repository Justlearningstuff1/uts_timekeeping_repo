with hourly as (
    select * from {{ref("stg_UTS__hourly")}}
)

select
    s.pass,
    s.date,
    s.tcode,
    u.description as tcode_desc,
    s.total_hours,
    s.worktype,
    case
        when s.job_num is null then '0'
    else s.job_num
    end as job_num,
    s.rc,
    d.division,
    d.description as rc_desc,
    s.title,
    s.func,
    s.run
from hourly s
join {{ref("uotcodes")}} u on u.tcode = s.tcode
join {{ref("Divisions_list")}} d on d.rcode = s.rc