Adventure Ausgrabung
====================

"Adventure", oder "Die Abenteuer des Ali- Baba" ist ein Spileprojekt in Atari Basic für den gleichnamigen Computer.
Ich habe das Mitte der 1980er Jahre begonnen. Inspiration war das Buch "Atari Abenteuerspiele", Verlag Markt und Technik.
In dem Buch ist ein Basic Listing abgedruckt. Der Name des Programms "Das Auge des Strenenkriegers". 

B. Fritz, Landau den 7.9.2020

Programm laden und starten
==========================
Der source code ist modular aufgebaut und verteilt sich auf eine Hauptroutine "ADV.BAK" und meherer Unterroutinen.
Wenn man ein lauffähiges Basic Listing erzeigen möchte, dann geht man so vor:

1. LOAD "D:ADV.BAK"

Die übrige Sequenz ist in der Datei "BOOT.HLP" beschrieben:

2. ENTER "D:ADM.BAK"
3. ENTER "D:GRD.BAS"
4. ENTER "D:GRAFIK.LST"

Jetzt noch ein bischen debugging:

1. Zeile 330   : Anstatt POKE 559,0 POKE 559,46 eingeben
2. Zeie 6235   : Das GOTO 8000 in GOSUB 8000 austauschen.

RUN eingeben, die "Rohversion" läuft....

