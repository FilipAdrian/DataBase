# Task 1

Sa se scrie o instructiune T-SQL, care ar popula co Joana Adresa _ Postala _ Profesor din tabelul
profesori cu valoarea 'mun. Chisinau', unde adresa este necunoscuta

![image](https://user-images.githubusercontent.com/43296954/47969985-1d817e80-e088-11e8-9903-63f2a9c4f7f0.png)

![image](https://user-images.githubusercontent.com/43296954/47969978-fe82ec80-e087-11e8-8aac-967c196b0c3c.png)


# Task 2

Sa se modifice schema tabelului grupe, ca sa corespunda urmatoarelor cerinte:
a) Campul Cod_ Grupa sa accepte numai valorile unice ~i sa nu accepte valori necunoscute.
b) Sa se tina cont ca cheie primarii, deja, este definitii asupra coloanei Id_ Grupa. 

![image](https://user-images.githubusercontent.com/43296954/47970005-4c97f000-e088-11e8-81db-5ca8f0a41667.png)

# Task 3

La tabelul grupe, sa se adauge 2 coloane noi Sef_grupa ~i Prof_Indrumator, ambele de tip
INT. Sii se populeze campurile nou-create cu cele mai potrivite candidaturi ill baza criteriilor
de maijos:
a) $eful grupei trebuie sa aiba cea mai buna reu~itii (medie) din grupa la toate formele de
evaluare ~i la toate disciplinele. Un student nu poate fi ~ef de grupa la mai multe grupe.
b) Profesorul fndrumator trebuie sa predea un numiir maximal posibil de discipline la grupa
data. Daca nu existii o singurii candidaturii, care corespunde primei cerinte, atunci este
ales din grupul de candidati acel cu identificatorul (Id_Profesor) minimal. Un profesor nu
poate fi illdrumator la mai multe grupe.
c) Sii se scrie instructiunile ALTER, SELECT, UPDATE necesare pentru crearea coloanelor
in tabelul grupe, pentru selectarea candidatilor ~i inserarea datelor . .

![image](https://user-images.githubusercontent.com/43296954/47970013-75b88080-e088-11e8-8235-ea9f190db7a5.png)

![image](https://user-images.githubusercontent.com/43296954/47970024-98e33000-e088-11e8-93a6-7ce695ef9320.png)

# Task 4

Sa se scrie o instructiune T-SQL, care ar mari toate notele de evaluare ~efilor de grupe cu un
punct. Nota maximala (10) nu poate fi miirita. 

![image](https://user-images.githubusercontent.com/43296954/47970034-bd3f0c80-e088-11e8-8e08-1c1a6e15948f.png)

##Before

![image](https://user-images.githubusercontent.com/43296954/47970055-ebbce780-e088-11e8-9fc7-01e28c59e58c.png)

##After

![image](https://user-images.githubusercontent.com/43296954/47970059-0ee79700-e089-11e8-840d-3d21449b7174.png)

# Task 5
 Sa se creeze un tabel profesori_new, care include urmatoarele coloane:
Id_Profesor, Nume _ Profesor, Prenume _ Profesor, Localitate, Adresa _ 1, Adresa _ 2. 
a) Coloana Id_Profesor trebuie sa fie definita drept cheie primara si, in baza ei, sa fie construit un index CLUSTERED.
b) Campul Localitate trebuie sa posede proprietatea DEFAULT= 'mun. Chisinau'. 
c) Sa se insereze toate datele din tabelul profesori si tabelul profesori_new. 
Sa se scrie, cu acest scop, un numar potrivit de instructiuni T-SQL. Datele trebuie sa fie transferate in felul urmator: 
--Coloana-sursa     Coloana-destinatie 
--Id Profesor       Id Profesor 
--Nume Profesor     Nume Profesor 
--Prenume Profesor  Prenume Profesor 
--Adresa Postala Profesor  Localitate 
--Adresa Postala Profesor Adresa 1
-- Adresa Pastala Profesor Adresa 2
 --In coloana Localitate sa fie inserata doar informatia despre denumirea localitatii din coloana-sursa Adresa_Postala_Profesor. 
 --In coloana Adresa_l, doar denumirea strazii. in coloana Adresa_2, sa se pastreze numarul casei si (posibil) a apartamentului.
 
![image](https://user-images.githubusercontent.com/43296954/48978695-275f3600-f0b8-11e8-91c6-7e47405d0fa7.png)

![image](https://user-images.githubusercontent.com/43296954/48978729-9b99d980-f0b8-11e8-8ae0-59f939f38bb4.png)


# Task 6
Să se insereze datele in tabelul orarul pentru Grupa= 'CIBJ 71' (Id_ Grupa= 1) pentru ziua de luni. Toate lectiile vor avea loc în blocul de studii 'B'. Mai jos, sunt prezentate detaliile de inserare:

(ld_Disciplina = 107, Id_Profesor= 101, Ora ='08:00', Auditoriu = 202);

(Id_Disciplina = 108, Id_Profesor= 101, Ora ='11:30', Auditoriu = 501);

(ld_Disciplina = 119, Id_Profesor= 117, Ora ='13:00', Auditoriu = 501);


![image](https://user-images.githubusercontent.com/43296954/48978756-44483900-f0b9-11e8-8cdd-e29ff2d357fa.png)

![image](https://user-images.githubusercontent.com/43296954/48978792-fbdd4b00-f0b9-11e8-8bd5-566079d0b366.png)

# Task 7

Sa se scrie expresiile T-SQL necesare pentru a popula tabelul orarul pentru grupa INF171 , ziua de luni. Datele necesare pentru inserare trebuie sa fie colectate cu ajutorul instructiunii/instructiunilor SELECT si introduse in tabelul-destinatie, stiind ca: 

lectie #1 (Ora ='08:00', Disciplina = 'Structuri de date si algoritmi', Profesor ='Bivol Ion')

lectie #2 (Ora ='11 :30', Disciplina = 'Programe aplicative', Profesor ='Mircea Sorin')

lectie #3 (Ora ='13:00', Disciplina ='Baze de date', Profesor = 'Micu Elena')

![image](https://user-images.githubusercontent.com/43296954/48978777-b456bf00-f0b9-11e8-941b-eb5a5609ceba.png)

![image](https://user-images.githubusercontent.com/43296954/48978767-8f624c00-f0b9-11e8-88ef-8ab8a738ba31.png)

# Task 8

Sa se scrie interogarile de creare a indecsilor asupra tabelelor din baza de date universitatea pentru a asigura o performanta sporita la executarea interogarilor SELECT din Lucrarea practica 4. Rezultatele optimizarii sa fie analizate in baza planurilor de executie, pana la si dupa crearea indecsilor. Indecsii nou-creati sa fie plasati fizic in grupul de fisiere userdatafgroupl (Crearea si intrefinerea bazei de date - sectiunea 2.2.2)

![image](https://user-images.githubusercontent.com/43296954/48979244-6f825680-f0c0-11e8-8f23-59d6f4fff95b.png)

BEFORE
![image](https://user-images.githubusercontent.com/43296954/48979258-abb5b700-f0c0-11e8-917f-081bcc6abb62.png)
AFTER
![image](https://user-images.githubusercontent.com/43296954/48979289-3a2a3880-f0c1-11e8-8ca7-a00bc1ab23af.png)
