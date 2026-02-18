// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

// convertitore_xml_3b.dart

import 'package:xml/xml.dart';
import 'database.dart';

class ConvertitoreXml3B {
  /// Trasforma la mappa dei dati aggregati generata dal Repository nel formato
  /// XML conforme alle specifiche tecniche INAIL per l'Allegato 3B.
  String generaXmlInail(Map<String, dynamic> dati) {
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="UTF-8"');

    builder.element(
      'ComunicazioneAllegato3B',
      nest: () {
        // 1. Anno di riferimento
        builder.element('AnnoRiferimento', nest: dati['anno'].toString());

        // 2. Dati Identificativi Azienda (Punti 2-8)
        final Azienda az = dati['azienda'];
        builder.element(
          'DatiAzienda',
          nest: () {
            builder.element('RagioneSociale', nest: az.ragioneSociale);
            builder.element('PartitaIvaCf', nest: az.partitaIvaCf);
            builder.element(
              'CodiceFiscaleSocieta',
              nest: az.codiceFiscaleSocieta,
            );
            builder.element(
              'IndirizzoSedeLegale',
              nest: az.indirizzoSedeLegale,
            );
            builder.element(
              'DenominazioneUnitaProduttiva',
              nest: az.denominazioneUnitaProduttiva,
            );
            builder.element(
              'IndirizzoUnitaProduttiva',
              nest: az.indirizzoUnitaProduttiva,
            );
            builder.element('CodiceAteco', nest: az.codiceAteco);
          },
        );

        // 3. Numero Lavoratori Occupati (Punti 9-10)
        builder.element(
          'LavoratoriOccupati',
          nest: () {
            builder.element(
              'Al30Giugno',
              nest: () {
                builder.element('Maschi', nest: az.occupati3006Maschi);
                builder.element('Femmine', nest: az.occupati3006Femmine);
              },
            );
            builder.element(
              'Al31Dicembre',
              nest: () {
                builder.element('Maschi', nest: az.occupati3112Maschi);
                builder.element('Femmine', nest: az.occupati3112Femmine);
              },
            );
          },
        );

        // 4. Dati Medico Competente (Punti 11-13)
        builder.element(
          'DatiMedico',
          nest: () {
            builder.element('Cognome', nest: dati['medico']['cognome']);
            builder.element('Nome', nest: dati['medico']['nome']);
            builder.element('CodiceFiscale', nest: dati['medico']['cf']);
            builder.element('Email', nest: dati['medico']['email']);
          },
        );

        // 5. Malattie Professionali (Punti 14-15)
        builder.element(
          'MalattieProfessionali',
          nest: () {
            builder.element(
              'NumeroSegnalateMaschi',
              nest: dati['malattie']['maschi'],
            );
            builder.element(
              'NumeroSegnalateFemmine',
              nest: dati['malattie']['femmine'],
            );
            builder.element(
              'Tipologie',
              nest: dati['malattie']['tipologie'].join(', '),
            );
          },
        );

        // 6. Sorveglianza Sanitaria (Punti 16-21)
        builder.element(
          'SorveglianzaSanitaria',
          nest: () {
            final s = dati['sorveglianza'];
            builder.element(
              'Visitati',
              nest: () {
                builder.element('Maschi', nest: s['visitatiM']);
                builder.element('Femmine', nest: s['visitatiF']);
              },
            );
            builder.element(
              'Idonei',
              nest: () {
                builder.element('Maschi', nest: s['idoneiM']);
                builder.element('Femmine', nest: s['idoneiF']);
              },
            );
            builder.element(
              'IdoneiParziali',
              nest: () {
                builder.element('Maschi', nest: s['parzialiM']);
                builder.element('Femmine', nest: s['parzialiF']);
              },
            );
            builder.element(
              'InidoneiTemporanei',
              nest: () {
                builder.element('Maschi', nest: s['tempInidoneiM']);
                builder.element('Femmine', nest: s['tempInidoneiF']);
              },
            );
            builder.element(
              'InidoneiPermanenti',
              nest: () {
                builder.element('Maschi', nest: s['permInidoneiM']);
                builder.element('Femmine', nest: s['permInidoneiF']);
              },
            );
          },
        );

        // 7. Esposizione Rischi (Punti 22-42)
        builder.element(
          'RischiLavorativi',
          nest: () {
            final Map<String, Map<String, int>> r = dati['rischi'];
            r.forEach((key, values) {
              builder.element(
                key.replaceAll('r', 'Rischio'),
                nest: () {
                  builder.element('VisitatiMaschi', nest: values['vM']);
                  builder.element('VisitatiFemmine', nest: values['vF']);
                  builder.element('IdoneiMaschi', nest: values['idM']);
                  builder.element('IdoneiFemmine', nest: values['idF']);
                  builder.element('ParzialiMaschi', nest: values['pM']);
                  builder.element('ParzialiFemmine', nest: values['pF']);
                },
              );
            });
          },
        );

        // 8. Alcol e Sostanze (Punti 43-44)
        builder.element(
          'AdempimentiSostanze',
          nest: () {
            builder.element(
              'Alcol',
              nest: () {
                final a = dati['alcol'];
                builder.element('ScreeningMaschi', nest: a['testM']);
                builder.element('ScreeningFemmine', nest: a['testF']);
                builder.element('InviatiSertMaschi', nest: a['sertM']);
                builder.element('InviatiSertFemmine', nest: a['sertF']);
                builder.element('ConfermatiMaschi', nest: a['posM']);
                builder.element('ConfermatiFemmine', nest: a['posF']);
              },
            );
            builder.element(
              'Stupefacenti',
              nest: () {
                final st = dati['sostanze'];
                builder.element('ScreeningMaschi', nest: st['testM']);
                builder.element('ScreeningFemmine', nest: st['testF']);
                builder.element('InviatiSertMaschi', nest: st['sertM']);
                builder.element('InviatiSertFemmine', nest: st['sertF']);
                builder.element('ConfermatiMaschi', nest: st['posM']);
                builder.element('ConfermatiFemmine', nest: st['posF']);
              },
            );
          },
        );
      },
    );

    return builder.buildDocument().toXmlString(pretty: true);
  }
}
