with supervisory as (
    select s.*, u.description from {{ref("stg_UTS__supervisory")}} s 
    join {{ref("uotcodes")}} u on u.tcode = s.tcode
)

select
    s.pass,
    s.date,
    s.tcode,
    s.description as tcode_desc,
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
from supervisory s
join {{ref("Divisions_list")}} d on d.rcode = s.rc