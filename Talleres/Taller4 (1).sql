-- punto 1)
-- Total Materias
create or replace function totalmaterias()
	returns int AS
$$
Declare
	resultado int;
	i Record;
begin
	resultado := 0;
	select into resultado count(*) from curso;
	return resultado;
end;
$$
Language 'plpgsql' immutable;
---
select totalmaterias()

-- total materias creditos
create or replace function totalmateriascreditos()
	returns int AS
$$
Declare
	resultado int;
	i int;
begin
	resultado := 0;
	for i in
		select creditos from curso where creditos >0 -- por que aca no va ; ?
	loop
	resultado := resultado +i;
	end loop;
	return resultado;
end;
$$
Language 'plpgsql' immutable;
----
select totalmateriascreditos();
select*from curso;

-- total materias creditos2
create or replace function totalmateriascreditos2()
	returns int AS
$$
Declare
	resultado int;
	i record;
begin
	resultado := 0;
	for i in
		select *from curso where creditos >0 -- por que aca no va ; ?
	loop
	resultado := resultado + i.creditos;
	end loop;
	return resultado;
end;
$$
Language 'plpgsql' immutable;
---
select totalmateriascreditos2();
--- total materias creditos3
create or replace function totalmateriascreditos3(numcreditos integer)
	returns int AS
$$
Declare
	resultado int;
	i record;
begin
	resultado := 0;
	for i in
		select *from curso where creditos >0 -- por que aca no va ; ?
	loop
		if i.creditos > numcreditos then
			resultado := resultado +i.creditos;
		else
			resultado:= resultado -1; -- que es := ????
		end if;
	end loop;
	return resultado;
end;
$$
Language 'plpgsql' immutable;
--
select totalmateriascreditos3(4);

--- Reprte cursos
create or replace function reportecursos()
	returns table(codigo_curso varchar,nombre_curso varchar) as
$$
begin 
	return query
		select curso_cod as codigo_curso,nombre as nombre_curso from curso; -- por que da un vector?
end;
$$
Language 'plpgsql' immutable;
---
select reportecursos();

-- punto 3)
create or replace function razon()
	returns int as
$$
declare
	profesores int;
	grupos int;
begin 
	profesores:= 0;
	grupos:= 0;
	select into profesores count(*) from instructor;
	select into grupos count(*) from grupo;
	return profesores/grupos;
end;
$$
Language 'plpgsql' immutable;
--
select razon();
select*from grupo;

--- punto 4)
create or replace function caract(numeral integer)
returns char as
$$
begin
	if numeral < 2 then
		return 'Razon inferior a 2';
	else
		return 'Razon igual o superior a 2';
	end if;
end;
$$
Language 'plpgsql' immutable;

-- punto 5 
create or replace function razon2()
	returns char as
$$
declare
	profesores int;
	numeral float;
	grupos int;
begin 
	profesores:= 0;
	grupos:= 0;
	select into profesores count(*) from instructor;
	select into grupos count(*) from grupo;
	numeral:= profesores/grupos;
	if numeral < 2 then
		return 'Razon inferior a 2';
	else
		return 'Razon igual o superior a 2';
	end if;
end;
$$
Language 'plpgsql' immutable;
drop function razon2();
--
select razon2();
-- DIFERENCIAN INTEGER INT
select*from instructor;
select*from dicta;
select*from instructor join dicta on instructor.Inst_Id = dicta.Inst_id;
-- punto 6)
create or replace unid_acad()
returns table(unidad varchar,cursos int) as
$$
begin
	for i in
		select*from instructor join dicta instructor.Inst_Id = dicta.Inst_id;
		
		


