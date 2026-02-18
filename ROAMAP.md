# ROADMAP GESTIONALE A3

Sviluppo verso la versione 0.1.0. Obiettivo: conformità legale e stabilità del dato.

## 1. Validazione e Conformità XML

* **Fix Tracciato INAIL:** Revisione del modulo `convertitore_xml_3b.dart`. Attualmente il formato non è conforme; va allineato agli XSD ministeriali (campi obbligatori, gerarchia tag, codifiche ASL/ATECO).
* **Completezza Allegati:** Verifica che i dati estratti dal DB coprano tutti i nodi necessari sia per il 3A (singola cartella) che per il 3B (aggregato annuale).

## 2. Integrità Dati e Database

* **Sanificazione Input:** Blocco caratteri speciali e controllo formati su tutti i form (CF, P.IVA, Date).
* **Validazione DB:** Implementazione di check e vincoli su Drift/SQLite per impedire il salvataggio di dati parziali o incoerenti che corromperebbero l'export.
* **Error Handling:** Gestione dei crash durante le operazioni di scrittura su database locale.

## 3. Controllo Qualità e Bugfixing

* **Debug Session:** Individuazione e risoluzione bug strutturali sui flussi Azienda -> Lavoratore -> Visita.
* **Test di Carico:** Verifica della fluidità della UI con database popolati da record reali (centinaia di dipendenti).

## 4. Traguardo Versione 0.1.0

* **Compliance 81/08:** Generazione file XML pronti per l'invio telematico senza interventi manuali.
* **Stabilità Operativa:** Software testato, senza bug bloccanti nell'inserimento dati.

