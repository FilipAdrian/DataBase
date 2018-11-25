# DIAGRAME, SCHEME SI SINONIME

# Task 1
 Creati o diagrama a bazei de date, folosind forma de vizualizare standard, structura careia este descrisa la inceputul sarcinilor practice din capitolul 4.
![1](https://user-images.githubusercontent.com/43139007/48711588-4c652c00-ec14-11e8-9e0e-93edde5b61f6.jpg)

# Task 2
Sa se adauge constrangeri referentiale (legate cu tabelele studenti si profesori) necesare coloanelor Sef_grupa si Prof_Indrumator (sarcina3, capitolul 6) din tabelul grupe.
![2](https://user-images.githubusercontent.com/43139007/48711589-4cfdc280-ec14-11e8-89cf-16fe2a7577eb.jpg)
![2 1](https://user-images.githubusercontent.com/43139007/48711591-4cfdc280-ec14-11e8-935a-bf51a561fdf7.jpg)

# Task 3. 
La diagrama construita, sa se adauge si tabelul orarul definit in capitolul 6 al acestei lucrari: tabelul orarul contine identificatorul disciplinei (ld_Disciplina), identificatorul profesorului (Id_Profesor) si blocul de studii (Bloc). Cheia tabelului este constituita din trei campuri: identificatorul grupei (Id_ Grupa), ziua lectiei (Z1), ora de inceput a lectiei (Ora) , sala unde are loc lectia (Auditoriu).
![3](https://user-images.githubusercontent.com/43139007/48711593-4cfdc280-ec14-11e8-8bdd-fbd95717c53e.jpg)
![3 1](https://user-images.githubusercontent.com/43139007/48711594-4cfdc280-ec14-11e8-8ffc-73fee3cc845f.jpg)

# Task 4
. Tabelul orarul trebuie sa contina si 2 chei secundare: (Zi, Ora, Id_ Grupa, Id_ Profesor) si (Zi, Ora, ld_Grupa, ld_Disciplina).
![4](https://user-images.githubusercontent.com/43139007/48711578-4b33ff00-ec14-11e8-8379-c695f35ee1f3.jpg)

# Task 5
In diagrama, de asemenea, trebuie sa se defineasca constrangerile referentiale (FK-PK) ale atributelor ld_Disciplina, ld_Profesor, Id_ Grupa din tabelului orarul cu atributele tabelelor respective.
![5](https://user-images.githubusercontent.com/43139007/48711595-4d965900-ec14-11e8-9d42-e5f042c62cf9.jpg)

# Task 6
 Creati, in baza de date universitatea, trei scheme noi: cadre_didactice, plan_studii si studenti.Transferati tabelul profesori din schema dbo in schema cadre didactice, tinand cont de dependentelor definite asupra tabelului mentionat. In acelasi mod sa se trateze tabelele orarul, discipline care apartin schemei plan_studii si tabelele studenti, studenti_reusita, care apartin schemei studenti. Se scrie instructiunile SQL respective.
![6](https://user-images.githubusercontent.com/43139007/48711586-4c652c00-ec14-11e8-825d-b5c888f12bac.jpg)

# Task 7
Modificati 2-3 interogari asupra bazei de date universitatea prezentate in capitolul 4 astfel ca numele tabelelor accesate sa fie descrise in mod explicit, tinand cont de faptul ca tabelele au fost mutate in scheme noi.
![image](https://user-images.githubusercontent.com/43296954/48979501-67c4b100-f0c4-11e8-8b4c-520a5669b84f.png)
![image](https://user-images.githubusercontent.com/43296954/48979502-875bd980-f0c4-11e8-85f4-10d9a9e16235.png)

# Task 8
Creati sinonimele respective pentru a simplifica interogarile construite in exercitiul precedent si reformulati interogarile, folosind sinonimele create.
![8 1](https://user-images.githubusercontent.com/43139007/48711583-4bcc9580-ec14-11e8-8d84-7f7799caae05.jpg)
![8 2](https://user-images.githubusercontent.com/43139007/48711584-4bcc9580-ec14-11e8-8789-ad285ca0ae86.jpg)
![8 3](https://user-images.githubusercontent.com/43139007/48711585-4c652c00-ec14-11e8-968f-6a10d346c7ce.jpg)
