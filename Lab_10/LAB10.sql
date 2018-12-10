--Task 1
Use universitatea
go
DROP TRIGGER plan_studii.inregistrare_noua;
go 
Create trigger inregistrare_noua on plan_studii.orarul
After update
as 
set nocount on
if UPDATE(Auditoriu)
begin
select 'Grupa ' + cast(grupe.Cod_Grupa as varchar(10))+' Lectia la disciplina  ' +UPPER(d.Disciplina)+ ' Ziua  de ' + inserted.Zi+ ' de la ora ' +
CAST(inserted.Ora as varchar(10))+
' a fost transferata in aula ' + CAST(inserted.Auditoriu as char(3)) +
' Blocul ' + inserted.Bloc + ' | Auditoriul Vechi:  ' + CAST(deleted.Auditoriu as varchar(5))
+ '| Auditoriul Nou:  ' + CAST(inserted.Auditoriu as varchar(5))
from inserted inner join discipline_1 d
on inserted.Id_Disciplina = d.Id_Disciplina
inner join grupe on grupe.Id_Grupa = inserted.Id_Grupa
inner join deleted on  deleted.Id_Disciplina = inserted.Id_Disciplina

end
go

update plan_studii.orarul
set Auditoriu = 510
where Auditoriu = 501

--Task 2 
drop trigger if exists studenti.lab10_2 
go
create trigger lab10_2 on studenti.studenti_reusita
instead of insert
as
set nocount on
begin

declare @id_Student int = (select Id_Student  from inserted)
Declare @id int= null;
set @id = (
select Id_Student from inserted
where Id_Student in (select Id_Student from studenti))
if(@id is null) 
begin
raiserror('Such id student does not exit.This id was created in student with name NewStudent',16,1)
insert into studenti
values (@id_Student,'NewStudent','NewStudent',null,null);
--insertion in table studenti reusita
insert into studenti_reu
select * from inserted
where Id_Student in (select Id_Student from studenti)
print 'Insertion was done. Congratulatons!!!'
end
else begin
select * from inserted
where Id_Student in (select Id_Student from studenti)
end 
end
go 


insert into studenti_reu
values(177,104,101,1,'Evalure',9,'2018-01-25')

select * from studenti
where Id_Student = 177

select * from studenti_reu
where Id_Student = 177

--Task 3
use universitatea
go
drop trigger if exists studenti.lab10_3
go
create trigger lab10_3 on studenti.studenti_reusita
for update as
set nocount on
begin
		declare @grupa int = (select Id_Grupa  from grupe where Cod_Grupa = 'CIB171')
	
		if( (select Id_Grupa from grupe where Id_Grupa = @grupa) is not null)
		begin
			if update(Nota)
				if (select AVG(Nota)from deleted where Nota IS NOT NULL)>(Select AVG(nota) from inserted where Nota is not null and Id_Grupa =@grupa )
					begin
					print 'Micsorare notelor pentru Grupa CIB171 este INTERZISA	'
					rollback transaction
					end
			if update(Data_Evaluare)
					begin
					print 'Modificare datei de avaluare nu este permisa pentru Grupa CIB171'
					rollback transaction
					end
		end

		else print 'Update was done !!!'
 end

 update studenti_reu set Nota = Nota -1 where Id_Grupa = 1 
 update studenti_reu set Data_Evaluare = '2018-7-12' where Id_Grupa = 1 

 --Task 4
 use universitatea
 go
drop trigger if exists lab10_4 on database
go
create trigger lab10_4 on Database
for ALTER_TABLE,DROP_TABLE
as
set nocount on
declare @id_disciplina varchar(50);
select @id_disciplina=eventdata().value('(/EVENT_INSTANCE_ALTER_TABLE/AlterTableActionList/*/Columns/Name)[1]','nvarchar(max)')
if @id_disciplina = 'Id_Disciplina'
 begin
print 'Modificare coloanei Id_Disciplina este interzisa'
rollback transaction
end
go

alter table studenti.studenti_reusita
drop column Id_Disciplina 


--Task 5 
use universitatea
go
DROP TRIGGER IF EXISTS Lab10_5 on database
GO
CREATE TRIGGER Lab10_5 
ON database
FOR ALTER_TABLE
AS
SET NOCOUNT ON
DECLARE @TimpulCurent TIME
DECLARE @Inceput TIME
DECLARE @Sfarsit TIME
SET @TimpulCurent = CONVERT(Time, GETDATE())
SET @Inceput = '8:00:00'
SET @Sfarsit = '17:00:00'
IF (@TimpulCurent  between  @Inceput and @Sfarsit)
print 'Baza de date este disponibila pentru modificare'
else
BEGIN	
PRINT 'Baza de date nu poate fi modificata inafara orelor de lucru. Ora curenta: ' + cast(@TimpulCurent as VARCHAR(20))
ROLLBACK transaction
END
GO
alter table grupe add Nume varchar(49);

--Task 6
drop trigger if exists  change_all on database
go 

 CREATE TRIGGER change_all ON DATABASE
FOR ALTER_TABLE
AS
SET NOCOUNT ON
DECLARE @Id_profesor int
DECLARE @int_I varchar(500)
DECLARE @int_M varchar(500)
DECLARE @den_T varchar(50)
SELECT @Id_profesor=EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]','nvarchar(max)')
IF @Id_profesor= 'Id_Profesor'
BEGIN 
SELECT @int_I = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)')
SELECT @den_T = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)')
SELECT @int_M = REPLACE(@int_I, @den_T, 'cadre_didactice.profesori'); EXECUTE (@int_M)
SELECT @int_M = REPLACE(@int_I, @den_T, 'studenti.studenti_reusita'); EXECUTE (@int_M)
PRINT 'Datele au fost modificate in toate tabelele'
END
go	

ALTER TABLE cadre_didactice.profesori ALTER COLUMN Id_Profesor SMALLINT
