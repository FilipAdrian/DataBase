# Task 1
Sa se creeze doua viziuni in baza interogarilor formulate in doua exercitii indicate din capitolul
Prima viziune sa fie construita in Editorul de interogari, iar a doua, utilizand View Designer.
 ### Editorul de interogari
![image](https://user-images.githubusercontent.com/43296954/48982968-bdfc1900-f0f1-11e8-8f21-50a69ac38e70.png)

### View Designer
![image](https://user-images.githubusercontent.com/43296954/48982997-306cf900-f0f2-11e8-949f-ceb9afa0156a.png)
![image](https://user-images.githubusercontent.com/43296954/48983074-f6e8bd80-f0f2-11e8-8144-168d67ef69f3.png)

# Task 2
Sa se scrie cate un exemplu de instructiuni INSERT, UPDATE, DELETE asupra viziunilor create. 
Sa se adauge comentariile respective referitoare la rezultatele executarii acestor instructiuni.

![image](https://user-images.githubusercontent.com/43296954/48984338-23a4d100-f103-11e8-9256-0b9e88cac156.png)

![image](https://user-images.githubusercontent.com/43296954/48984351-551d9c80-f103-11e8-963b-42dc96f90383.png)

![image](https://user-images.githubusercontent.com/43296954/48984395-bf364180-f103-11e8-80d1-bdf0c01d175b.png)

In urma incercarii de a executa intructiunile INSERT, UPDATE, DELETE asupra viziunilor create, am constatat faptul ca nu putem modifica viziunele deoarece ele nu satisfact conditiile viziunii ,cum ar fi :

-> primul view contine clauza distinct

-> a doua viziune contine clauzele Group By, Order By si plus la asta se utilizeasa functii cum ar fi AVG care nu perminte modificare view-ului

# Task 3
Sa se scrie instructiunile SQL care ar modifica viziunile create (in exercitiul 1) in asa fel, incat sa nu fie posibila modificarea sau stergerea tabelelor pe care acestea sunt definite si viziunile sa nu accepte operatiuni DML, daca conditiile clauzei WHERE nu sunt satisfacute.

![image](https://user-images.githubusercontent.com/43296954/49343266-bba83a80-f66e-11e8-9777-de4aa2a3eb1e.png)

# Task 4
Sa se scrie instructiunile de testare a proprietatilor noi definite.

![image](https://user-images.githubusercontent.com/43296954/49343275-e2667100-f66e-11e8-8fad-c29feccd1823.png)

# Task 5
Sa se rescrie 2 interogari formulate in exercitiile din capitolul 4, in asa fel incat interogarile imbricate sa fie redate sub forma expresiilor CTE.

![image](https://user-images.githubusercontent.com/43296954/49343466-51919480-f672-11e8-8cdc-bfcbba0ea25b.png)

![image](https://user-images.githubusercontent.com/43296954/49343512-412de980-f673-11e8-9f1b-1635dcc70dcd.png)

# Task 6
Se considera un graf orientat, si fie se doreste parcursa calea de la nodul id = 3 la nodul unde id = 0. Sa se faca reprezentarea grafului orientat in forma de expresie-tabel recursiv.

![lab8 6](https://user-images.githubusercontent.com/43128425/48984134-b8f29600-f100-11e8-9d5c-ca6a47ff7f15.PNG)

Sa se observe instructiunea de dupa UNION ALL a membrului recursiv, precum si partea de pana la UNION ALL reprezentata de membrul-ancora.

![image](https://user-images.githubusercontent.com/43296954/49343609-805d3a00-f675-11e8-8aa2-165d1ea89a5d.png)

