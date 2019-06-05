--Base
create table categorias
  (nombre varchar (20),
  primary key (nombre));

create table producto
  (nombre varchar (20),
  id numeric(4,0),
  categoria varchar (20),
  primary key (id),
  foreign key (categoria) references categorias(nombre));

create table etapaProceso
  (prodID numeric(4,0),
  etapaID integer,
  posterior integer,
  costo numeric (5,0), 
  primary key (etapaID),
  foreign key (prodID) references producto(id));

create table ventasDiarias
  (prodID numeric(4,0),
  fecha date,
  volVentas numeric(4,0) ,
  primary key (prodID, fecha),
  foreign key (prodID) references producto(id));	
			   
insert into categorias values('electronicos');
insert into categorias values('hogar');
insert into categorias values('oficina');
										   
insert into producto values('esfero', 0001, 'oficina');
insert into producto values('disco duro externo', 0002, 'electronicos');

insert into etapaProceso values(0001, 1, 2, 100);
insert into etapaProceso values(0001, 2, 5, 200);
insert into etapaProceso values(0001, 5, 18, 300);
insert into etapaProceso values(0001, 18, 23, 100);

insert into etapaProceso values(0002, 3, 4, 200);
insert into etapaProceso values(0002, 4, 6, 100);
insert into etapaProceso values(0002, 6, 13, 50);

										   
insert into ventasDiarias values(0001, '2018-01-01', 500);
insert into ventasDiarias values(0001, '2018-01-02', 300);
insert into ventasDiarias values(0001, '2018-01-03', 50);
insert into ventasDiarias values(0001, '2018-01-04', 20);
insert into ventasDiarias values(0001, '2018-01-05', 120);
insert into ventasDiarias values(0001, '2018-01-06', 230);
insert into ventasDiarias values(0001, '2018-01-07', 340);										   
insert into ventasDiarias values(0001, '2018-01-08', 500);
insert into ventasDiarias values(0001, '2018-01-09', 300);
insert into ventasDiarias values(0001, '2018-01-10', 50);
insert into ventasDiarias values(0001, '2018-01-11', 20);
insert into ventasDiarias values(0001, '2018-01-12', 120);
insert into ventasDiarias values(0001, '2018-01-13', 230);
insert into ventasDiarias values(0001, '2018-01-14', 340);										   
insert into ventasDiarias values(0001, '2018-01-15', 500);
insert into ventasDiarias values(0001, '2018-01-1Taller4.sql6', 300);
insert into ventasDiarias values(0001, '2018-01-17', 50);
insert into ventasDiarias values(0001, '2018-01-18', 20);
insert into ventasDiarias values(0001, '2018-01-19', 120);
insert into ventasDiarias values(0001, '2018-01-20', 230);
insert into ventasDiarias values(0001, '2018-01-21', 340);										   
insert into ventasDiarias values(0001, '2018-01-22', 500);
insert into ventasDiarias values(0001, '2018-01-23', 300);
insert into ventasDiarias values(0001, '2018-01-24', 50);
insert into ventasDiarias values(0001, '2018-01-25', 20);
insert into ventasDiarias values(0001, '2018-01-26', 120);
insert into ventasDiarias values(0001, '2018-01-27', 230);
insert into ventasDiarias values(0001, '2018-01-28', 340);										   
insert into ventasDiarias values(0001, '2018-01-29', 20);
insert into ventasDiarias values(0001, '2018-01-30', 130);
insert into ventasDiarias values(0001, '2018-01-31', 30);

insert into ventasDiarias values(0002, '2018-01-01', 5000);
insert into ventasDiarias values(0002, '2018-01-02', 300);
insert into ventasDiarias values(0002, '2018-01-03', 50);
insert into ventasDiarias values(0002, '2018-01-04', 200);
insert into ventasDiarias values(0002, '2018-01-05', 1200);
insert into ventasDiarias values(0002, '2018-01-06', 2300);
insert into ventasDiarias values(0002, '2018-01-07', 3400);										   
insert into ventasDiarias values(0002, '2018-01-08', 5000);
insert into ventasDiarias values(0002, '2018-01-09', 300);
insert into ventasDiarTaller4.sqlias values(0002, '2018-01-10', 500);
insert into ventasDiarias values(0002, '2018-01-11', 200);
insert into ventasDiarias values(0002, '2018-01-12', 1200);
insert into ventasDiarias values(0002, '2018-01-13', 2230);
insert into ventasDiarias values(0002, '2018-01-14', 1340);										   
insert into ventasDiarias values(0002, '2018-01-15', 1500);
insert into ventasDiarias values(0002, '2018-01-16', 300);
insert into ventasDiarias values(0002, '2018-01-17', 50);
insert into ventasDiarias values(0002, '2018-01-18', 20);
insert into ventasDiarias values(0002, '2018-01-19', 0);
insert into ventasDiarias values(0002, '2018-01-20', 30);
insert into ventasDiarias values(0002, '2018-01-21', 30);										   
insert into ventasDiarias values(0002, '2018-01-22', 50);
insert into ventasDiarTaller4.sqlias values(0002, '2018-01-23', 30);
insert into ventasDiarias values(0002, '2018-01-24', 0);
insert into ventasDiarias values(0002, '2018-01-25', 0);
insert into ventasDiarias values(0002, '2018-01-26', 10);
insert into ventasDiarias values(0002, '2018-01-27', 20);
insert into ventasDiarias values(0002, '2018-01-28', 30);										   
insert into ventasDiarias values(0002, '2018-01-29', 200);
insert into ventasDiarias values(0002, '2018-01-30', 10);
insert into ventasDiarias values(0002, '2018-01-31', 3);										   
										   
-- punto 1)
select*from ventasDiarias;
select*from categorias;
select*from producto;
select*from etapaproceso;

-- punto 2)
with recursive recur(prodid,etapaid,posterior) as
	(select prodid,etapaid,posterior
	from etapaproceso
	union
		select etapaproceso.prodid,etapaproceso.etapaid,recur.posterior
			from etapaproceso , recur
			where etapaproceso.posterior = recur.etapaid
	)select*from recur;
-- punto 3)

create or replace function VentasAltas() returns table(prodid numeric(4,0),fecha date,ventas numeric(4,0),pos bigint) as
	$$
	begin
	return query
		select ventasdiarias.prodid,ventasdiarias.fecha,ventasdiarias.volVentas, rank() over (order by (ventasdiarias.volVentas) desc) as pos from ventasdiarias
	order by pos
	limit 5;
	end
	$$
	language 'plpgsql';
drop function VentasAltas();
select VentasAltas();
							
										   