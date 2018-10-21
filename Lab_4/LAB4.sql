
-- task no 10
select  p.Nume_Student,p.Prenume_Student
from studenti as p inner join studenti_reusita as r
on p.Id_Student = r.Id_Student 
inner join discipline as k on k.Id_Disciplina=r.Id_Disciplina
and  r.Tip_Evaluare='Examen' and k.Disciplina='Baze de date' and r.Data_Evaluare like'2018%'
where r.Nota between 4 and 8
order by r.Nota

--task no 16
select distinct p.Nume_Student,p.Prenume_Student,r.Id_Profesor
from studenti as p inner join studenti_reusita as r
on p.Id_Student = r.Id_Student 
inner join discipline as k on k.Id_Disciplina=r.Id_Disciplina
and k.Nr_ore_plan_disciplina<60
order by p.Nume_Student
 use universitatea
 go
-- task no 37
select x.Disciplina,x.Media
from(
select  d.Disciplina,avg(cast(sr.Nota as float)) as Media
from studenti_reusita as sr inner join discipline as d
on sr.Id_Disciplina=d.Id_Disciplina
where Tip_Evaluare='Examen' 
group by d.Disciplina
) x
order by x.Disciplina desc



--task no 26
 select  s.Nume_Student,s.Prenume_Student,s.Adresa_Postala_Student,x.Nume_Profesor,x.Prenume_Profesor,x.Adresa_Postala_Profesor
from (Select * from profesori where Adresa_Postala_Profesor like '%31 August%') as x
full outer join  (select * from studenti where Adresa_Postala_Student like '%31 August%') as s
on s.Adresa_Postala_Student = x.Adresa_Postala_Profesor
