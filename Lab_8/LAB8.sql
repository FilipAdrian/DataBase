--Task 1
--a)
use universitatea
go
create view lab8_1
as 
select distinct studenti.Nume_Student,studenti.Prenume_Student,studenti.studenti_reusita .Id_Profesor
from studenti  inner join studenti.studenti_reusita 
on studenti.Id_Student =studenti.studenti_reusita .Id_Student 
inner join plan_studii.discipline  on plan_studii.discipline .Id_Disciplina=studenti.studenti_reusita .Id_Disciplina
and plan_studii.discipline .Nr_ore_plan_disciplina<60
go
select *
from lab8_1
--b)
select Disciplina,max(Media)
from dbo.lab8_2

--Task 2
--View-ul creat prin View Designer
update dbo.lab8_2
set Media = 10
where Disciplina like 'Practica%'

insert into dbo.lab8_2
values('OOP',3.5)

delete from dbo.lab8_2
where Disciplina like 'Practica%'

--View-ul creat prin editorul de interegorari
update dbo.lab8_1
set Prenume_Student = 'Teodor'
where Prenume_Student = 'Teodora'


--Task 3
alter view dbo.lab8_1
with schemabinding as
select distinct p.Nume_Student,p.Prenume_Student,r.Id_Profesor
from dbo.studenti as p inner join studenti.studenti_reusita as r
on p.Id_Student = r.Id_Student 
inner join plan_studii.discipline as k on k.Id_Disciplina=r.Id_Disciplina
and k.Nr_ore_plan_disciplina<60
with check option;

alter view dbo.lab8_2
with schemabinding as
SELECT        plan_studii.discipline.Disciplina, AVG(CAST(studenti.studenti_reusita.Nota AS float)) AS Media
FROM            plan_studii.discipline INNER JOIN
                         studenti.studenti_reusita ON plan_studii.discipline.Id_Disciplina = studenti.studenti_reusita.Id_Disciplina
WHERE        (studenti.studenti_reusita.Tip_Evaluare = 'Examen')
GROUP BY plan_studii.discipline.Disciplina
ORDER BY Media DESC
with check option;
select * from dbo.lab8_2

--Task 4
Alter table lab8_2
drop column disciplina 

insert into dbo.lab8_2
values('OOP',3.5)

update dbo.lab8_1
set Prenume_Student = 'Teodor'
where Prenume_Student = 'Teodora'

--Task 5
--1.
CREATE SYNONYM studenti_s FOR  studenti.studenti;
CREATE SYNONYM studenti_reu FOR  studenti.studenti_reusita;
CREATE SYNONYM discipline_1 FOR plan_studii.discipline
CREATE SYNONYM profesori_1 FOR cadre_didactice.profesori

with task10_CTE(Id_Student,Id_Disciplina) as 
( select Id_Student,Id_Disciplina
from studenti_reu
where Tip_Evaluare='Examen' and Data_Evaluare like'2018%'
and Nota between 4 and 8 )

select  p.Nume_Student,p.Prenume_Student
from studenti as p ,discipline_1, task10_CTE
where p.Id_Student = task10_CTE.Id_Student
and task10_CTE.Id_Disciplina = discipline_1.Id_Disciplina
and discipline_1.Disciplina='Baze de date'

--2.

with task16_CTE (Id_Disciplina)as(
select Id_Disciplina
from discipline_1
where Nr_ore_plan_disciplina<60)
select distinct p.Nume_Student,p.Prenume_Student,r.Id_Profesor
from studenti as p inner join studenti_reu as r
on p.Id_Student = r.Id_Student 
inner join task16_CTE on task16_CTE.Id_Disciplina =r.Id_Disciplina
order by p.Nume_Student;

--Task 6 
create table graph (
number int primary key,
next_number int);

insert into graph 
values
(5,0), (4,2), (3,2), (1,0), (2,1), (0, null);
with graph_CTE as (

select number,next_number
from graph
where number = 3 and next_number = 2

union all

 select graph.number,graph.next_number
 from graph inner join graph_CTE
 on graph.number = graph_CTE.next_number

	)
select * from graph_CTE