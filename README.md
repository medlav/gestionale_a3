# GESTIONALE A3 (MEDLAV.APP)


![Flutter](https://img.shields.io/badge/FLUTTER-3.x-000000?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/DART-3.x-000000?style=for-the-badge&logo=dart)

![Android](https://img.shields.io/badge/PLATFORM-ANDROID-000000?style=flat-square&logo=android)
![Windows](https://img.shields.io/badge/PLATFORM-WINDOWS-000000?style=flat-square&logo=windows)
![Linux](https://img.shields.io/badge/PLATFORM-LINUX-000000?style=flat-square&logo=linux)
![macOS](https://img.shields.io/badge/PLATFORM-MACOS-000000?style=flat-square&logo=apple)
![Web](https://img.shields.io/badge/PLATFORM-WEB-000000?style=flat-square&logo=googlechrome)
![iOS](https://img.shields.io/badge/PLATFORM-IOS-000000?style=flat-square&logo=ios)

![License](https://img.shields.io/badge/LICENSE-GPL--V2-DC2626?style=for-the-badge)
![Status](https://img.shields.io/badge/STATUS-EXPERIMENTAL-DC2626?style=for-the-badge)


> [!CAUTION]
> **DISCLAIMER**
> Il progetto è un esperimento tecnico iniziato oggi in modalità "build in public". Il software è in stato pre-alpha, pieno di bug e strutturalmente instabile. Lo sviluppo serve esclusivamente come studio personale sui flussi 3A/3B e sulle architetture EHR; non è un prodotto finito e non deve essere usato per scopi lavorativi.

Questo progetto rappresenta un ambiente di sperimentazione per lo sviluppo di sistemi EHR (Electronic Health Record) dedicati alla medicina del lavoro. Il focus primario è l'analisi tecnica e l'implementazione degli standard ministeriali previsti dal D.Lgs. 81/08, con particolare attenzione alla generazione dei flussi dati per gli Allegati 3A e 3B.

Il software è da intendersi come un esperimento didattico finalizzato a testare la gestione di database relazionali locali e la serializzazione di report conformi alle specifiche tecniche INAIL.
Hai ragione. Se un utente scarica il repo, non gliene frega niente di come hai generato le icone; vuole sapere come far girare l'app e cosa fa il software. Il README deve essere orientato all'uso e all'architettura, non ai tuoi task di dev.

---

## GESTIONALE A3 (MEDLAV.APP)

Software per la gestione della medicina del lavoro (D.Lgs. 81/08). Gestisce anagrafiche, visite e genera i file XML per l'invio obbligatorio all'INAIL.

## COSA FA IL SOFTWARE

* **Aziende:** Inserimento e gestione anagrafica ditte.
* **Lavoratori:** Gestione dipendenti (assunti/cessati) e mansioni.
* **Visite:** Registro visite mediche, esami e giudizi di idoneità.
* **Cartella 3A:** Storico sanitario individuale di ogni lavoratore.
* **Allegato 3B:** Calcolo automatico e creazione file XML per l'invio ministeriale.
* **Privacy:** Database locale SQLite (Drift). I dati non escono dal computer.

---

## ARCHITETTURA DEL CODICE

* `data/database.dart`: Struttura tabelle SQL (Aziende, Lavoratori, Visite).
* `data/calcolatore_3b.dart`: Logica che somma i dati per il report INAIL.
* `data/convertitore_xml_3b.dart`: Scrittura del file XML finale.
* `views/`: Schermi per l'inserimento rapido dei dati.

---

## COMPILAZIONE

Serve Flutter 3.x installato.

1. **Scarica pacchetti:**
`flutter pub get`
2. **Crea database e icone:**
`dart run build_runner build --delete-conflicting-outputs`
`dart run flutter_launcher_icons`
3. **Lancia su Windows:**
`flutter run -d windows`

---

## ROADMAP (PROSSIMI PASSI)

1. **Validazione XML:** Controllo che i file generati passino il portale INAIL senza errori.
2. **Backup:** Sistema per esportare/importare il database SQLite.
3. **Stampa:** Esportazione delle cartelle sanitarie in PDF.

---

## LICENZA

GPL v2.0. Il codice è libero, ma se lo modifichi e lo distribuisci, devi condividere e rilasciare anche le tue modifiche con questa licenza [Vedi Licenza](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html).

---
