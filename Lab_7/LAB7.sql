--Task 6
 CREATE SCHEMA cadre_didactice;
 go
 CREATE SCHEMA plan_studii;
 go
 CREATE SCHEMA studenti; 
 go
 ALTER SCHEMA cadre_didactice TRANSFER dbo.profesori 
 ALTER SCHEMA plan_studii TRANSFER dbo.orarul
 ALTER SCHEMA plan_studii TRANSFER dbo.discipline
 ALTER SCHEMA studenti TRANSFER dbo.studenti_reusita
 
 --Task 7
  --Quiery 18.
 SELECT distinct cadre_didactice.profesori.Nume_Profesor, cadre_didactice.profesori.Prenume_Profesor
FROM studenti.studenti_reusita
INNER JOIN cadre_didactice.profesori
ON studenti.studenti_reusita.Id_Profesor=cadre_didactice.profesori.Id_Profesor
WHERE Id_Disciplina not in( 
SELECT discipline.Id_Disciplina
FROM plan_studii.discipline
WHERE discipline.Nr_ore_plan_disciplina>60)

--Quiery 37
select top 1 x.disciplina, x.Media
from(
select  plan_studii.discipline.Disciplina as disciplina,avg(cast(studenti.studenti_reusita.Nota as float)) as Media
from studenti.studenti_reusita inner join plan_studii.discipline 
on studenti.studenti_reusita.Id_Disciplina=plan_studii.discipline.Id_Disciplina
where Tip_Evaluare='Examen' 
group by plan_studii.discipline.Disciplina
) x
order by x.Media desc
use universitatea
go

--Task 8
CREATE SYNONYM studenti_s FOR  studenti.studenti;
CREATE SYNONYM studenti_reu FOR  studenti.studenti_reusita;
CREATE SYNONYM discipline_1 FOR plan_studii.discipline
CREATE SYNONYM profesori_1 FOR cadre_didactice.profesori

  --Quiery 18.
 SELECT Nume_Profesor, Prenume_Profesor
FROM studenti_reu
INNER JOIN profesori_1
ON studenti_reu.Id_Profesor=profesori_1.Id_Profesor
WHERE Id_Disciplina not in( 
SELECT Id_Disciplina
FROM discipline_1
WHERE Nr_ore_plan_disciplina>60)



--Quiery 38
Select disciplina, cast(avg(nota*1.0)as decimal(6,4)) as Average
from studenti_reu 
INNER join discipline_1
On studenti_reu.Id_Disciplina=discipline_1.Id_Disciplina
Group by disciplina
Having cast(avg(nota*1.0)as decimal(6,4)) < (
Select cast(avg(nota*1.0)as decimal(6,4)) Average
from studenti_reu
INNER JOIN discipline_1
On studenti_reu.Id_Disciplina=discipline_1.Id_Disciplina
Where disciplina='Baze de date')