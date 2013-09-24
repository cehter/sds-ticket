#Sprachdialog-Ticketsystem

Projektarbeit mit dem Ziel ein Ticketsystem zu entwickeln, das ermöglicht den Ticketstatus via Telefon zu erfragen und eine Aufnahme zu hinterlassen. Dieses System benötigt ein Sprachdialogsystem, ein Web-Frontend sowie eine Datenbank. Über den Sprachdialog ist es möglich den Status eines Tickets abzufragen und eine Nachricht zu diesem Tickt aufzunehmen. Die Legitimation erfolgt über die Automatic Number Identification (ANI).
Über das Web-Frontend ist es möglich neue Tickets anzulegen, Kommentare zu
schreiben, Nachrichten anzuhören und sich einen Report der Tickets auszugeben.

Die VoiceXML Anwendung wird dynamisch erzeugt. Das bedeutet eine serversei-
tige Skriptsprache generiert den VoiceXML Code. In diesem Projekt wurde Ruby
on Rails verwendet.

#Funktion

##Sprachdialog

Es wird ein Rootdokument verwendet, dass die Funktionen: help, nomatch, noinput und exit global definiert. Diese können somit in jedem Voice-xml Dokument aufgerufen werden. 
Modulübersicht:
**start:** Das Startdokument liest die ANI ein und gibt diese zur Prüfung an das
Modul pinEingabe weiter
**pinEingabe:** Es wird geprüft ob die ANI in der DB hinterlegt ist. Sollte dies
nicht der Fall sein wird der Benutzer darüber informiert und das Gespräch
beendet. Ist die ANI hinterlegt, wird er Benutzer aufgefordert seine PIN
einzugeben. Dieser Wert wird an pinCheck weitergeleitet. Zusätzlich legt das
Modul pinEingabe einen neuen Eintrag in die Datenbanktabelle Report an,
mit der korrekten ANI.
**pinCheck:** Ist die PIN korrekt, erfolgt die Weiterleitung an das Modul ticke-
tEingabe.
**ticketEingabe:** Der Benutzer wird begrüßt und aufgefordert eine Ticketnummer
anzugeben. Die eingegebene Nummer wird wiederholt und der Benutzer muss
bestätigen ob diese korrekt ist oder nicht. Wurde die Ticketnummer korrekt
verstanden und vom Nutzer bestätigt erfolgt eine Weiterleitung an das Modul
ticketCheck.
**ticketCheck:** Die Ticketnummer wird mit der Datenbank abgeglichen. Sollte die
Nummer nicht in der Datenbank sein, wird der Benutzer informiert und an
die ticketEingabe weitergeleitet. Ist die Nummer vorhanden, wird das Modul
nachricht aufgerufen.
**nachricht:** Der Benutzer bekommt Informationen über das Ticket und kann
eine Nachricht hinterlassen. Weiterhin wird zuvor in pinEingabe angelegt
Datenbankeintrag in der Tabelle Report aktualisiert. Für jedes abgerufene
Ticket, wird der Wert erhöht. Wurde eine Nachricht aufgenommen, wird diese
gespeichert und in die Aufnahme Datenbank gespeichert. Zusätzlich wird der
Wert in der Tabelle Report aktualisiert.
**ende:** In das Modul ende gelangt man unter anderem über die globale Gram-
matik. Bevor das Programm beendet wird, wird der Benutzer gefragt ob er
noch ein Ticket abfragen möchte.

##Webinterface
Zur besseren Visualisierung des Webinterfaces habe ich ein Screendesign erstellt. Nachdem Login wird eine Übersicht der vorhanden Tickets
angezeigt. Klickt der Benutzer auf ein Ticket kann er das Ticket schließen, Kommentare hinzufügen und sich Recordings anhören. Die Reports können über einen eigenen Navigationspunkt angewählt werden. Hier besteht die Auswahl zwischen Mengenreport und Qualitätsreport. Angezeigt werden die Anrufen und die Stunden für ein gewähltes Datum. Ob die Darstellung als Grafik oder Tabelle erfolgt steht noch nicht fest.
Mockups der Funktionalität.
![Mockup Teil1](http://cla.udia-ceh.de/images/mockup_sds_teil1.png)
![Mockup Teil2](http://cla.udia-ceh.de/images/mockup_sds_teil2.png)


#Installation

Ablauf der Installation:
* Ruby installieren
* Ruby gems installieren
* Rails als gem installieren

Es wird die Datenbank: ticketsystem_development benötigt. Die Datenbank Ta-
bellen werden über Rails angelegt. Hierzu muss im Ordner Ticketsystem der Befehl: `rake db:migrate` ausgeführt werden. Die Ausgabe sollte nun bestätigen, dass die Tabellen angelegt wurden. Mit dem Befehl ruby scriptserver wird der lokale Rails-Server gestartet.
Die Adresse: `http://localhost:3000/ticketsystem/start` startet den Sprachdialog.
Die Adresse: `http://localhost:3000/ticketsystem/login` führt zur Webseite.
Im Ordner `app/controller` befindet sich die Datei `ticketsystem_controller.rb`. In
dieser werden die Rails Funktionen ausgeführt und zu den jeweiligen VXML Da-
teien weitergeleitet.
Die VXML Dateien liegen im Ordner `app/views/ticketsystem`.

