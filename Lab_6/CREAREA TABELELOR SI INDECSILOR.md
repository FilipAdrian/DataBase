#Task 1

Sa se scrie o instructiune T-SQL, care ar popula co Joana Adresa _ Postala _ Profesor din tabelul
profesori cu valoarea 'mun. Chisinau', unde adresa este necunoscuta

![image](https://user-images.githubusercontent.com/43296954/47969985-1d817e80-e088-11e8-9903-63f2a9c4f7f0.png)

![image](https://user-images.githubusercontent.com/43296954/47969978-fe82ec80-e087-11e8-8aac-967c196b0c3c.png)


#Task 2

Sa se modifice schema tabelului grupe, ca sa corespunda urmatoarelor cerinte:
a) Campul Cod_ Grupa sa accepte numai valorile unice ~i sa nu accepte valori necunoscute.
b) Sa se tina cont ca cheie primarii, deja, este definitii asupra coloanei Id_ Grupa. 

![image](https://user-images.githubusercontent.com/43296954/47970005-4c97f000-e088-11e8-81db-5ca8f0a41667.png)

#Task 3

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

#Task 4

Sa se scrie o instructiune T-SQL, care ar mari toate notele de evaluare ~efilor de grupe cu un
punct. Nota maximala (10) nu poate fi miirita. 

![image](https://user-images.githubusercontent.com/43296954/47970034-bd3f0c80-e088-11e8-8e08-1c1a6e15948f.png)

##Before

![image](https://user-images.githubusercontent.com/43296954/47970055-ebbce780-e088-11e8-9fc7-01e28c59e58c.png)

##After

![image](https://user-images.githubusercontent.com/43296954/47970059-0ee79700-e089-11e8-840d-3d21449b7174.png)
