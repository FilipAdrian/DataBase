--Task 1
CREATE SYNONYM studenti_s FOR  studenti.studenti;
CREATE SYNONYM studenti_reu FOR  studenti.studenti_reusita;
CREATE SYNONYM discipline_1 FOR plan_studii.discipline
CREATE SYNONYM profesori_1 FOR cadre_didactice.profesori
--1.
use universitatea go
drop procedure if exists inter_26;
go
create procedure inter_26
@Adresa varchar(50) 
as 
Begin 
 select  s.Nume_Student,s.Prenume_Student,s.Adresa_Postala_Student,x.Nume_Profesor,x.Prenume_Profesor,x.Adresa_Postala_Profesor
from (Select * from profesori_1
where Adresa_Postala_Profesor like @Adresa) as x
full outer join  (select * from studenti
where Adresa_Postala_Student like @Adresa) as s
on s.Adresa_Postala_Student = x.Adresa_Postala_Profesor
end 
go
Set NOCOUNT On
Exec inter_26 @Adresa = '%31 August%'
--2.
drop procedure if exists inter_10
go
create procedure inter_10
@Tip_Evaluare varchar(50),
@Disciplina varchar(50),
@Data varchar(20),
@Nota_min int,
@Nota_max int
as 
Begin
select  p.Nume_Student,p.Prenume_Student
from studenti as p inner join studenti_reu as r
on p.Id_Student = r.Id_Student 
inner join discipline_1 as k on k.Id_Disciplina=r.Id_Disciplina
where r.Tip_Evaluare=@Tip_Evaluare and k.Disciplina=@Disciplina and r.Data_Evaluare like @Data
and r.Nota between @Nota_min and @Nota_max
end
go
Exec inter_10 'Examen','Baze de date','2018%',4,8;

--Task 2
drop procedure if exists task2
go
create procedure task2
@Nr_de_Studenti int = NULL output
as
begin
set @Nr_de_Studenti=( select count( distinct Id_Student)
from studenti_reu
where Nota<5 or Nota is null)
end
go
Set NOCOUNT On
declare @Nr_de_Studenti_careNuAuSustinut int
exec task2 @Nr_de_Studenti_careNuAuSustinut output
print 'Numarul de studenti care nu au sustinut cel putin o evaluare este  ...' + 
cast(@Nr_de_Studenti_careNuAuSustinut as varchar(10));
go

--Task 3
drop procedure if exists task3
go
create procedure task3
@Nume varchar(50),
@Prenume varchar(50),
@Data date,
@Adresa varchar(500),
@Cod_Grupa char(6)
as 
begin
 declare @Id int =(select max(Id_Student)
		from studenti) +1;
		insert into studenti
		values(@Id,@Nume,@Prenume,@Data,@Adresa);
		insert into studenti_reu
		values(@Id,105,108,(SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = @Cod_Grupa),
		'Testul 1',Null,'2018-10-15')
end
go
set nocount on
exec task3 'Filip','Adrian','1998-08-01','mun.Straseni','TI171'
select * from studenti


--Task 4

DROP PROCEDURE IF EXISTS task4
GO
CREATE PROCEDURE task4
@nume_prof_vechi VARCHAR(60),
@prenume_prof_vechi VARCHAR(60),
@nume_prof_nou VARCHAR(60),
@prenume_prof_nou VARCHAR(60),
@Id_disciplina int

AS

IF(( SELECT Id_Disciplina FROM discipline_1 WHERE Id_Disciplina = @Id_disciplina)
     IN (SELECT DISTINCT Id_Disciplina FROM studenti_reu WHERE Id_Profesor =
	   (SELECT Id_Profesor FROM profesori_1 WHERE Nume_Profesor = @nume_prof_vechi 
							                        AND Prenume_Profesor = @prenume_prof_vechi)))
BEGIN

UPDATE studenti_reu
SET Id_Profesor =  (SELECT Id_Profesor
		    FROM profesori_1
		    WHERE Nume_Profesor = @nume_prof_nou
	            AND   Prenume_Profesor = @prenume_prof_nou)

WHERE Id_Profesor = (SELECT Id_profesor
		     FROM profesori_1
     		     WHERE Nume_Profesor = @nume_prof_vechi
	             AND Prenume_Profesor = @prenume_prof_vechi)

END
ELSE
BEGIN
  PRINT 'Something goes wrong.Please Check the input '
