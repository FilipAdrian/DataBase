**# Task1:** 
Creati o baza de date plasata fizic m mapa MyDocuments\Data, fixand o crestere a fisierului primar a bazei de 16MB cu limita de crestere de 128 MB si a log-ului de 64 MB cu limita de crestere de 1024 MB. Pentru fisierele secundare sa se defineasca un Filegroup nou implicit, setand cresterea fisierelor secundare de 64 MB cu limita de 1024 MB. 
![screenshot_4](https://user-images.githubusercontent.com/43296954/45598885-30ae9100-b9eb-11e8-8922-2a14226ee9be.png)

**# Task2:** 
Creati o baza de date, unde fisierul log sa fie fizic plasat in mapa MyDocuments\Log, numele fisierului log in mediul sistemului de operare trebuie sa se deosebeasca de cel logic definit in schema fizica. Este important ca baza de date creata sa fie compatibila cu sistemul MS SQL Server 2017 si ea sa fie accesibila numai unui singur utilizator intr-un moment de timp.
![screenshot_3](https://user-images.githubusercontent.com/43296954/45598884-30ae9100-b9eb-11e8-85f6-1c83a58cc022.png)

**# Task 3:**
Creati planul de intretinere a bazei de date, construita in sarcina 1. Spatiul neutilizat de fisierele bazei de date trebuie indepartat atunci cand el atinge marimea 2000Mb. Spatiul eliberat trebuie sa fie returnat sistemului de operare. Aceasta operatiune trebuie sa ruleze in fiecare vineri, la ora 00:00. Raportul executarii planului de intretinere trebuie salvat in dosarul MyDocuments\SQL_event_logs. lnitializati executarea planului. Dupa executare, verificati rezultatele m fisierul log.
![screenshot_1](https://user-images.githubusercontent.com/43296954/45598883-30ae9100-b9eb-11e8-803f-686fa89bfa36.png)

**# Task 4:** 
Creati planul de intretinere a bazei de date, construite in exercitiul 2. Numele planului va fi: ,,Reconstruire index". In cadrul acestui plan, sistemul trebuie sa realizeze reconstruirea indecsilor numai asupra tabelelor de baza (exclusiv viziunilor) din toate schemele care exista in baza de date in cauza. Spatiul liber pe pagina trebuie sa fie 10%. Sortarea indecsilor trebuie sa se realizeze in tempdb. Dupa reconstruire, trebuie sa urmeze colectarea statisticilor complete despre indecsii reconstruiti. Al treilea pas al planului trebuie sa constituie sarcina de stergere a istoriei despre operatiile de Backup-Restore ce au avut loc pe SQL Server. Trebuie sters istoricul care este mai vechi de 6 saptamani. Acest plan trebuie sa fie executat in fiecare prima duminica a lunii. Creati dosarul MyDocuments\SQL_reports. Raportul de executare a planului trebuie sa fie adaugat in acest fisier. Procesul de mentenanta - sa fie logat in mod extended. lnitializati executarea planului. Dupa executare, verificati rezultatele m fisierul log generat.
![screenshot_5](https://user-images.githubusercontent.com/43296954/45598886-30ae9100-b9eb-11e8-98b1-d0494d6fa330.png)
 
