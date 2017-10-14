## SELECCIONA SOLO LOS NODOS QUE SE FORMARAN PARA EL POLIGONO SEGÚN SU ID ## 
select * from dist_beneficio_acopio where nodos_beneficios=17562;

select st_astext (geom) from dist_beneficio_acopio

## DA UNA LISTA DE LOS NODOS DE LA TABLA DEL JOIN ANTERIOR CON LA QUE SE HARÁN LOS POLIGONOS ## 
select distinct  nodos_beneficios   from dist_beneficio_acopio

## ASIGNA LA GEOMETRIA DE MULTIPOLIGON LE DA PROYECCIÓN Y CREA EL POLIGONO A PARTIR DE LOS PUNTOS ## 
insert into poligono_beneficios 
select      as id_beneficio , sub.geom
from
(SELECT * FROM st_setsrid(pgr_pointsAsPolygon('select id, st_x (st_geometryn(geom,1)) as x,  st_y  (st_geometryn(geom,1)) as y 
from dist_beneficio_acopio where nodos_beneficios=   '),32615)as geom)as sub ;
