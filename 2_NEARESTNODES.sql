## CAMBIA LA PROYECCION DEL PUNTO DE ENTRADA EN CASO DE QUE SEA NECESARIO ##  
 
 ALTER TABLE cultivo
    ALTER COLUMN geom
    TYPE Geometry(MultiPoint, 32615)
    USING ST_Transform(geom, 32615);
    
## SI TIENE VALOR Z LO ELIMINA ##
ALTER TABLE almacen 
  ALTER COLUMN geom TYPE geometry(MultiPoint, 35614) 
    USING ST_Force_2D(geom);
    
## CREA UNA TABLA E IDENTIFICA LOS NODOS MAS CERCANOS EN LA RED ## 
 
 create table cultivo_nodos as 
 select f.id as cultivo, (
  SELECT n.id
  FROM calles_vertices_pgr As n
  ORDER BY f.geom <-> n.the_geom LIMIT 1
)as closest_node
from  cultivo f

##NODOS ALMACEN/ACOPIO##
	
 create table almacen_nodos as 
 select f.id as almacen, (
  SELECT n.id
  FROM calles_vertices_pgr As n
  ORDER BY f.geom <-> n.the_geom LIMIT 1
)as closest_node
from  almacen f;

##NODOS EXPORTADORA##

 create table exportadora_nodos as 
 select f.id as exportadora, (
  SELECT n.id
  FROM calles_vertices_pgr As n
  ORDER BY f.geom <-> n.the_geom LIMIT 1
)as closest_node
from  exportadora f;

##NODOS BENEFICIO##

 create table beneficio_nodos as 
 select f.id as beneficio, (
  SELECT n.id
  FROM calles_vertices_pgr As n
  ORDER BY f.geom <-> n.the_geom LIMIT 1
)as closest_node
from  beneficio f