END
go
--set nocount on 
--exec task4 'filip','adrian','irina','calmis',108

set nocount on 
exec task4 'Micu','Elena','Avram','Sanda',107

--Task 5
use universitatea
go
drop procedure if exists task5
go
create procedure task5
@discplina varchar(100)
as
begin

declare @temp_result table(Id_Student int,Media float);
insert into @temp_result
select top 3 Id_Student ,avg(cast(Nota as float)) as media
from studenti_reu as sr inner join discipline_1 as d
on sr.Id_Disciplina=d.Id_Disciplina
where Disciplina = @discplina
group by Id_Student
order by media desc;
select * from @temp_result;

select Cod_Grupa,concat(Nume_Student,' ' ,Prenume_Student) AS Nume_Prenume_Student,Disciplina,
Nota as Nota_Veche,iif(nota > 9, 10, nota + 1) AS Nota_Noua
from grupe,studenti,discipline_1,studenti_reu,temp_result
where discipline_1.Id_Disciplina = studenti_reu.Id_Disciplina
and grupe.Id_Grupa=studenti_reu.Id_Grupa
and studenti.Id_Student = studenti_reu.Id_Student
and studenti.Id_Student = temp_result.Id_Student
and Disciplina = @discplina
and Tip_Evaluare = 'Examen'

update studenti_reu
set Nota = (case when Nota<10 then Nota+1 end)
where Tip_Evaluare = 'Examen'
and Id_Disciplina in (select Id_Disciplina
					  from discipline_1
					  where Disciplina=@discplina	)
and Id_Student in (Select Id_Student from temp_result)
end
go

set nocount on
exec task5 'Integrare informationala europeana'

--Task 6
--1.
drop function if exists task6
go
create function task6 ( @Tip_Evaluare varchar(50) , @Disciplina varchar(50),
@Data varchar(20),@Nota_min int,@Nota_max int)

returns table
as
return
(select  p.Nume_Student,p.Prenume_Student
from studenti as p inner join studenti_reu as r
on p.Id_Student = r.Id_Student 
inner join discipline_1 as k on k.Id_Disciplina=r.Id_Disciplina
where r.Tip_Evaluare=@Tip_Evaluare and k.Disciplina=@Disciplina and r.Data_Evaluare like @Data
and r.Nota between @Nota_min and @Nota_max)
go
select * from dbo.task6('Examen','Baze de date','2018%',4,8)

--2.
drop function if exists task6_1
go
create function task6_1(@Adresa varchar(50))
returns table
as
return
( select  s.Nume_Student,s.Prenume_Student,s.Adresa_Postala_Student,x.Nume_Profesor,x.Prenume_Profesor,x.Adresa_Postala_Profesor
from (Select * from profesori_1
where Adresa_Postala_Profesor like @Adresa) as x
full outer join  (select * from studenti
where Adresa_Postala_Student like @Adresa) as s
on s.Adresa_Postala_Student = x.Adresa_Postala_Profesor)
go
select * from dbo.task6_1('%31 August%')

--Task 7
DROP FUNCTION IF EXISTS virsta
GO

CREATE FUNCTION virsta (@data_nasterii DATE )
RETURNS INT
as
 BEGIN
 DECLARE @varsta INT
 SELECT @varsta = (SELECT (YEAR(GETDATE()) - YEAR(@data_nasterii) - CASE 
 						WHEN (MONTH(@data_nasterii) > MONTH(GETDATE())) OR (MONTH(@data_nasterii) = MONTH(GETDATE()) AND  DAY(@data_nasterii)> DAY(GETDATE()))
						THEN  1
						ELSE  0
						END))
 RETURN @varsta
 END
 go
 select dbo.virsta('2000-06-22') as virsta

 --Task 8
 DROP FUNCTION IF EXISTS task8
GO

CREATE FUNCTION task8 (@Nume_Prenume_Student VARCHAR(50))
RETURNS TABLE 
AS
RETURN
(SELECT concat(Nume_Student,' ' ,Prenume_Student) AS Nume_Prenume_Student, Disciplina, Nota, Data_Evaluare
 FROM studenti, discipline_1, studenti_reu
 WHERE studenti.Id_Student = studenti_reu.Id_Student
 AND discipline_1.Id_Disciplina = studenti_reu.Id_Disciplina 
 AND Nume_Student + ' ' + Prenume_Student = @Nume_Prenume_Student )
 go
 select * from dbo.task8('Brasovianu Teodora')