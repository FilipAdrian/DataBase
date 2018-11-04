USE universitatea
go

--task no.1
update profesori
set Adresa_Postala_Profesor = 'mun.Chisinau'
where Adresa_Postala_Profesor is null;

--task no.2
create unique index idx_cod_grupa
on grupe (cod_grupa)
exec sp_helpindex grupe;
/*
we can not create a clustered unique index
because this table alredy has 
a clustered index -primary key
*/

--task no.3

alter table grupe add sef_grupa int,prof_indrumator int ;

declare @nr_grupe int = (select COUNT(Id_Grupa)
from grupe)
declare @init int =1;


while(@init<=@nr_grupe)
	begin

			update grupe
			--selectarea sefului de grupa dupa media cea mai mare
			set sef_grupa = (select top 1 x.Id_Student
			from(
			select  Id_Student,avg(cast(Nota as float)) as Media
			from studenti_reusita 
			where Id_Grupa=@init
			group by Id_Student
			) x
			order by x.Media desc),
			--pentru selectare profesorul indrumator dupa nr de discipline maxim
			prof_indrumator = (select y.Id_Profesor
			from(
			select top 1 Id_Profesor ,count(distinct Id_Disciplina) as nr_disc
			from studenti_reusita
			where Id_Grupa=@init
			GROUP BY Id_Profesor 
			order by nr_disc desc) y)
			
			where Id_Grupa=	@init
			set @init = @init+1;
	end
--adaugare indexului unique pentru cimpurile noi create
alter table grupe add constraint prof_stud unique(sef_grupa,prof_indrumator);

--Task no.4

update studenti_reusita
set Nota =  Nota +1
where Tip_Evaluare='Examen' 
		and Id_Student = any(select sef_grupa from grupe) 
		and Nota !=10

