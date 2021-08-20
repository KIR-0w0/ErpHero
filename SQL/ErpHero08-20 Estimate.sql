select es.estimate_code, es.estimate_date, ve.vender_name, es.estimate_req_name
from HERO_ESTIMATES es, HERO_EMPLOYEES em, HERO_ESTIMATE_PRODUCTS ESP, HERO_PRODUCTS PR, HERO_VENDERS VE
WHERE 
    es.estimate_code = esp.ep_estimate_code and
    esp.ep_product_code = pr.product_code and
    es.estimate_vender_code = ve.vender_code;
    
select es.estimate_code, es.estimate_date, ve.vender_name, es.estimate_req_name
from hero_estimates es, hero_venders ve
where es.estimate_vender_code = ve.vender_code
and es.estimate_date between '2021-08-01' and '2021-08-31'
    
