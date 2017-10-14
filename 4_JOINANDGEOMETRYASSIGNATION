## HACE UN JOIN ENTRE LA TABLA DONDE SE IDENTIFICA EL NODO MÁS CERCANO Y LA TABLA CON LOS COSTOS ## 
## AGREGA A LA TABLA CULTIVO_BENEFICIOS DOS CULUMNAS, UNA CON LOS ID DE LOS NODOS Y OTRA CON LOS COSTOS, REPETIR PARA TODAS LAS TABLAS ##

alter table cultivo_nodos add column beneficio int;
alter table cultivo_nodos add column costo float;


## CAMBIA EL NOMBRE DE LAS COLUMNAS Y HACE EL JOIN ## 

create table NOMBRE as 
select cultivo_nodos.closest_node as nodos_cultivos , 
cultivo_beneficio.end_vid as nodos_beneficios,
cultivo_beneficio.agg_cost as costo
from cultivo_nodos
join cultivo_beneficio 
on cultivo_nodos.closest_node=cultivo_beneficio.start_vid

## A LAS COLUMNAS CREADAS EN LA TABLA CULTIVO_NODOS LE AGREGA LOS VALORES DEL SUBQUERY ##

UPDATE cultivo_nodos
SET beneficio=subquery.nodos_beneficios,
beneficio_costo=subquery.costo

## HACE UN JOIN ENTRE LAS TABLAS CULTIVO_NODOS Y NODOS BENEFICIOS ##

FROM (select cultivo_nodos.closest_node as nodos_cultivos , 
cultivo_beneficio.end_vid as nodos_beneficios,
cultivo_beneficio.agg_cost as costo
from cultivo_nodos
join cultivo_beneficio 
on cultivo_nodos.closest_node=cultivo_beneficio.start_vid) AS subquery

WHERE cultivo_nodos.closest_node=subquery.nodos_cultivos;


## UNE LA TABLA RESULTANTE CON LA GEOMETRÍA DE OTRA TABLA PARA CREAR EL SHP ##

select * from calles_vertices_pgr as v
join(
	select * from cultivo_nodos WHERE beneficio IS NOT NULL
) as sub 
on v.id = sub.beneficio

