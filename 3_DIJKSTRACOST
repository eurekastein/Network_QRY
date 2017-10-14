## CREA UNA TABLA DONDE SE IDENTIFICAN LOS NODOS DE INICIO LOS NODOS DE LLEGADA Y LOS COSTOS## 

## COSTOS DE CULTIVOS A BENEFICIOS ## 
create table cultivo_beneficios as 
SELECT DISTINCT ON (start_vid)
       start_vid, end_vid, agg_cost
FROM   (SELECT * FROM pgr_dijkstraCost(
    'select id, source, target, costo as cost from calles',
    array(select distinct(closest_node) from cultivo_nodos),
    array(select distinct(closest_node) from almacen_nodos ),
	 directed:=false)
) as sub
ORDER  BY start_vid, agg_cost asc;

## COSTOS DE BENEFICIOS A ALMACENES ## 
create table beneficio_almacen as 
SELECT DISTINCT ON (start_vid)
       start_vid, end_vid, agg_cost
FROM   (SELECT * FROM pgr_dijkstraCost(
    'select id, source, target, costo as cost from calles',
    array(select distinct(closest_node) from cultivo_nodos),
    array(select distinct(closest_node) from beneficio_nodos),
	 directed:=false)
) as sub
ORDER  BY start_vid, agg_cost asc;



## NUMERO DE END_VID'S POR CADA START_VID, ESTO ES EL NUMERO DE DESTINOS DE CADA ORIGEN ##
SELECT start_vid, COUNT(agg_cost)
from
(SELECT * FROM pgr_dijkstraCost(
    'select id, source, target, costo as cost from calles',
    array(select closest_node from cultivo_nodos),
    array(select closest_node from beneficio_nodos),
	directed:=false)
	) as sub
group by start_vid
order by COUNT(agg_cost)
