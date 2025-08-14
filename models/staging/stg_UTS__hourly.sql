select
    pass,
    date,
    trim(tcode) as tcode,
    (hours+(minutes/60)) as total_hours,
    worktype,
    job_num,
    rc,
    title,
    func,
    run
from {{ source("UTS_sf",'hrly_emp_2025')}}