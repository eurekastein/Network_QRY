##CREA RED##
alter table calles add column source integer;
alter table  calles add column target integer;

##CREA LA TOPOLOGIA##
 select pgr_createTopology ('calles', 0.0001, 'geom', 'id');
 select * from red

 ##AGREGA COLUMNA DE COSTOS,  Y CALCULAR EL COSTO EN FUNCION DE LA LONGITUD##
 Alter table calles add column long float;
 update calles set long=st_length (geom); 
 
 ##DA LAS FILAS EN UNA COLUMNA##
select distinct tipo_vial  from calles    

##AGREGA LA COLUMNA COSTO## 
alter table calles add column costo float;

##ASIGNA EL VALOR A LA COLUMNA COSTO##
update calles set costo =
case
    when tipo_vial like 'Carretera' then long 
    when tipo_vial like 'Avenida' then long
    else long*2
  end;
