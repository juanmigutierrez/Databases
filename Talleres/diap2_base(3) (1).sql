
------ PUNTO 2 )

create table estudiante
  (nombres varchar (20) not null,
  apellidos varchar (20) not null,
  id int,
  primary key (id)
  );
  
 create table curso
  (curso_cod varchar (7),
  nombre varchar (50),
  nombre_unid varchar (20),
  creditos int,
  primary key (curso_cod)
 );
 
 create table estCursos
  (estID int,
  curso_cod varchar (7),
  nota numeric(2,1),
  primary key (estID, curso_cod)
 );
 
insert into curso values('000', 'programacion', 'MACC', 4 );
insert into curso values('001', 'arquitectura', 'MACC', 4 );
insert into curso values('002', 'algoritmos', 'MACC', 4 );
insert into curso values('100', 'micro1', 'ECON', 4 );
insert into curso values('101', 'micro2', 'ECON', 4 );
insert into curso values('102', 'micro3', 'ECON', 4 );

insert into estudiante values('Juan', 'Perez', 8888);
insert into estudiante values('Ana', 'Gutierrez', 5555);
insert into estudiante values('Ernesto', 'Huertas', 2222);

insert into estCursos values(8888, '000', 4.2);
insert into estCursos values(5555, '000', 3.6);
insert into estCursos values(5555, '001', 4.8);
insert into estCursos values(3333, '001', 3.3);
insert into estCursos values(3333, '002', 3.3);

-- Primer punto
select nombres from estudiante where nombres like '%a%';

-- Segundo punto 

select nombres from estudiante where length(nombres)=3;

-- Cuarto punto
-- a)
select nombres from estudiante where nombres like 'A%';
-- b)
select curso_cod from(select*from estudiante where nombres like 'A%') as A inner join estCursos on A.id = estCursos.estId;
-- c)
select curso_cod from(select*from estudiante where nombres like 'A%') as A inner join (select*from estCursos where nota <=3) as B on A.id = B.estid;

--- Quinto punto

 create table curso2
  (curso_cod varchar (7),
  nombre varchar (50),
  nombre_unid varchar (20),
  creditos int,
  primary key (curso_cod)
 );

insert into curso2 values('003', 'Macro 2', 'MACC', 4 );
insert into curso2 values('004', 'Macro 4', 'MACC', 4 );
insert into curso2 values('100', 'micro1', 'ECON', 4 );


--- a )
select*from curso union all select*from curso2 order by curso_cod ;

--- b )
select*from curso union select*from curso2 order by curso_cod ;
--- c )
select*from curso intersect select*from curso2 order by curso_cod ;

--- d )
select *from curso except (select*from curso intersect select*from curso2);

--- e)
select *from curso2 except (select*from curso intersect select*from curso2);

----f)# la diferencia geometria, son todo menos los que estan juntos ?
(select *from curso except select*from curso intersect select*from curso2) union (select *from curso2 except select*from curso intersect select*from curso2);

--- g) como hago la seleccion ? 
select count(*)from((select *from curso except select*from curso intersect select*from curso2) union (select *from curso2 except select*from curso intersect select*from curso2)) as B;


----- PUNTO 3)

psql -d diap2db_3 -f ~/Downloads/taller2_base.sql

--- 2)

select*from curso where nombre_unid = 'MACC' and nombre like '%it%'; 

--- 3)

----a )

select instructor.inst_id,nombres,apellidos,nombre_unid,curso_cod from instructor left outer join dicta  on instructor.inst_id = dicta.inst_id;

--- b)
select instructor.inst_id,nombres,apellidos,curso.curso_cod from( instructor left outer join dicta on instructor.inst_id = dicta.inst_id) left outer join curso on dicta.curso_cod = curso.curso_cod;

--- c)

select nombres,apellidos,curso.nombre from( instructor left outer join dicta on instructor.inst_id = dicta.inst_id) left outer join curso on dicta.curso_cod = curso.curso_cod;
--- 4)

select avg(creditos) from curso;

--- 5)

--- a)
select curso.nombre_unid,avg(creditos) from curso left join unid_acad on curso.nombre_unid = unid_acad.nombre_unid group by curso.nombre_unid;
--- b)
select curso.nombre_unid,avg(creditos) from curso left join unid_acad on curso.nombre_unid = unid_acad.nombre_unid group by curso.nombre_unid having avg(creditos)>4 ;

--- 6)
select nombre_unid, avg(salario) as prom_salario ,min(salario) as min_salario ,max(salario) as max_salario from instructor group by nombre_unid;
























