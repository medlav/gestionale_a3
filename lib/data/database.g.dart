// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AziendeTable extends Aziende with TableInfo<$AziendeTable, Azienda> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AziendeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ragioneSocialeMeta = const VerificationMeta(
    'ragioneSociale',
  );
  @override
  late final GeneratedColumn<String> ragioneSociale = GeneratedColumn<String>(
    'ragione_sociale',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partitaIvaCfMeta = const VerificationMeta(
    'partitaIvaCf',
  );
  @override
  late final GeneratedColumn<String> partitaIvaCf = GeneratedColumn<String>(
    'partita_iva_cf',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codiceFiscaleSocietaMeta =
      const VerificationMeta('codiceFiscaleSocieta');
  @override
  late final GeneratedColumn<String> codiceFiscaleSocieta =
      GeneratedColumn<String>(
        'codice_fiscale_societa',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _indirizzoSedeLegaleMeta =
      const VerificationMeta('indirizzoSedeLegale');
  @override
  late final GeneratedColumn<String> indirizzoSedeLegale =
      GeneratedColumn<String>(
        'indirizzo_sede_legale',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _denominazioneUnitaProduttivaMeta =
      const VerificationMeta('denominazioneUnitaProduttiva');
  @override
  late final GeneratedColumn<String> denominazioneUnitaProduttiva =
      GeneratedColumn<String>(
        'denominazione_unita_produttiva',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _indirizzoUnitaProduttivaMeta =
      const VerificationMeta('indirizzoUnitaProduttiva');
  @override
  late final GeneratedColumn<String> indirizzoUnitaProduttiva =
      GeneratedColumn<String>(
        'indirizzo_unita_produttiva',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _codiceAtecoMeta = const VerificationMeta(
    'codiceAteco',
  );
  @override
  late final GeneratedColumn<String> codiceAteco = GeneratedColumn<String>(
    'codice_ateco',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occupati3006MaschiMeta =
      const VerificationMeta('occupati3006Maschi');
  @override
  late final GeneratedColumn<int> occupati3006Maschi = GeneratedColumn<int>(
    'occupati3006_maschi',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _occupati3006FemmineMeta =
      const VerificationMeta('occupati3006Femmine');
  @override
  late final GeneratedColumn<int> occupati3006Femmine = GeneratedColumn<int>(
    'occupati3006_femmine',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _occupati3112MaschiMeta =
      const VerificationMeta('occupati3112Maschi');
  @override
  late final GeneratedColumn<int> occupati3112Maschi = GeneratedColumn<int>(
    'occupati3112_maschi',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _occupati3112FemmineMeta =
      const VerificationMeta('occupati3112Femmine');
  @override
  late final GeneratedColumn<int> occupati3112Femmine = GeneratedColumn<int>(
    'occupati3112_femmine',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ragioneSociale,
    partitaIvaCf,
    codiceFiscaleSocieta,
    indirizzoSedeLegale,
    denominazioneUnitaProduttiva,
    indirizzoUnitaProduttiva,
    codiceAteco,
    occupati3006Maschi,
    occupati3006Femmine,
    occupati3112Maschi,
    occupati3112Femmine,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'aziende';
  @override
  VerificationContext validateIntegrity(
    Insertable<Azienda> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ragione_sociale')) {
      context.handle(
        _ragioneSocialeMeta,
        ragioneSociale.isAcceptableOrUnknown(
          data['ragione_sociale']!,
          _ragioneSocialeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ragioneSocialeMeta);
    }
    if (data.containsKey('partita_iva_cf')) {
      context.handle(
        _partitaIvaCfMeta,
        partitaIvaCf.isAcceptableOrUnknown(
          data['partita_iva_cf']!,
          _partitaIvaCfMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_partitaIvaCfMeta);
    }
    if (data.containsKey('codice_fiscale_societa')) {
      context.handle(
        _codiceFiscaleSocietaMeta,
        codiceFiscaleSocieta.isAcceptableOrUnknown(
          data['codice_fiscale_societa']!,
          _codiceFiscaleSocietaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_codiceFiscaleSocietaMeta);
    }
    if (data.containsKey('indirizzo_sede_legale')) {
      context.handle(
        _indirizzoSedeLegaleMeta,
        indirizzoSedeLegale.isAcceptableOrUnknown(
          data['indirizzo_sede_legale']!,
          _indirizzoSedeLegaleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_indirizzoSedeLegaleMeta);
    }
    if (data.containsKey('denominazione_unita_produttiva')) {
      context.handle(
        _denominazioneUnitaProduttivaMeta,
        denominazioneUnitaProduttiva.isAcceptableOrUnknown(
          data['denominazione_unita_produttiva']!,
          _denominazioneUnitaProduttivaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_denominazioneUnitaProduttivaMeta);
    }
    if (data.containsKey('indirizzo_unita_produttiva')) {
      context.handle(
        _indirizzoUnitaProduttivaMeta,
        indirizzoUnitaProduttiva.isAcceptableOrUnknown(
          data['indirizzo_unita_produttiva']!,
          _indirizzoUnitaProduttivaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_indirizzoUnitaProduttivaMeta);
    }
    if (data.containsKey('codice_ateco')) {
      context.handle(
        _codiceAtecoMeta,
        codiceAteco.isAcceptableOrUnknown(
          data['codice_ateco']!,
          _codiceAtecoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_codiceAtecoMeta);
    }
    if (data.containsKey('occupati3006_maschi')) {
      context.handle(
        _occupati3006MaschiMeta,
        occupati3006Maschi.isAcceptableOrUnknown(
          data['occupati3006_maschi']!,
          _occupati3006MaschiMeta,
        ),
      );
    }
    if (data.containsKey('occupati3006_femmine')) {
      context.handle(
        _occupati3006FemmineMeta,
        occupati3006Femmine.isAcceptableOrUnknown(
          data['occupati3006_femmine']!,
          _occupati3006FemmineMeta,
        ),
      );
    }
    if (data.containsKey('occupati3112_maschi')) {
      context.handle(
        _occupati3112MaschiMeta,
        occupati3112Maschi.isAcceptableOrUnknown(
          data['occupati3112_maschi']!,
          _occupati3112MaschiMeta,
        ),
      );
    }
    if (data.containsKey('occupati3112_femmine')) {
      context.handle(
        _occupati3112FemmineMeta,
        occupati3112Femmine.isAcceptableOrUnknown(
          data['occupati3112_femmine']!,
          _occupati3112FemmineMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Azienda map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Azienda(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ragioneSociale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ragione_sociale'],
      )!,
      partitaIvaCf: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}partita_iva_cf'],
      )!,
      codiceFiscaleSocieta: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codice_fiscale_societa'],
      )!,
      indirizzoSedeLegale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}indirizzo_sede_legale'],
      )!,
      denominazioneUnitaProduttiva: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}denominazione_unita_produttiva'],
      )!,
      indirizzoUnitaProduttiva: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}indirizzo_unita_produttiva'],
      )!,
      codiceAteco: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codice_ateco'],
      )!,
      occupati3006Maschi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occupati3006_maschi'],
      )!,
      occupati3006Femmine: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occupati3006_femmine'],
      )!,
      occupati3112Maschi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occupati3112_maschi'],
      )!,
      occupati3112Femmine: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occupati3112_femmine'],
      )!,
    );
  }

  @override
  $AziendeTable createAlias(String alias) {
    return $AziendeTable(attachedDatabase, alias);
  }
}

class Azienda extends DataClass implements Insertable<Azienda> {
  final int id;
  final String ragioneSociale;
  final String partitaIvaCf;
  final String codiceFiscaleSocieta;
  final String indirizzoSedeLegale;
  final String denominazioneUnitaProduttiva;
  final String indirizzoUnitaProduttiva;
  final String codiceAteco;
  final int occupati3006Maschi;
  final int occupati3006Femmine;
  final int occupati3112Maschi;
  final int occupati3112Femmine;
  const Azienda({
    required this.id,
    required this.ragioneSociale,
    required this.partitaIvaCf,
    required this.codiceFiscaleSocieta,
    required this.indirizzoSedeLegale,
    required this.denominazioneUnitaProduttiva,
    required this.indirizzoUnitaProduttiva,
    required this.codiceAteco,
    required this.occupati3006Maschi,
    required this.occupati3006Femmine,
    required this.occupati3112Maschi,
    required this.occupati3112Femmine,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ragione_sociale'] = Variable<String>(ragioneSociale);
    map['partita_iva_cf'] = Variable<String>(partitaIvaCf);
    map['codice_fiscale_societa'] = Variable<String>(codiceFiscaleSocieta);
    map['indirizzo_sede_legale'] = Variable<String>(indirizzoSedeLegale);
    map['denominazione_unita_produttiva'] = Variable<String>(
      denominazioneUnitaProduttiva,
    );
    map['indirizzo_unita_produttiva'] = Variable<String>(
      indirizzoUnitaProduttiva,
    );
    map['codice_ateco'] = Variable<String>(codiceAteco);
    map['occupati3006_maschi'] = Variable<int>(occupati3006Maschi);
    map['occupati3006_femmine'] = Variable<int>(occupati3006Femmine);
    map['occupati3112_maschi'] = Variable<int>(occupati3112Maschi);
    map['occupati3112_femmine'] = Variable<int>(occupati3112Femmine);
    return map;
  }

  AziendeCompanion toCompanion(bool nullToAbsent) {
    return AziendeCompanion(
      id: Value(id),
      ragioneSociale: Value(ragioneSociale),
      partitaIvaCf: Value(partitaIvaCf),
      codiceFiscaleSocieta: Value(codiceFiscaleSocieta),
      indirizzoSedeLegale: Value(indirizzoSedeLegale),
      denominazioneUnitaProduttiva: Value(denominazioneUnitaProduttiva),
      indirizzoUnitaProduttiva: Value(indirizzoUnitaProduttiva),
      codiceAteco: Value(codiceAteco),
      occupati3006Maschi: Value(occupati3006Maschi),
      occupati3006Femmine: Value(occupati3006Femmine),
      occupati3112Maschi: Value(occupati3112Maschi),
      occupati3112Femmine: Value(occupati3112Femmine),
    );
  }

  factory Azienda.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Azienda(
      id: serializer.fromJson<int>(json['id']),
      ragioneSociale: serializer.fromJson<String>(json['ragioneSociale']),
      partitaIvaCf: serializer.fromJson<String>(json['partitaIvaCf']),
      codiceFiscaleSocieta: serializer.fromJson<String>(
        json['codiceFiscaleSocieta'],
      ),
      indirizzoSedeLegale: serializer.fromJson<String>(
        json['indirizzoSedeLegale'],
      ),
      denominazioneUnitaProduttiva: serializer.fromJson<String>(
        json['denominazioneUnitaProduttiva'],
      ),
      indirizzoUnitaProduttiva: serializer.fromJson<String>(
        json['indirizzoUnitaProduttiva'],
      ),
      codiceAteco: serializer.fromJson<String>(json['codiceAteco']),
      occupati3006Maschi: serializer.fromJson<int>(json['occupati3006Maschi']),
      occupati3006Femmine: serializer.fromJson<int>(
        json['occupati3006Femmine'],
      ),
      occupati3112Maschi: serializer.fromJson<int>(json['occupati3112Maschi']),
      occupati3112Femmine: serializer.fromJson<int>(
        json['occupati3112Femmine'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ragioneSociale': serializer.toJson<String>(ragioneSociale),
      'partitaIvaCf': serializer.toJson<String>(partitaIvaCf),
      'codiceFiscaleSocieta': serializer.toJson<String>(codiceFiscaleSocieta),
      'indirizzoSedeLegale': serializer.toJson<String>(indirizzoSedeLegale),
      'denominazioneUnitaProduttiva': serializer.toJson<String>(
        denominazioneUnitaProduttiva,
      ),
      'indirizzoUnitaProduttiva': serializer.toJson<String>(
        indirizzoUnitaProduttiva,
      ),
      'codiceAteco': serializer.toJson<String>(codiceAteco),
      'occupati3006Maschi': serializer.toJson<int>(occupati3006Maschi),
      'occupati3006Femmine': serializer.toJson<int>(occupati3006Femmine),
      'occupati3112Maschi': serializer.toJson<int>(occupati3112Maschi),
      'occupati3112Femmine': serializer.toJson<int>(occupati3112Femmine),
    };
  }

  Azienda copyWith({
    int? id,
    String? ragioneSociale,
    String? partitaIvaCf,
    String? codiceFiscaleSocieta,
    String? indirizzoSedeLegale,
    String? denominazioneUnitaProduttiva,
    String? indirizzoUnitaProduttiva,
    String? codiceAteco,
    int? occupati3006Maschi,
    int? occupati3006Femmine,
    int? occupati3112Maschi,
    int? occupati3112Femmine,
  }) => Azienda(
    id: id ?? this.id,
    ragioneSociale: ragioneSociale ?? this.ragioneSociale,
    partitaIvaCf: partitaIvaCf ?? this.partitaIvaCf,
    codiceFiscaleSocieta: codiceFiscaleSocieta ?? this.codiceFiscaleSocieta,
    indirizzoSedeLegale: indirizzoSedeLegale ?? this.indirizzoSedeLegale,
    denominazioneUnitaProduttiva:
        denominazioneUnitaProduttiva ?? this.denominazioneUnitaProduttiva,
    indirizzoUnitaProduttiva:
        indirizzoUnitaProduttiva ?? this.indirizzoUnitaProduttiva,
    codiceAteco: codiceAteco ?? this.codiceAteco,
    occupati3006Maschi: occupati3006Maschi ?? this.occupati3006Maschi,
    occupati3006Femmine: occupati3006Femmine ?? this.occupati3006Femmine,
    occupati3112Maschi: occupati3112Maschi ?? this.occupati3112Maschi,
    occupati3112Femmine: occupati3112Femmine ?? this.occupati3112Femmine,
  );
  Azienda copyWithCompanion(AziendeCompanion data) {
    return Azienda(
      id: data.id.present ? data.id.value : this.id,
      ragioneSociale: data.ragioneSociale.present
          ? data.ragioneSociale.value
          : this.ragioneSociale,
      partitaIvaCf: data.partitaIvaCf.present
          ? data.partitaIvaCf.value
          : this.partitaIvaCf,
      codiceFiscaleSocieta: data.codiceFiscaleSocieta.present
          ? data.codiceFiscaleSocieta.value
          : this.codiceFiscaleSocieta,
      indirizzoSedeLegale: data.indirizzoSedeLegale.present
          ? data.indirizzoSedeLegale.value
          : this.indirizzoSedeLegale,
      denominazioneUnitaProduttiva: data.denominazioneUnitaProduttiva.present
          ? data.denominazioneUnitaProduttiva.value
          : this.denominazioneUnitaProduttiva,
      indirizzoUnitaProduttiva: data.indirizzoUnitaProduttiva.present
          ? data.indirizzoUnitaProduttiva.value
          : this.indirizzoUnitaProduttiva,
      codiceAteco: data.codiceAteco.present
          ? data.codiceAteco.value
          : this.codiceAteco,
      occupati3006Maschi: data.occupati3006Maschi.present
          ? data.occupati3006Maschi.value
          : this.occupati3006Maschi,
      occupati3006Femmine: data.occupati3006Femmine.present
          ? data.occupati3006Femmine.value
          : this.occupati3006Femmine,
      occupati3112Maschi: data.occupati3112Maschi.present
          ? data.occupati3112Maschi.value
          : this.occupati3112Maschi,
      occupati3112Femmine: data.occupati3112Femmine.present
          ? data.occupati3112Femmine.value
          : this.occupati3112Femmine,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Azienda(')
          ..write('id: $id, ')
          ..write('ragioneSociale: $ragioneSociale, ')
          ..write('partitaIvaCf: $partitaIvaCf, ')
          ..write('codiceFiscaleSocieta: $codiceFiscaleSocieta, ')
          ..write('indirizzoSedeLegale: $indirizzoSedeLegale, ')
          ..write(
            'denominazioneUnitaProduttiva: $denominazioneUnitaProduttiva, ',
          )
          ..write('indirizzoUnitaProduttiva: $indirizzoUnitaProduttiva, ')
          ..write('codiceAteco: $codiceAteco, ')
          ..write('occupati3006Maschi: $occupati3006Maschi, ')
          ..write('occupati3006Femmine: $occupati3006Femmine, ')
          ..write('occupati3112Maschi: $occupati3112Maschi, ')
          ..write('occupati3112Femmine: $occupati3112Femmine')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ragioneSociale,
    partitaIvaCf,
    codiceFiscaleSocieta,
    indirizzoSedeLegale,
    denominazioneUnitaProduttiva,
    indirizzoUnitaProduttiva,
    codiceAteco,
    occupati3006Maschi,
    occupati3006Femmine,
    occupati3112Maschi,
    occupati3112Femmine,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Azienda &&
          other.id == this.id &&
          other.ragioneSociale == this.ragioneSociale &&
          other.partitaIvaCf == this.partitaIvaCf &&
          other.codiceFiscaleSocieta == this.codiceFiscaleSocieta &&
          other.indirizzoSedeLegale == this.indirizzoSedeLegale &&
          other.denominazioneUnitaProduttiva ==
              this.denominazioneUnitaProduttiva &&
          other.indirizzoUnitaProduttiva == this.indirizzoUnitaProduttiva &&
          other.codiceAteco == this.codiceAteco &&
          other.occupati3006Maschi == this.occupati3006Maschi &&
          other.occupati3006Femmine == this.occupati3006Femmine &&
          other.occupati3112Maschi == this.occupati3112Maschi &&
          other.occupati3112Femmine == this.occupati3112Femmine);
}

class AziendeCompanion extends UpdateCompanion<Azienda> {
  final Value<int> id;
  final Value<String> ragioneSociale;
  final Value<String> partitaIvaCf;
  final Value<String> codiceFiscaleSocieta;
  final Value<String> indirizzoSedeLegale;
  final Value<String> denominazioneUnitaProduttiva;
  final Value<String> indirizzoUnitaProduttiva;
  final Value<String> codiceAteco;
  final Value<int> occupati3006Maschi;
  final Value<int> occupati3006Femmine;
  final Value<int> occupati3112Maschi;
  final Value<int> occupati3112Femmine;
  const AziendeCompanion({
    this.id = const Value.absent(),
    this.ragioneSociale = const Value.absent(),
    this.partitaIvaCf = const Value.absent(),
    this.codiceFiscaleSocieta = const Value.absent(),
    this.indirizzoSedeLegale = const Value.absent(),
    this.denominazioneUnitaProduttiva = const Value.absent(),
    this.indirizzoUnitaProduttiva = const Value.absent(),
    this.codiceAteco = const Value.absent(),
    this.occupati3006Maschi = const Value.absent(),
    this.occupati3006Femmine = const Value.absent(),
    this.occupati3112Maschi = const Value.absent(),
    this.occupati3112Femmine = const Value.absent(),
  });
  AziendeCompanion.insert({
    this.id = const Value.absent(),
    required String ragioneSociale,
    required String partitaIvaCf,
    required String codiceFiscaleSocieta,
    required String indirizzoSedeLegale,
    required String denominazioneUnitaProduttiva,
    required String indirizzoUnitaProduttiva,
    required String codiceAteco,
    this.occupati3006Maschi = const Value.absent(),
    this.occupati3006Femmine = const Value.absent(),
    this.occupati3112Maschi = const Value.absent(),
    this.occupati3112Femmine = const Value.absent(),
  }) : ragioneSociale = Value(ragioneSociale),
       partitaIvaCf = Value(partitaIvaCf),
       codiceFiscaleSocieta = Value(codiceFiscaleSocieta),
       indirizzoSedeLegale = Value(indirizzoSedeLegale),
       denominazioneUnitaProduttiva = Value(denominazioneUnitaProduttiva),
       indirizzoUnitaProduttiva = Value(indirizzoUnitaProduttiva),
       codiceAteco = Value(codiceAteco);
  static Insertable<Azienda> custom({
    Expression<int>? id,
    Expression<String>? ragioneSociale,
    Expression<String>? partitaIvaCf,
    Expression<String>? codiceFiscaleSocieta,
    Expression<String>? indirizzoSedeLegale,
    Expression<String>? denominazioneUnitaProduttiva,
    Expression<String>? indirizzoUnitaProduttiva,
    Expression<String>? codiceAteco,
    Expression<int>? occupati3006Maschi,
    Expression<int>? occupati3006Femmine,
    Expression<int>? occupati3112Maschi,
    Expression<int>? occupati3112Femmine,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ragioneSociale != null) 'ragione_sociale': ragioneSociale,
      if (partitaIvaCf != null) 'partita_iva_cf': partitaIvaCf,
      if (codiceFiscaleSocieta != null)
        'codice_fiscale_societa': codiceFiscaleSocieta,
      if (indirizzoSedeLegale != null)
        'indirizzo_sede_legale': indirizzoSedeLegale,
      if (denominazioneUnitaProduttiva != null)
        'denominazione_unita_produttiva': denominazioneUnitaProduttiva,
      if (indirizzoUnitaProduttiva != null)
        'indirizzo_unita_produttiva': indirizzoUnitaProduttiva,
      if (codiceAteco != null) 'codice_ateco': codiceAteco,
      if (occupati3006Maschi != null) 'occupati3006_maschi': occupati3006Maschi,
      if (occupati3006Femmine != null)
        'occupati3006_femmine': occupati3006Femmine,
      if (occupati3112Maschi != null) 'occupati3112_maschi': occupati3112Maschi,
      if (occupati3112Femmine != null)
        'occupati3112_femmine': occupati3112Femmine,
    });
  }

  AziendeCompanion copyWith({
    Value<int>? id,
    Value<String>? ragioneSociale,
    Value<String>? partitaIvaCf,
    Value<String>? codiceFiscaleSocieta,
    Value<String>? indirizzoSedeLegale,
    Value<String>? denominazioneUnitaProduttiva,
    Value<String>? indirizzoUnitaProduttiva,
    Value<String>? codiceAteco,
    Value<int>? occupati3006Maschi,
    Value<int>? occupati3006Femmine,
    Value<int>? occupati3112Maschi,
    Value<int>? occupati3112Femmine,
  }) {
    return AziendeCompanion(
      id: id ?? this.id,
      ragioneSociale: ragioneSociale ?? this.ragioneSociale,
      partitaIvaCf: partitaIvaCf ?? this.partitaIvaCf,
      codiceFiscaleSocieta: codiceFiscaleSocieta ?? this.codiceFiscaleSocieta,
      indirizzoSedeLegale: indirizzoSedeLegale ?? this.indirizzoSedeLegale,
      denominazioneUnitaProduttiva:
          denominazioneUnitaProduttiva ?? this.denominazioneUnitaProduttiva,
      indirizzoUnitaProduttiva:
          indirizzoUnitaProduttiva ?? this.indirizzoUnitaProduttiva,
      codiceAteco: codiceAteco ?? this.codiceAteco,
      occupati3006Maschi: occupati3006Maschi ?? this.occupati3006Maschi,
      occupati3006Femmine: occupati3006Femmine ?? this.occupati3006Femmine,
      occupati3112Maschi: occupati3112Maschi ?? this.occupati3112Maschi,
      occupati3112Femmine: occupati3112Femmine ?? this.occupati3112Femmine,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ragioneSociale.present) {
      map['ragione_sociale'] = Variable<String>(ragioneSociale.value);
    }
    if (partitaIvaCf.present) {
      map['partita_iva_cf'] = Variable<String>(partitaIvaCf.value);
    }
    if (codiceFiscaleSocieta.present) {
      map['codice_fiscale_societa'] = Variable<String>(
        codiceFiscaleSocieta.value,
      );
    }
    if (indirizzoSedeLegale.present) {
      map['indirizzo_sede_legale'] = Variable<String>(
        indirizzoSedeLegale.value,
      );
    }
    if (denominazioneUnitaProduttiva.present) {
      map['denominazione_unita_produttiva'] = Variable<String>(
        denominazioneUnitaProduttiva.value,
      );
    }
    if (indirizzoUnitaProduttiva.present) {
      map['indirizzo_unita_produttiva'] = Variable<String>(
        indirizzoUnitaProduttiva.value,
      );
    }
    if (codiceAteco.present) {
      map['codice_ateco'] = Variable<String>(codiceAteco.value);
    }
    if (occupati3006Maschi.present) {
      map['occupati3006_maschi'] = Variable<int>(occupati3006Maschi.value);
    }
    if (occupati3006Femmine.present) {
      map['occupati3006_femmine'] = Variable<int>(occupati3006Femmine.value);
    }
    if (occupati3112Maschi.present) {
      map['occupati3112_maschi'] = Variable<int>(occupati3112Maschi.value);
    }
    if (occupati3112Femmine.present) {
      map['occupati3112_femmine'] = Variable<int>(occupati3112Femmine.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AziendeCompanion(')
          ..write('id: $id, ')
          ..write('ragioneSociale: $ragioneSociale, ')
          ..write('partitaIvaCf: $partitaIvaCf, ')
          ..write('codiceFiscaleSocieta: $codiceFiscaleSocieta, ')
          ..write('indirizzoSedeLegale: $indirizzoSedeLegale, ')
          ..write(
            'denominazioneUnitaProduttiva: $denominazioneUnitaProduttiva, ',
          )
          ..write('indirizzoUnitaProduttiva: $indirizzoUnitaProduttiva, ')
          ..write('codiceAteco: $codiceAteco, ')
          ..write('occupati3006Maschi: $occupati3006Maschi, ')
          ..write('occupati3006Femmine: $occupati3006Femmine, ')
          ..write('occupati3112Maschi: $occupati3112Maschi, ')
          ..write('occupati3112Femmine: $occupati3112Femmine')
          ..write(')'))
        .toString();
  }
}

class $LavoratoriTable extends Lavoratori
    with TableInfo<$LavoratoriTable, Lavoratore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LavoratoriTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _aziendaIdMeta = const VerificationMeta(
    'aziendaId',
  );
  @override
  late final GeneratedColumn<int> aziendaId = GeneratedColumn<int>(
    'azienda_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES aziende (id)',
    ),
  );
  static const VerificationMeta _cognomeMeta = const VerificationMeta(
    'cognome',
  );
  @override
  late final GeneratedColumn<String> cognome = GeneratedColumn<String>(
    'cognome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessoMeta = const VerificationMeta('sesso');
  @override
  late final GeneratedColumn<String> sesso = GeneratedColumn<String>(
    'sesso',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 1,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _luogoNascitaMeta = const VerificationMeta(
    'luogoNascita',
  );
  @override
  late final GeneratedColumn<String> luogoNascita = GeneratedColumn<String>(
    'luogo_nascita',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataNascitaMeta = const VerificationMeta(
    'dataNascita',
  );
  @override
  late final GeneratedColumn<DateTime> dataNascita = GeneratedColumn<DateTime>(
    'data_nascita',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _domicilioComuneMeta = const VerificationMeta(
    'domicilioComune',
  );
  @override
  late final GeneratedColumn<String> domicilioComune = GeneratedColumn<String>(
    'domicilio_comune',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _domicilioProvinciaMeta =
      const VerificationMeta('domicilioProvincia');
  @override
  late final GeneratedColumn<String> domicilioProvincia =
      GeneratedColumn<String>(
        'domicilio_provincia',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _domicilioIndirizzoMeta =
      const VerificationMeta('domicilioIndirizzo');
  @override
  late final GeneratedColumn<String> domicilioIndirizzo =
      GeneratedColumn<String>(
        'domicilio_indirizzo',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _domicilioTelefonoMeta = const VerificationMeta(
    'domicilioTelefono',
  );
  @override
  late final GeneratedColumn<String> domicilioTelefono =
      GeneratedColumn<String>(
        'domicilio_telefono',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _nazionalitaMeta = const VerificationMeta(
    'nazionalita',
  );
  @override
  late final GeneratedColumn<String> nazionalita = GeneratedColumn<String>(
    'nazionalita',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codiceFiscaleMeta = const VerificationMeta(
    'codiceFiscale',
  );
  @override
  late final GeneratedColumn<String> codiceFiscale = GeneratedColumn<String>(
    'codice_fiscale',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 16,
      maxTextLength: 16,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    aziendaId,
    cognome,
    nome,
    sesso,
    luogoNascita,
    dataNascita,
    domicilioComune,
    domicilioProvincia,
    domicilioIndirizzo,
    domicilioTelefono,
    nazionalita,
    codiceFiscale,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lavoratori';
  @override
  VerificationContext validateIntegrity(
    Insertable<Lavoratore> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('azienda_id')) {
      context.handle(
        _aziendaIdMeta,
        aziendaId.isAcceptableOrUnknown(data['azienda_id']!, _aziendaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_aziendaIdMeta);
    }
    if (data.containsKey('cognome')) {
      context.handle(
        _cognomeMeta,
        cognome.isAcceptableOrUnknown(data['cognome']!, _cognomeMeta),
      );
    } else if (isInserting) {
      context.missing(_cognomeMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('sesso')) {
      context.handle(
        _sessoMeta,
        sesso.isAcceptableOrUnknown(data['sesso']!, _sessoMeta),
      );
    } else if (isInserting) {
      context.missing(_sessoMeta);
    }
    if (data.containsKey('luogo_nascita')) {
      context.handle(
        _luogoNascitaMeta,
        luogoNascita.isAcceptableOrUnknown(
          data['luogo_nascita']!,
          _luogoNascitaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_luogoNascitaMeta);
    }
    if (data.containsKey('data_nascita')) {
      context.handle(
        _dataNascitaMeta,
        dataNascita.isAcceptableOrUnknown(
          data['data_nascita']!,
          _dataNascitaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dataNascitaMeta);
    }
    if (data.containsKey('domicilio_comune')) {
      context.handle(
        _domicilioComuneMeta,
        domicilioComune.isAcceptableOrUnknown(
          data['domicilio_comune']!,
          _domicilioComuneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_domicilioComuneMeta);
    }
    if (data.containsKey('domicilio_provincia')) {
      context.handle(
        _domicilioProvinciaMeta,
        domicilioProvincia.isAcceptableOrUnknown(
          data['domicilio_provincia']!,
          _domicilioProvinciaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_domicilioProvinciaMeta);
    }
    if (data.containsKey('domicilio_indirizzo')) {
      context.handle(
        _domicilioIndirizzoMeta,
        domicilioIndirizzo.isAcceptableOrUnknown(
          data['domicilio_indirizzo']!,
          _domicilioIndirizzoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_domicilioIndirizzoMeta);
    }
    if (data.containsKey('domicilio_telefono')) {
      context.handle(
        _domicilioTelefonoMeta,
        domicilioTelefono.isAcceptableOrUnknown(
          data['domicilio_telefono']!,
          _domicilioTelefonoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_domicilioTelefonoMeta);
    }
    if (data.containsKey('nazionalita')) {
      context.handle(
        _nazionalitaMeta,
        nazionalita.isAcceptableOrUnknown(
          data['nazionalita']!,
          _nazionalitaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nazionalitaMeta);
    }
    if (data.containsKey('codice_fiscale')) {
      context.handle(
        _codiceFiscaleMeta,
        codiceFiscale.isAcceptableOrUnknown(
          data['codice_fiscale']!,
          _codiceFiscaleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_codiceFiscaleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lavoratore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Lavoratore(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      aziendaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}azienda_id'],
      )!,
      cognome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cognome'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      sesso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sesso'],
      )!,
      luogoNascita: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}luogo_nascita'],
      )!,
      dataNascita: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_nascita'],
      )!,
      domicilioComune: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}domicilio_comune'],
      )!,
      domicilioProvincia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}domicilio_provincia'],
      )!,
      domicilioIndirizzo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}domicilio_indirizzo'],
      )!,
      domicilioTelefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}domicilio_telefono'],
      )!,
      nazionalita: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nazionalita'],
      )!,
      codiceFiscale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codice_fiscale'],
      )!,
    );
  }

  @override
  $LavoratoriTable createAlias(String alias) {
    return $LavoratoriTable(attachedDatabase, alias);
  }
}

class Lavoratore extends DataClass implements Insertable<Lavoratore> {
  final int id;
  final int aziendaId;
  final String cognome;
  final String nome;
  final String sesso;
  final String luogoNascita;
  final DateTime dataNascita;
  final String domicilioComune;
  final String domicilioProvincia;
  final String domicilioIndirizzo;
  final String domicilioTelefono;
  final String nazionalita;
  final String codiceFiscale;
  const Lavoratore({
    required this.id,
    required this.aziendaId,
    required this.cognome,
    required this.nome,
    required this.sesso,
    required this.luogoNascita,
    required this.dataNascita,
    required this.domicilioComune,
    required this.domicilioProvincia,
    required this.domicilioIndirizzo,
    required this.domicilioTelefono,
    required this.nazionalita,
    required this.codiceFiscale,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['azienda_id'] = Variable<int>(aziendaId);
    map['cognome'] = Variable<String>(cognome);
    map['nome'] = Variable<String>(nome);
    map['sesso'] = Variable<String>(sesso);
    map['luogo_nascita'] = Variable<String>(luogoNascita);
    map['data_nascita'] = Variable<DateTime>(dataNascita);
    map['domicilio_comune'] = Variable<String>(domicilioComune);
    map['domicilio_provincia'] = Variable<String>(domicilioProvincia);
    map['domicilio_indirizzo'] = Variable<String>(domicilioIndirizzo);
    map['domicilio_telefono'] = Variable<String>(domicilioTelefono);
    map['nazionalita'] = Variable<String>(nazionalita);
    map['codice_fiscale'] = Variable<String>(codiceFiscale);
    return map;
  }

  LavoratoriCompanion toCompanion(bool nullToAbsent) {
    return LavoratoriCompanion(
      id: Value(id),
      aziendaId: Value(aziendaId),
      cognome: Value(cognome),
      nome: Value(nome),
      sesso: Value(sesso),
      luogoNascita: Value(luogoNascita),
      dataNascita: Value(dataNascita),
      domicilioComune: Value(domicilioComune),
      domicilioProvincia: Value(domicilioProvincia),
      domicilioIndirizzo: Value(domicilioIndirizzo),
      domicilioTelefono: Value(domicilioTelefono),
      nazionalita: Value(nazionalita),
      codiceFiscale: Value(codiceFiscale),
    );
  }

  factory Lavoratore.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Lavoratore(
      id: serializer.fromJson<int>(json['id']),
      aziendaId: serializer.fromJson<int>(json['aziendaId']),
      cognome: serializer.fromJson<String>(json['cognome']),
      nome: serializer.fromJson<String>(json['nome']),
      sesso: serializer.fromJson<String>(json['sesso']),
      luogoNascita: serializer.fromJson<String>(json['luogoNascita']),
      dataNascita: serializer.fromJson<DateTime>(json['dataNascita']),
      domicilioComune: serializer.fromJson<String>(json['domicilioComune']),
      domicilioProvincia: serializer.fromJson<String>(
        json['domicilioProvincia'],
      ),
      domicilioIndirizzo: serializer.fromJson<String>(
        json['domicilioIndirizzo'],
      ),
      domicilioTelefono: serializer.fromJson<String>(json['domicilioTelefono']),
      nazionalita: serializer.fromJson<String>(json['nazionalita']),
      codiceFiscale: serializer.fromJson<String>(json['codiceFiscale']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'aziendaId': serializer.toJson<int>(aziendaId),
      'cognome': serializer.toJson<String>(cognome),
      'nome': serializer.toJson<String>(nome),
      'sesso': serializer.toJson<String>(sesso),
      'luogoNascita': serializer.toJson<String>(luogoNascita),
      'dataNascita': serializer.toJson<DateTime>(dataNascita),
      'domicilioComune': serializer.toJson<String>(domicilioComune),
      'domicilioProvincia': serializer.toJson<String>(domicilioProvincia),
      'domicilioIndirizzo': serializer.toJson<String>(domicilioIndirizzo),
      'domicilioTelefono': serializer.toJson<String>(domicilioTelefono),
      'nazionalita': serializer.toJson<String>(nazionalita),
      'codiceFiscale': serializer.toJson<String>(codiceFiscale),
    };
  }

  Lavoratore copyWith({
    int? id,
    int? aziendaId,
    String? cognome,
    String? nome,
    String? sesso,
    String? luogoNascita,
    DateTime? dataNascita,
    String? domicilioComune,
    String? domicilioProvincia,
    String? domicilioIndirizzo,
    String? domicilioTelefono,
    String? nazionalita,
    String? codiceFiscale,
  }) => Lavoratore(
    id: id ?? this.id,
    aziendaId: aziendaId ?? this.aziendaId,
    cognome: cognome ?? this.cognome,
    nome: nome ?? this.nome,
    sesso: sesso ?? this.sesso,
    luogoNascita: luogoNascita ?? this.luogoNascita,
    dataNascita: dataNascita ?? this.dataNascita,
    domicilioComune: domicilioComune ?? this.domicilioComune,
    domicilioProvincia: domicilioProvincia ?? this.domicilioProvincia,
    domicilioIndirizzo: domicilioIndirizzo ?? this.domicilioIndirizzo,
    domicilioTelefono: domicilioTelefono ?? this.domicilioTelefono,
    nazionalita: nazionalita ?? this.nazionalita,
    codiceFiscale: codiceFiscale ?? this.codiceFiscale,
  );
  Lavoratore copyWithCompanion(LavoratoriCompanion data) {
    return Lavoratore(
      id: data.id.present ? data.id.value : this.id,
      aziendaId: data.aziendaId.present ? data.aziendaId.value : this.aziendaId,
      cognome: data.cognome.present ? data.cognome.value : this.cognome,
      nome: data.nome.present ? data.nome.value : this.nome,
      sesso: data.sesso.present ? data.sesso.value : this.sesso,
      luogoNascita: data.luogoNascita.present
          ? data.luogoNascita.value
          : this.luogoNascita,
      dataNascita: data.dataNascita.present
          ? data.dataNascita.value
          : this.dataNascita,
      domicilioComune: data.domicilioComune.present
          ? data.domicilioComune.value
          : this.domicilioComune,
      domicilioProvincia: data.domicilioProvincia.present
          ? data.domicilioProvincia.value
          : this.domicilioProvincia,
      domicilioIndirizzo: data.domicilioIndirizzo.present
          ? data.domicilioIndirizzo.value
          : this.domicilioIndirizzo,
      domicilioTelefono: data.domicilioTelefono.present
          ? data.domicilioTelefono.value
          : this.domicilioTelefono,
      nazionalita: data.nazionalita.present
          ? data.nazionalita.value
          : this.nazionalita,
      codiceFiscale: data.codiceFiscale.present
          ? data.codiceFiscale.value
          : this.codiceFiscale,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Lavoratore(')
          ..write('id: $id, ')
          ..write('aziendaId: $aziendaId, ')
          ..write('cognome: $cognome, ')
          ..write('nome: $nome, ')
          ..write('sesso: $sesso, ')
          ..write('luogoNascita: $luogoNascita, ')
          ..write('dataNascita: $dataNascita, ')
          ..write('domicilioComune: $domicilioComune, ')
          ..write('domicilioProvincia: $domicilioProvincia, ')
          ..write('domicilioIndirizzo: $domicilioIndirizzo, ')
          ..write('domicilioTelefono: $domicilioTelefono, ')
          ..write('nazionalita: $nazionalita, ')
          ..write('codiceFiscale: $codiceFiscale')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    aziendaId,
    cognome,
    nome,
    sesso,
    luogoNascita,
    dataNascita,
    domicilioComune,
    domicilioProvincia,
    domicilioIndirizzo,
    domicilioTelefono,
    nazionalita,
    codiceFiscale,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lavoratore &&
          other.id == this.id &&
          other.aziendaId == this.aziendaId &&
          other.cognome == this.cognome &&
          other.nome == this.nome &&
          other.sesso == this.sesso &&
          other.luogoNascita == this.luogoNascita &&
          other.dataNascita == this.dataNascita &&
          other.domicilioComune == this.domicilioComune &&
          other.domicilioProvincia == this.domicilioProvincia &&
          other.domicilioIndirizzo == this.domicilioIndirizzo &&
          other.domicilioTelefono == this.domicilioTelefono &&
          other.nazionalita == this.nazionalita &&
          other.codiceFiscale == this.codiceFiscale);
}

class LavoratoriCompanion extends UpdateCompanion<Lavoratore> {
  final Value<int> id;
  final Value<int> aziendaId;
  final Value<String> cognome;
  final Value<String> nome;
  final Value<String> sesso;
  final Value<String> luogoNascita;
  final Value<DateTime> dataNascita;
  final Value<String> domicilioComune;
  final Value<String> domicilioProvincia;
  final Value<String> domicilioIndirizzo;
  final Value<String> domicilioTelefono;
  final Value<String> nazionalita;
  final Value<String> codiceFiscale;
  const LavoratoriCompanion({
    this.id = const Value.absent(),
    this.aziendaId = const Value.absent(),
    this.cognome = const Value.absent(),
    this.nome = const Value.absent(),
    this.sesso = const Value.absent(),
    this.luogoNascita = const Value.absent(),
    this.dataNascita = const Value.absent(),
    this.domicilioComune = const Value.absent(),
    this.domicilioProvincia = const Value.absent(),
    this.domicilioIndirizzo = const Value.absent(),
    this.domicilioTelefono = const Value.absent(),
    this.nazionalita = const Value.absent(),
    this.codiceFiscale = const Value.absent(),
  });
  LavoratoriCompanion.insert({
    this.id = const Value.absent(),
    required int aziendaId,
    required String cognome,
    required String nome,
    required String sesso,
    required String luogoNascita,
    required DateTime dataNascita,
    required String domicilioComune,
    required String domicilioProvincia,
    required String domicilioIndirizzo,
    required String domicilioTelefono,
    required String nazionalita,
    required String codiceFiscale,
  }) : aziendaId = Value(aziendaId),
       cognome = Value(cognome),
       nome = Value(nome),
       sesso = Value(sesso),
       luogoNascita = Value(luogoNascita),
       dataNascita = Value(dataNascita),
       domicilioComune = Value(domicilioComune),
       domicilioProvincia = Value(domicilioProvincia),
       domicilioIndirizzo = Value(domicilioIndirizzo),
       domicilioTelefono = Value(domicilioTelefono),
       nazionalita = Value(nazionalita),
       codiceFiscale = Value(codiceFiscale);
  static Insertable<Lavoratore> custom({
    Expression<int>? id,
    Expression<int>? aziendaId,
    Expression<String>? cognome,
    Expression<String>? nome,
    Expression<String>? sesso,
    Expression<String>? luogoNascita,
    Expression<DateTime>? dataNascita,
    Expression<String>? domicilioComune,
    Expression<String>? domicilioProvincia,
    Expression<String>? domicilioIndirizzo,
    Expression<String>? domicilioTelefono,
    Expression<String>? nazionalita,
    Expression<String>? codiceFiscale,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (aziendaId != null) 'azienda_id': aziendaId,
      if (cognome != null) 'cognome': cognome,
      if (nome != null) 'nome': nome,
      if (sesso != null) 'sesso': sesso,
      if (luogoNascita != null) 'luogo_nascita': luogoNascita,
      if (dataNascita != null) 'data_nascita': dataNascita,
      if (domicilioComune != null) 'domicilio_comune': domicilioComune,
      if (domicilioProvincia != null) 'domicilio_provincia': domicilioProvincia,
      if (domicilioIndirizzo != null) 'domicilio_indirizzo': domicilioIndirizzo,
      if (domicilioTelefono != null) 'domicilio_telefono': domicilioTelefono,
      if (nazionalita != null) 'nazionalita': nazionalita,
      if (codiceFiscale != null) 'codice_fiscale': codiceFiscale,
    });
  }

  LavoratoriCompanion copyWith({
    Value<int>? id,
    Value<int>? aziendaId,
    Value<String>? cognome,
    Value<String>? nome,
    Value<String>? sesso,
    Value<String>? luogoNascita,
    Value<DateTime>? dataNascita,
    Value<String>? domicilioComune,
    Value<String>? domicilioProvincia,
    Value<String>? domicilioIndirizzo,
    Value<String>? domicilioTelefono,
    Value<String>? nazionalita,
    Value<String>? codiceFiscale,
  }) {
    return LavoratoriCompanion(
      id: id ?? this.id,
      aziendaId: aziendaId ?? this.aziendaId,
      cognome: cognome ?? this.cognome,
      nome: nome ?? this.nome,
      sesso: sesso ?? this.sesso,
      luogoNascita: luogoNascita ?? this.luogoNascita,
      dataNascita: dataNascita ?? this.dataNascita,
      domicilioComune: domicilioComune ?? this.domicilioComune,
      domicilioProvincia: domicilioProvincia ?? this.domicilioProvincia,
      domicilioIndirizzo: domicilioIndirizzo ?? this.domicilioIndirizzo,
      domicilioTelefono: domicilioTelefono ?? this.domicilioTelefono,
      nazionalita: nazionalita ?? this.nazionalita,
      codiceFiscale: codiceFiscale ?? this.codiceFiscale,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (aziendaId.present) {
      map['azienda_id'] = Variable<int>(aziendaId.value);
    }
    if (cognome.present) {
      map['cognome'] = Variable<String>(cognome.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (sesso.present) {
      map['sesso'] = Variable<String>(sesso.value);
    }
    if (luogoNascita.present) {
      map['luogo_nascita'] = Variable<String>(luogoNascita.value);
    }
    if (dataNascita.present) {
      map['data_nascita'] = Variable<DateTime>(dataNascita.value);
    }
    if (domicilioComune.present) {
      map['domicilio_comune'] = Variable<String>(domicilioComune.value);
    }
    if (domicilioProvincia.present) {
      map['domicilio_provincia'] = Variable<String>(domicilioProvincia.value);
    }
    if (domicilioIndirizzo.present) {
      map['domicilio_indirizzo'] = Variable<String>(domicilioIndirizzo.value);
    }
    if (domicilioTelefono.present) {
      map['domicilio_telefono'] = Variable<String>(domicilioTelefono.value);
    }
    if (nazionalita.present) {
      map['nazionalita'] = Variable<String>(nazionalita.value);
    }
    if (codiceFiscale.present) {
      map['codice_fiscale'] = Variable<String>(codiceFiscale.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LavoratoriCompanion(')
          ..write('id: $id, ')
          ..write('aziendaId: $aziendaId, ')
          ..write('cognome: $cognome, ')
          ..write('nome: $nome, ')
          ..write('sesso: $sesso, ')
          ..write('luogoNascita: $luogoNascita, ')
          ..write('dataNascita: $dataNascita, ')
          ..write('domicilioComune: $domicilioComune, ')
          ..write('domicilioProvincia: $domicilioProvincia, ')
          ..write('domicilioIndirizzo: $domicilioIndirizzo, ')
          ..write('domicilioTelefono: $domicilioTelefono, ')
          ..write('nazionalita: $nazionalita, ')
          ..write('codiceFiscale: $codiceFiscale')
          ..write(')'))
        .toString();
  }
}

class $VisiteTable extends Visite with TableInfo<$VisiteTable, Visita> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisiteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lavoratoreIdMeta = const VerificationMeta(
    'lavoratoreId',
  );
  @override
  late final GeneratedColumn<int> lavoratoreId = GeneratedColumn<int>(
    'lavoratore_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lavoratori (id)',
    ),
  );
  static const VerificationMeta _dataVisitaMeta = const VerificationMeta(
    'dataVisita',
  );
  @override
  late final GeneratedColumn<DateTime> dataVisita = GeneratedColumn<DateTime>(
    'data_visita',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoVisitaMeta = const VerificationMeta(
    'tipoVisita',
  );
  @override
  late final GeneratedColumn<int> tipoVisita = GeneratedColumn<int>(
    'tipo_visita',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repartoMeta = const VerificationMeta(
    'reparto',
  );
  @override
  late final GeneratedColumn<String> reparto = GeneratedColumn<String>(
    'reparto',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mansioneSpecificaMeta = const VerificationMeta(
    'mansioneSpecifica',
  );
  @override
  late final GeneratedColumn<String> mansioneSpecifica =
      GeneratedColumn<String>(
        'mansione_specifica',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _fattoriRischio3AMeta = const VerificationMeta(
    'fattoriRischio3A',
  );
  @override
  late final GeneratedColumn<String> fattoriRischio3A = GeneratedColumn<String>(
    'fattori_rischio3_a',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _anamnesiLavorativaMeta =
      const VerificationMeta('anamnesiLavorativa');
  @override
  late final GeneratedColumn<String> anamnesiLavorativa =
      GeneratedColumn<String>(
        'anamnesi_lavorativa',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _anamnesiFamiliareMeta = const VerificationMeta(
    'anamnesiFamiliare',
  );
  @override
  late final GeneratedColumn<String> anamnesiFamiliare =
      GeneratedColumn<String>(
        'anamnesi_familiare',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _anamnesiFisiologicaMeta =
      const VerificationMeta('anamnesiFisiologica');
  @override
  late final GeneratedColumn<String> anamnesiFisiologica =
      GeneratedColumn<String>(
        'anamnesi_fisiologica',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _anamnesiPatologicaRemotaMeta =
      const VerificationMeta('anamnesiPatologicaRemota');
  @override
  late final GeneratedColumn<String> anamnesiPatologicaRemota =
      GeneratedColumn<String>(
        'anamnesi_patologica_remota',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _anamnesiPatologicaProssimaMeta =
      const VerificationMeta('anamnesiPatologicaProssima');
  @override
  late final GeneratedColumn<String> anamnesiPatologicaProssima =
      GeneratedColumn<String>(
        'anamnesi_patologica_prossima',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _esameObiettivoMeta = const VerificationMeta(
    'esameObiettivo',
  );
  @override
  late final GeneratedColumn<String> esameObiettivo = GeneratedColumn<String>(
    'esame_obiettivo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accertamentiIntegrativiMeta =
      const VerificationMeta('accertamentiIntegrativi');
  @override
  late final GeneratedColumn<String> accertamentiIntegrativi =
      GeneratedColumn<String>(
        'accertamenti_integrativi',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _provvedimentiMedicoMeta =
      const VerificationMeta('provvedimentiMedico');
  @override
  late final GeneratedColumn<String> provvedimentiMedico =
      GeneratedColumn<String>(
        'provvedimenti_medico',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _giudizioIdoneitaMeta = const VerificationMeta(
    'giudizioIdoneita',
  );
  @override
  late final GeneratedColumn<int> giudizioIdoneita = GeneratedColumn<int>(
    'giudizio_idoneita',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scadenzaVisitaSuccessivaMeta =
      const VerificationMeta('scadenzaVisitaSuccessiva');
  @override
  late final GeneratedColumn<DateTime> scadenzaVisitaSuccessiva =
      GeneratedColumn<DateTime>(
        'scadenza_visita_successiva',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _dataTrasmissioneLavoratoreMeta =
      const VerificationMeta('dataTrasmissioneLavoratore');
  @override
  late final GeneratedColumn<DateTime> dataTrasmissioneLavoratore =
      GeneratedColumn<DateTime>(
        'data_trasmissione_lavoratore',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _dataTrasmissioneDatoreMeta =
      const VerificationMeta('dataTrasmissioneDatore');
  @override
  late final GeneratedColumn<DateTime> dataTrasmissioneDatore =
      GeneratedColumn<DateTime>(
        'data_trasmissione_datore',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _malattiaProfSegnalataMeta =
      const VerificationMeta('malattiaProfSegnalata');
  @override
  late final GeneratedColumn<bool> malattiaProfSegnalata =
      GeneratedColumn<bool>(
        'malattia_prof_segnalata',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("malattia_prof_segnalata" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _tipologiaMalattiaMeta = const VerificationMeta(
    'tipologiaMalattia',
  );
  @override
  late final GeneratedColumn<String> tipologiaMalattia =
      GeneratedColumn<String>(
        'tipologia_malattia',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _rMmcMeta = const VerificationMeta('rMmc');
  @override
  late final GeneratedColumn<bool> rMmc = GeneratedColumn<bool>(
    'r_mmc',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_mmc" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rSovraccaricoArtiMeta = const VerificationMeta(
    'rSovraccaricoArti',
  );
  @override
  late final GeneratedColumn<bool> rSovraccaricoArti = GeneratedColumn<bool>(
    'r_sovraccarico_arti',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_sovraccarico_arti" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rPosturaliMeta = const VerificationMeta(
    'rPosturali',
  );
  @override
  late final GeneratedColumn<bool> rPosturali = GeneratedColumn<bool>(
    'r_posturali',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_posturali" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rChimicoMeta = const VerificationMeta(
    'rChimico',
  );
  @override
  late final GeneratedColumn<bool> rChimico = GeneratedColumn<bool>(
    'r_chimico',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_chimico" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rCancerogeniMeta = const VerificationMeta(
    'rCancerogeni',
  );
  @override
  late final GeneratedColumn<bool> rCancerogeni = GeneratedColumn<bool>(
    'r_cancerogeni',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_cancerogeni" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rMutageniMeta = const VerificationMeta(
    'rMutageni',
  );
  @override
  late final GeneratedColumn<bool> rMutageni = GeneratedColumn<bool>(
    'r_mutageni',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_mutageni" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rAmiantoMeta = const VerificationMeta(
    'rAmianto',
  );
  @override
  late final GeneratedColumn<bool> rAmianto = GeneratedColumn<bool>(
    'r_amianto',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_amianto" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rSiliceMeta = const VerificationMeta(
    'rSilice',
  );
  @override
  late final GeneratedColumn<bool> rSilice = GeneratedColumn<bool>(
    'r_silice',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_silice" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rBiologicoMeta = const VerificationMeta(
    'rBiologico',
  );
  @override
  late final GeneratedColumn<bool> rBiologico = GeneratedColumn<bool>(
    'r_biologico',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_biologico" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rVdtMeta = const VerificationMeta('rVdt');
  @override
  late final GeneratedColumn<bool> rVdt = GeneratedColumn<bool>(
    'r_vdt',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_vdt" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rVibrazioniCorpoMeta = const VerificationMeta(
    'rVibrazioniCorpo',
  );
  @override
  late final GeneratedColumn<bool> rVibrazioniCorpo = GeneratedColumn<bool>(
    'r_vibrazioni_corpo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_vibrazioni_corpo" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rVibrazioniManoMeta = const VerificationMeta(
    'rVibrazioniMano',
  );
  @override
  late final GeneratedColumn<bool> rVibrazioniMano = GeneratedColumn<bool>(
    'r_vibrazioni_mano',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_vibrazioni_mano" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rRumoreMeta = const VerificationMeta(
    'rRumore',
  );
  @override
  late final GeneratedColumn<bool> rRumore = GeneratedColumn<bool>(
    'r_rumore',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_rumore" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rCampiElettroMeta = const VerificationMeta(
    'rCampiElettro',
  );
  @override
  late final GeneratedColumn<bool> rCampiElettro = GeneratedColumn<bool>(
    'r_campi_elettro',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_campi_elettro" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rRoaMeta = const VerificationMeta('rRoa');
  @override
  late final GeneratedColumn<bool> rRoa = GeneratedColumn<bool>(
    'r_roa',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_roa" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rUvMeta = const VerificationMeta('rUv');
  @override
  late final GeneratedColumn<bool> rUv = GeneratedColumn<bool>(
    'r_uv',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_uv" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rMicroclimaMeta = const VerificationMeta(
    'rMicroclima',
  );
  @override
  late final GeneratedColumn<bool> rMicroclima = GeneratedColumn<bool>(
    'r_microclima',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_microclima" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rInfrasuoniMeta = const VerificationMeta(
    'rInfrasuoni',
  );
  @override
  late final GeneratedColumn<bool> rInfrasuoni = GeneratedColumn<bool>(
    'r_infrasuoni',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_infrasuoni" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rAtmosfereMeta = const VerificationMeta(
    'rAtmosfere',
  );
  @override
  late final GeneratedColumn<bool> rAtmosfere = GeneratedColumn<bool>(
    'r_atmosfere',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_atmosfere" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rNotturnoMeta = const VerificationMeta(
    'rNotturno',
  );
  @override
  late final GeneratedColumn<bool> rNotturno = GeneratedColumn<bool>(
    'r_notturno',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_notturno" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rRiproduzioneMeta = const VerificationMeta(
    'rRiproduzione',
  );
  @override
  late final GeneratedColumn<bool> rRiproduzione = GeneratedColumn<bool>(
    'r_riproduzione',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("r_riproduzione" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rAltriRischiMeta = const VerificationMeta(
    'rAltriRischi',
  );
  @override
  late final GeneratedColumn<String> rAltriRischi = GeneratedColumn<String>(
    'r_altri_rischi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _screeningAlcolMeta = const VerificationMeta(
    'screeningAlcol',
  );
  @override
  late final GeneratedColumn<bool> screeningAlcol = GeneratedColumn<bool>(
    'screening_alcol',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("screening_alcol" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _screeningSostanzeMeta = const VerificationMeta(
    'screeningSostanze',
  );
  @override
  late final GeneratedColumn<bool> screeningSostanze = GeneratedColumn<bool>(
    'screening_sostanze',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("screening_sostanze" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _invioSertMeta = const VerificationMeta(
    'invioSert',
  );
  @override
  late final GeneratedColumn<bool> invioSert = GeneratedColumn<bool>(
    'invio_sert',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("invio_sert" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dipendenzaConfermataMeta =
      const VerificationMeta('dipendenzaConfermata');
  @override
  late final GeneratedColumn<bool> dipendenzaConfermata = GeneratedColumn<bool>(
    'dipendenza_confermata',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("dipendenza_confermata" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lavoratoreId,
    dataVisita,
    tipoVisita,
    reparto,
    mansioneSpecifica,
    fattoriRischio3A,
    anamnesiLavorativa,
    anamnesiFamiliare,
    anamnesiFisiologica,
    anamnesiPatologicaRemota,
    anamnesiPatologicaProssima,
    esameObiettivo,
    accertamentiIntegrativi,
    provvedimentiMedico,
    giudizioIdoneita,
    scadenzaVisitaSuccessiva,
    dataTrasmissioneLavoratore,
    dataTrasmissioneDatore,
    malattiaProfSegnalata,
    tipologiaMalattia,
    rMmc,
    rSovraccaricoArti,
    rPosturali,
    rChimico,
    rCancerogeni,
    rMutageni,
    rAmianto,
    rSilice,
    rBiologico,
    rVdt,
    rVibrazioniCorpo,
    rVibrazioniMano,
    rRumore,
    rCampiElettro,
    rRoa,
    rUv,
    rMicroclima,
    rInfrasuoni,
    rAtmosfere,
    rNotturno,
    rRiproduzione,
    rAltriRischi,
    screeningAlcol,
    screeningSostanze,
    invioSert,
    dipendenzaConfermata,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visite';
  @override
  VerificationContext validateIntegrity(
    Insertable<Visita> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lavoratore_id')) {
      context.handle(
        _lavoratoreIdMeta,
        lavoratoreId.isAcceptableOrUnknown(
          data['lavoratore_id']!,
          _lavoratoreIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lavoratoreIdMeta);
    }
    if (data.containsKey('data_visita')) {
      context.handle(
        _dataVisitaMeta,
        dataVisita.isAcceptableOrUnknown(data['data_visita']!, _dataVisitaMeta),
      );
    } else if (isInserting) {
      context.missing(_dataVisitaMeta);
    }
    if (data.containsKey('tipo_visita')) {
      context.handle(
        _tipoVisitaMeta,
        tipoVisita.isAcceptableOrUnknown(data['tipo_visita']!, _tipoVisitaMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoVisitaMeta);
    }
    if (data.containsKey('reparto')) {
      context.handle(
        _repartoMeta,
        reparto.isAcceptableOrUnknown(data['reparto']!, _repartoMeta),
      );
    }
    if (data.containsKey('mansione_specifica')) {
      context.handle(
        _mansioneSpecificaMeta,
        mansioneSpecifica.isAcceptableOrUnknown(
          data['mansione_specifica']!,
          _mansioneSpecificaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mansioneSpecificaMeta);
    }
    if (data.containsKey('fattori_rischio3_a')) {
      context.handle(
        _fattoriRischio3AMeta,
        fattoriRischio3A.isAcceptableOrUnknown(
          data['fattori_rischio3_a']!,
          _fattoriRischio3AMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fattoriRischio3AMeta);
    }
    if (data.containsKey('anamnesi_lavorativa')) {
      context.handle(
        _anamnesiLavorativaMeta,
        anamnesiLavorativa.isAcceptableOrUnknown(
          data['anamnesi_lavorativa']!,
          _anamnesiLavorativaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_anamnesiLavorativaMeta);
    }
    if (data.containsKey('anamnesi_familiare')) {
      context.handle(
        _anamnesiFamiliareMeta,
        anamnesiFamiliare.isAcceptableOrUnknown(
          data['anamnesi_familiare']!,
          _anamnesiFamiliareMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_anamnesiFamiliareMeta);
    }
    if (data.containsKey('anamnesi_fisiologica')) {
      context.handle(
        _anamnesiFisiologicaMeta,
        anamnesiFisiologica.isAcceptableOrUnknown(
          data['anamnesi_fisiologica']!,
          _anamnesiFisiologicaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_anamnesiFisiologicaMeta);
    }
    if (data.containsKey('anamnesi_patologica_remota')) {
      context.handle(
        _anamnesiPatologicaRemotaMeta,
        anamnesiPatologicaRemota.isAcceptableOrUnknown(
          data['anamnesi_patologica_remota']!,
          _anamnesiPatologicaRemotaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_anamnesiPatologicaRemotaMeta);
    }
    if (data.containsKey('anamnesi_patologica_prossima')) {
      context.handle(
        _anamnesiPatologicaProssimaMeta,
        anamnesiPatologicaProssima.isAcceptableOrUnknown(
          data['anamnesi_patologica_prossima']!,
          _anamnesiPatologicaProssimaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_anamnesiPatologicaProssimaMeta);
    }
    if (data.containsKey('esame_obiettivo')) {
      context.handle(
        _esameObiettivoMeta,
        esameObiettivo.isAcceptableOrUnknown(
          data['esame_obiettivo']!,
          _esameObiettivoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_esameObiettivoMeta);
    }
    if (data.containsKey('accertamenti_integrativi')) {
      context.handle(
        _accertamentiIntegrativiMeta,
        accertamentiIntegrativi.isAcceptableOrUnknown(
          data['accertamenti_integrativi']!,
          _accertamentiIntegrativiMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accertamentiIntegrativiMeta);
    }
    if (data.containsKey('provvedimenti_medico')) {
      context.handle(
        _provvedimentiMedicoMeta,
        provvedimentiMedico.isAcceptableOrUnknown(
          data['provvedimenti_medico']!,
          _provvedimentiMedicoMeta,
        ),
      );
    }
    if (data.containsKey('giudizio_idoneita')) {
      context.handle(
        _giudizioIdoneitaMeta,
        giudizioIdoneita.isAcceptableOrUnknown(
          data['giudizio_idoneita']!,
          _giudizioIdoneitaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_giudizioIdoneitaMeta);
    }
    if (data.containsKey('scadenza_visita_successiva')) {
      context.handle(
        _scadenzaVisitaSuccessivaMeta,
        scadenzaVisitaSuccessiva.isAcceptableOrUnknown(
          data['scadenza_visita_successiva']!,
          _scadenzaVisitaSuccessivaMeta,
        ),
      );
    }
    if (data.containsKey('data_trasmissione_lavoratore')) {
      context.handle(
        _dataTrasmissioneLavoratoreMeta,
        dataTrasmissioneLavoratore.isAcceptableOrUnknown(
          data['data_trasmissione_lavoratore']!,
          _dataTrasmissioneLavoratoreMeta,
        ),
      );
    }
    if (data.containsKey('data_trasmissione_datore')) {
      context.handle(
        _dataTrasmissioneDatoreMeta,
        dataTrasmissioneDatore.isAcceptableOrUnknown(
          data['data_trasmissione_datore']!,
          _dataTrasmissioneDatoreMeta,
        ),
      );
    }
    if (data.containsKey('malattia_prof_segnalata')) {
      context.handle(
        _malattiaProfSegnalataMeta,
        malattiaProfSegnalata.isAcceptableOrUnknown(
          data['malattia_prof_segnalata']!,
          _malattiaProfSegnalataMeta,
        ),
      );
    }
    if (data.containsKey('tipologia_malattia')) {
      context.handle(
        _tipologiaMalattiaMeta,
        tipologiaMalattia.isAcceptableOrUnknown(
          data['tipologia_malattia']!,
          _tipologiaMalattiaMeta,
        ),
      );
    }
    if (data.containsKey('r_mmc')) {
      context.handle(
        _rMmcMeta,
        rMmc.isAcceptableOrUnknown(data['r_mmc']!, _rMmcMeta),
      );
    }
    if (data.containsKey('r_sovraccarico_arti')) {
      context.handle(
        _rSovraccaricoArtiMeta,
        rSovraccaricoArti.isAcceptableOrUnknown(
          data['r_sovraccarico_arti']!,
          _rSovraccaricoArtiMeta,
        ),
      );
    }
    if (data.containsKey('r_posturali')) {
      context.handle(
        _rPosturaliMeta,
        rPosturali.isAcceptableOrUnknown(data['r_posturali']!, _rPosturaliMeta),
      );
    }
    if (data.containsKey('r_chimico')) {
      context.handle(
        _rChimicoMeta,
        rChimico.isAcceptableOrUnknown(data['r_chimico']!, _rChimicoMeta),
      );
    }
    if (data.containsKey('r_cancerogeni')) {
      context.handle(
        _rCancerogeniMeta,
        rCancerogeni.isAcceptableOrUnknown(
          data['r_cancerogeni']!,
          _rCancerogeniMeta,
        ),
      );
    }
    if (data.containsKey('r_mutageni')) {
      context.handle(
        _rMutageniMeta,
        rMutageni.isAcceptableOrUnknown(data['r_mutageni']!, _rMutageniMeta),
      );
    }
    if (data.containsKey('r_amianto')) {
      context.handle(
        _rAmiantoMeta,
        rAmianto.isAcceptableOrUnknown(data['r_amianto']!, _rAmiantoMeta),
      );
    }
    if (data.containsKey('r_silice')) {
      context.handle(
        _rSiliceMeta,
        rSilice.isAcceptableOrUnknown(data['r_silice']!, _rSiliceMeta),
      );
    }
    if (data.containsKey('r_biologico')) {
      context.handle(
        _rBiologicoMeta,
        rBiologico.isAcceptableOrUnknown(data['r_biologico']!, _rBiologicoMeta),
      );
    }
    if (data.containsKey('r_vdt')) {
      context.handle(
        _rVdtMeta,
        rVdt.isAcceptableOrUnknown(data['r_vdt']!, _rVdtMeta),
      );
    }
    if (data.containsKey('r_vibrazioni_corpo')) {
      context.handle(
        _rVibrazioniCorpoMeta,
        rVibrazioniCorpo.isAcceptableOrUnknown(
          data['r_vibrazioni_corpo']!,
          _rVibrazioniCorpoMeta,
        ),
      );
    }
    if (data.containsKey('r_vibrazioni_mano')) {
      context.handle(
        _rVibrazioniManoMeta,
        rVibrazioniMano.isAcceptableOrUnknown(
          data['r_vibrazioni_mano']!,
          _rVibrazioniManoMeta,
        ),
      );
    }
    if (data.containsKey('r_rumore')) {
      context.handle(
        _rRumoreMeta,
        rRumore.isAcceptableOrUnknown(data['r_rumore']!, _rRumoreMeta),
      );
    }
    if (data.containsKey('r_campi_elettro')) {
      context.handle(
        _rCampiElettroMeta,
        rCampiElettro.isAcceptableOrUnknown(
          data['r_campi_elettro']!,
          _rCampiElettroMeta,
        ),
      );
    }
    if (data.containsKey('r_roa')) {
      context.handle(
        _rRoaMeta,
        rRoa.isAcceptableOrUnknown(data['r_roa']!, _rRoaMeta),
      );
    }
    if (data.containsKey('r_uv')) {
      context.handle(
        _rUvMeta,
        rUv.isAcceptableOrUnknown(data['r_uv']!, _rUvMeta),
      );
    }
    if (data.containsKey('r_microclima')) {
      context.handle(
        _rMicroclimaMeta,
        rMicroclima.isAcceptableOrUnknown(
          data['r_microclima']!,
          _rMicroclimaMeta,
        ),
      );
    }
    if (data.containsKey('r_infrasuoni')) {
      context.handle(
        _rInfrasuoniMeta,
        rInfrasuoni.isAcceptableOrUnknown(
          data['r_infrasuoni']!,
          _rInfrasuoniMeta,
        ),
      );
    }
    if (data.containsKey('r_atmosfere')) {
      context.handle(
        _rAtmosfereMeta,
        rAtmosfere.isAcceptableOrUnknown(data['r_atmosfere']!, _rAtmosfereMeta),
      );
    }
    if (data.containsKey('r_notturno')) {
      context.handle(
        _rNotturnoMeta,
        rNotturno.isAcceptableOrUnknown(data['r_notturno']!, _rNotturnoMeta),
      );
    }
    if (data.containsKey('r_riproduzione')) {
      context.handle(
        _rRiproduzioneMeta,
        rRiproduzione.isAcceptableOrUnknown(
          data['r_riproduzione']!,
          _rRiproduzioneMeta,
        ),
      );
    }
    if (data.containsKey('r_altri_rischi')) {
      context.handle(
        _rAltriRischiMeta,
        rAltriRischi.isAcceptableOrUnknown(
          data['r_altri_rischi']!,
          _rAltriRischiMeta,
        ),
      );
    }
    if (data.containsKey('screening_alcol')) {
      context.handle(
        _screeningAlcolMeta,
        screeningAlcol.isAcceptableOrUnknown(
          data['screening_alcol']!,
          _screeningAlcolMeta,
        ),
      );
    }
    if (data.containsKey('screening_sostanze')) {
      context.handle(
        _screeningSostanzeMeta,
        screeningSostanze.isAcceptableOrUnknown(
          data['screening_sostanze']!,
          _screeningSostanzeMeta,
        ),
      );
    }
    if (data.containsKey('invio_sert')) {
      context.handle(
        _invioSertMeta,
        invioSert.isAcceptableOrUnknown(data['invio_sert']!, _invioSertMeta),
      );
    }
    if (data.containsKey('dipendenza_confermata')) {
      context.handle(
        _dipendenzaConfermataMeta,
        dipendenzaConfermata.isAcceptableOrUnknown(
          data['dipendenza_confermata']!,
          _dipendenzaConfermataMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Visita map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Visita(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lavoratoreId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lavoratore_id'],
      )!,
      dataVisita: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_visita'],
      )!,
      tipoVisita: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tipo_visita'],
      )!,
      reparto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reparto'],
      ),
      mansioneSpecifica: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mansione_specifica'],
      )!,
      fattoriRischio3A: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fattori_rischio3_a'],
      )!,
      anamnesiLavorativa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}anamnesi_lavorativa'],
      )!,
      anamnesiFamiliare: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}anamnesi_familiare'],
      )!,
      anamnesiFisiologica: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}anamnesi_fisiologica'],
      )!,
      anamnesiPatologicaRemota: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}anamnesi_patologica_remota'],
      )!,
      anamnesiPatologicaProssima: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}anamnesi_patologica_prossima'],
      )!,
      esameObiettivo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}esame_obiettivo'],
      )!,
      accertamentiIntegrativi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accertamenti_integrativi'],
      )!,
      provvedimentiMedico: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provvedimenti_medico'],
      ),
      giudizioIdoneita: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}giudizio_idoneita'],
      )!,
      scadenzaVisitaSuccessiva: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scadenza_visita_successiva'],
      ),
      dataTrasmissioneLavoratore: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_trasmissione_lavoratore'],
      ),
      dataTrasmissioneDatore: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_trasmissione_datore'],
      ),
      malattiaProfSegnalata: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}malattia_prof_segnalata'],
      )!,
      tipologiaMalattia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipologia_malattia'],
      ),
      rMmc: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_mmc'],
      )!,
      rSovraccaricoArti: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_sovraccarico_arti'],
      )!,
      rPosturali: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_posturali'],
      )!,
      rChimico: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_chimico'],
      )!,
      rCancerogeni: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_cancerogeni'],
      )!,
      rMutageni: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_mutageni'],
      )!,
      rAmianto: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_amianto'],
      )!,
      rSilice: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_silice'],
      )!,
      rBiologico: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_biologico'],
      )!,
      rVdt: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_vdt'],
      )!,
      rVibrazioniCorpo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_vibrazioni_corpo'],
      )!,
      rVibrazioniMano: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_vibrazioni_mano'],
      )!,
      rRumore: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_rumore'],
      )!,
      rCampiElettro: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_campi_elettro'],
      )!,
      rRoa: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_roa'],
      )!,
      rUv: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_uv'],
      )!,
      rMicroclima: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_microclima'],
      )!,
      rInfrasuoni: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_infrasuoni'],
      )!,
      rAtmosfere: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_atmosfere'],
      )!,
      rNotturno: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_notturno'],
      )!,
      rRiproduzione: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}r_riproduzione'],
      )!,
      rAltriRischi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}r_altri_rischi'],
      ),
      screeningAlcol: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}screening_alcol'],
      )!,
      screeningSostanze: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}screening_sostanze'],
      )!,
      invioSert: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}invio_sert'],
      )!,
      dipendenzaConfermata: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}dipendenza_confermata'],
      )!,
    );
  }

  @override
  $VisiteTable createAlias(String alias) {
    return $VisiteTable(attachedDatabase, alias);
  }
}

class Visita extends DataClass implements Insertable<Visita> {
  final int id;
  final int lavoratoreId;
  final DateTime dataVisita;
  final int tipoVisita;
  final String? reparto;
  final String mansioneSpecifica;
  final String fattoriRischio3A;
  final String anamnesiLavorativa;
  final String anamnesiFamiliare;
  final String anamnesiFisiologica;
  final String anamnesiPatologicaRemota;
  final String anamnesiPatologicaProssima;
  final String esameObiettivo;
  final String accertamentiIntegrativi;
  final String? provvedimentiMedico;
  final int giudizioIdoneita;
  final DateTime? scadenzaVisitaSuccessiva;
  final DateTime? dataTrasmissioneLavoratore;
  final DateTime? dataTrasmissioneDatore;
  final bool malattiaProfSegnalata;
  final String? tipologiaMalattia;
  final bool rMmc;
  final bool rSovraccaricoArti;
  final bool rPosturali;
  final bool rChimico;
  final bool rCancerogeni;
  final bool rMutageni;
  final bool rAmianto;
  final bool rSilice;
  final bool rBiologico;
  final bool rVdt;
  final bool rVibrazioniCorpo;
  final bool rVibrazioniMano;
  final bool rRumore;
  final bool rCampiElettro;
  final bool rRoa;
  final bool rUv;
  final bool rMicroclima;
  final bool rInfrasuoni;
  final bool rAtmosfere;
  final bool rNotturno;
  final bool rRiproduzione;
  final String? rAltriRischi;
  final bool screeningAlcol;
  final bool screeningSostanze;
  final bool invioSert;
  final bool dipendenzaConfermata;
  const Visita({
    required this.id,
    required this.lavoratoreId,
    required this.dataVisita,
    required this.tipoVisita,
    this.reparto,
    required this.mansioneSpecifica,
    required this.fattoriRischio3A,
    required this.anamnesiLavorativa,
    required this.anamnesiFamiliare,
    required this.anamnesiFisiologica,
    required this.anamnesiPatologicaRemota,
    required this.anamnesiPatologicaProssima,
    required this.esameObiettivo,
    required this.accertamentiIntegrativi,
    this.provvedimentiMedico,
    required this.giudizioIdoneita,
    this.scadenzaVisitaSuccessiva,
    this.dataTrasmissioneLavoratore,
    this.dataTrasmissioneDatore,
    required this.malattiaProfSegnalata,
    this.tipologiaMalattia,
    required this.rMmc,
    required this.rSovraccaricoArti,
    required this.rPosturali,
    required this.rChimico,
    required this.rCancerogeni,
    required this.rMutageni,
    required this.rAmianto,
    required this.rSilice,
    required this.rBiologico,
    required this.rVdt,
    required this.rVibrazioniCorpo,
    required this.rVibrazioniMano,
    required this.rRumore,
    required this.rCampiElettro,
    required this.rRoa,
    required this.rUv,
    required this.rMicroclima,
    required this.rInfrasuoni,
    required this.rAtmosfere,
    required this.rNotturno,
    required this.rRiproduzione,
    this.rAltriRischi,
    required this.screeningAlcol,
    required this.screeningSostanze,
    required this.invioSert,
    required this.dipendenzaConfermata,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lavoratore_id'] = Variable<int>(lavoratoreId);
    map['data_visita'] = Variable<DateTime>(dataVisita);
    map['tipo_visita'] = Variable<int>(tipoVisita);
    if (!nullToAbsent || reparto != null) {
      map['reparto'] = Variable<String>(reparto);
    }
    map['mansione_specifica'] = Variable<String>(mansioneSpecifica);
    map['fattori_rischio3_a'] = Variable<String>(fattoriRischio3A);
    map['anamnesi_lavorativa'] = Variable<String>(anamnesiLavorativa);
    map['anamnesi_familiare'] = Variable<String>(anamnesiFamiliare);
    map['anamnesi_fisiologica'] = Variable<String>(anamnesiFisiologica);
    map['anamnesi_patologica_remota'] = Variable<String>(
      anamnesiPatologicaRemota,
    );
    map['anamnesi_patologica_prossima'] = Variable<String>(
      anamnesiPatologicaProssima,
    );
    map['esame_obiettivo'] = Variable<String>(esameObiettivo);
    map['accertamenti_integrativi'] = Variable<String>(accertamentiIntegrativi);
    if (!nullToAbsent || provvedimentiMedico != null) {
      map['provvedimenti_medico'] = Variable<String>(provvedimentiMedico);
    }
    map['giudizio_idoneita'] = Variable<int>(giudizioIdoneita);
    if (!nullToAbsent || scadenzaVisitaSuccessiva != null) {
      map['scadenza_visita_successiva'] = Variable<DateTime>(
        scadenzaVisitaSuccessiva,
      );
    }
    if (!nullToAbsent || dataTrasmissioneLavoratore != null) {
      map['data_trasmissione_lavoratore'] = Variable<DateTime>(
        dataTrasmissioneLavoratore,
      );
    }
    if (!nullToAbsent || dataTrasmissioneDatore != null) {
      map['data_trasmissione_datore'] = Variable<DateTime>(
        dataTrasmissioneDatore,
      );
    }
    map['malattia_prof_segnalata'] = Variable<bool>(malattiaProfSegnalata);
    if (!nullToAbsent || tipologiaMalattia != null) {
      map['tipologia_malattia'] = Variable<String>(tipologiaMalattia);
    }
    map['r_mmc'] = Variable<bool>(rMmc);
    map['r_sovraccarico_arti'] = Variable<bool>(rSovraccaricoArti);
    map['r_posturali'] = Variable<bool>(rPosturali);
    map['r_chimico'] = Variable<bool>(rChimico);
    map['r_cancerogeni'] = Variable<bool>(rCancerogeni);
    map['r_mutageni'] = Variable<bool>(rMutageni);
    map['r_amianto'] = Variable<bool>(rAmianto);
    map['r_silice'] = Variable<bool>(rSilice);
    map['r_biologico'] = Variable<bool>(rBiologico);
    map['r_vdt'] = Variable<bool>(rVdt);
    map['r_vibrazioni_corpo'] = Variable<bool>(rVibrazioniCorpo);
    map['r_vibrazioni_mano'] = Variable<bool>(rVibrazioniMano);
    map['r_rumore'] = Variable<bool>(rRumore);
    map['r_campi_elettro'] = Variable<bool>(rCampiElettro);
    map['r_roa'] = Variable<bool>(rRoa);
    map['r_uv'] = Variable<bool>(rUv);
    map['r_microclima'] = Variable<bool>(rMicroclima);
    map['r_infrasuoni'] = Variable<bool>(rInfrasuoni);
    map['r_atmosfere'] = Variable<bool>(rAtmosfere);
    map['r_notturno'] = Variable<bool>(rNotturno);
    map['r_riproduzione'] = Variable<bool>(rRiproduzione);
    if (!nullToAbsent || rAltriRischi != null) {
      map['r_altri_rischi'] = Variable<String>(rAltriRischi);
    }
    map['screening_alcol'] = Variable<bool>(screeningAlcol);
    map['screening_sostanze'] = Variable<bool>(screeningSostanze);
    map['invio_sert'] = Variable<bool>(invioSert);
    map['dipendenza_confermata'] = Variable<bool>(dipendenzaConfermata);
    return map;
  }

  VisiteCompanion toCompanion(bool nullToAbsent) {
    return VisiteCompanion(
      id: Value(id),
      lavoratoreId: Value(lavoratoreId),
      dataVisita: Value(dataVisita),
      tipoVisita: Value(tipoVisita),
      reparto: reparto == null && nullToAbsent
          ? const Value.absent()
          : Value(reparto),
      mansioneSpecifica: Value(mansioneSpecifica),
      fattoriRischio3A: Value(fattoriRischio3A),
      anamnesiLavorativa: Value(anamnesiLavorativa),
      anamnesiFamiliare: Value(anamnesiFamiliare),
      anamnesiFisiologica: Value(anamnesiFisiologica),
      anamnesiPatologicaRemota: Value(anamnesiPatologicaRemota),
      anamnesiPatologicaProssima: Value(anamnesiPatologicaProssima),
      esameObiettivo: Value(esameObiettivo),
      accertamentiIntegrativi: Value(accertamentiIntegrativi),
      provvedimentiMedico: provvedimentiMedico == null && nullToAbsent
          ? const Value.absent()
          : Value(provvedimentiMedico),
      giudizioIdoneita: Value(giudizioIdoneita),
      scadenzaVisitaSuccessiva: scadenzaVisitaSuccessiva == null && nullToAbsent
          ? const Value.absent()
          : Value(scadenzaVisitaSuccessiva),
      dataTrasmissioneLavoratore:
          dataTrasmissioneLavoratore == null && nullToAbsent
          ? const Value.absent()
          : Value(dataTrasmissioneLavoratore),
      dataTrasmissioneDatore: dataTrasmissioneDatore == null && nullToAbsent
          ? const Value.absent()
          : Value(dataTrasmissioneDatore),
      malattiaProfSegnalata: Value(malattiaProfSegnalata),
      tipologiaMalattia: tipologiaMalattia == null && nullToAbsent
          ? const Value.absent()
          : Value(tipologiaMalattia),
      rMmc: Value(rMmc),
      rSovraccaricoArti: Value(rSovraccaricoArti),
      rPosturali: Value(rPosturali),
      rChimico: Value(rChimico),
      rCancerogeni: Value(rCancerogeni),
      rMutageni: Value(rMutageni),
      rAmianto: Value(rAmianto),
      rSilice: Value(rSilice),
      rBiologico: Value(rBiologico),
      rVdt: Value(rVdt),
      rVibrazioniCorpo: Value(rVibrazioniCorpo),
      rVibrazioniMano: Value(rVibrazioniMano),
      rRumore: Value(rRumore),
      rCampiElettro: Value(rCampiElettro),
      rRoa: Value(rRoa),
      rUv: Value(rUv),
      rMicroclima: Value(rMicroclima),
      rInfrasuoni: Value(rInfrasuoni),
      rAtmosfere: Value(rAtmosfere),
      rNotturno: Value(rNotturno),
      rRiproduzione: Value(rRiproduzione),
      rAltriRischi: rAltriRischi == null && nullToAbsent
          ? const Value.absent()
          : Value(rAltriRischi),
      screeningAlcol: Value(screeningAlcol),
      screeningSostanze: Value(screeningSostanze),
      invioSert: Value(invioSert),
      dipendenzaConfermata: Value(dipendenzaConfermata),
    );
  }

  factory Visita.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Visita(
      id: serializer.fromJson<int>(json['id']),
      lavoratoreId: serializer.fromJson<int>(json['lavoratoreId']),
      dataVisita: serializer.fromJson<DateTime>(json['dataVisita']),
      tipoVisita: serializer.fromJson<int>(json['tipoVisita']),
      reparto: serializer.fromJson<String?>(json['reparto']),
      mansioneSpecifica: serializer.fromJson<String>(json['mansioneSpecifica']),
      fattoriRischio3A: serializer.fromJson<String>(json['fattoriRischio3A']),
      anamnesiLavorativa: serializer.fromJson<String>(
        json['anamnesiLavorativa'],
      ),
      anamnesiFamiliare: serializer.fromJson<String>(json['anamnesiFamiliare']),
      anamnesiFisiologica: serializer.fromJson<String>(
        json['anamnesiFisiologica'],
      ),
      anamnesiPatologicaRemota: serializer.fromJson<String>(
        json['anamnesiPatologicaRemota'],
      ),
      anamnesiPatologicaProssima: serializer.fromJson<String>(
        json['anamnesiPatologicaProssima'],
      ),
      esameObiettivo: serializer.fromJson<String>(json['esameObiettivo']),
      accertamentiIntegrativi: serializer.fromJson<String>(
        json['accertamentiIntegrativi'],
      ),
      provvedimentiMedico: serializer.fromJson<String?>(
        json['provvedimentiMedico'],
      ),
      giudizioIdoneita: serializer.fromJson<int>(json['giudizioIdoneita']),
      scadenzaVisitaSuccessiva: serializer.fromJson<DateTime?>(
        json['scadenzaVisitaSuccessiva'],
      ),
      dataTrasmissioneLavoratore: serializer.fromJson<DateTime?>(
        json['dataTrasmissioneLavoratore'],
      ),
      dataTrasmissioneDatore: serializer.fromJson<DateTime?>(
        json['dataTrasmissioneDatore'],
      ),
      malattiaProfSegnalata: serializer.fromJson<bool>(
        json['malattiaProfSegnalata'],
      ),
      tipologiaMalattia: serializer.fromJson<String?>(
        json['tipologiaMalattia'],
      ),
      rMmc: serializer.fromJson<bool>(json['rMmc']),
      rSovraccaricoArti: serializer.fromJson<bool>(json['rSovraccaricoArti']),
      rPosturali: serializer.fromJson<bool>(json['rPosturali']),
      rChimico: serializer.fromJson<bool>(json['rChimico']),
      rCancerogeni: serializer.fromJson<bool>(json['rCancerogeni']),
      rMutageni: serializer.fromJson<bool>(json['rMutageni']),
      rAmianto: serializer.fromJson<bool>(json['rAmianto']),
      rSilice: serializer.fromJson<bool>(json['rSilice']),
      rBiologico: serializer.fromJson<bool>(json['rBiologico']),
      rVdt: serializer.fromJson<bool>(json['rVdt']),
      rVibrazioniCorpo: serializer.fromJson<bool>(json['rVibrazioniCorpo']),
      rVibrazioniMano: serializer.fromJson<bool>(json['rVibrazioniMano']),
      rRumore: serializer.fromJson<bool>(json['rRumore']),
      rCampiElettro: serializer.fromJson<bool>(json['rCampiElettro']),
      rRoa: serializer.fromJson<bool>(json['rRoa']),
      rUv: serializer.fromJson<bool>(json['rUv']),
      rMicroclima: serializer.fromJson<bool>(json['rMicroclima']),
      rInfrasuoni: serializer.fromJson<bool>(json['rInfrasuoni']),
      rAtmosfere: serializer.fromJson<bool>(json['rAtmosfere']),
      rNotturno: serializer.fromJson<bool>(json['rNotturno']),
      rRiproduzione: serializer.fromJson<bool>(json['rRiproduzione']),
      rAltriRischi: serializer.fromJson<String?>(json['rAltriRischi']),
      screeningAlcol: serializer.fromJson<bool>(json['screeningAlcol']),
      screeningSostanze: serializer.fromJson<bool>(json['screeningSostanze']),
      invioSert: serializer.fromJson<bool>(json['invioSert']),
      dipendenzaConfermata: serializer.fromJson<bool>(
        json['dipendenzaConfermata'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lavoratoreId': serializer.toJson<int>(lavoratoreId),
      'dataVisita': serializer.toJson<DateTime>(dataVisita),
      'tipoVisita': serializer.toJson<int>(tipoVisita),
      'reparto': serializer.toJson<String?>(reparto),
      'mansioneSpecifica': serializer.toJson<String>(mansioneSpecifica),
      'fattoriRischio3A': serializer.toJson<String>(fattoriRischio3A),
      'anamnesiLavorativa': serializer.toJson<String>(anamnesiLavorativa),
      'anamnesiFamiliare': serializer.toJson<String>(anamnesiFamiliare),
      'anamnesiFisiologica': serializer.toJson<String>(anamnesiFisiologica),
      'anamnesiPatologicaRemota': serializer.toJson<String>(
        anamnesiPatologicaRemota,
      ),
      'anamnesiPatologicaProssima': serializer.toJson<String>(
        anamnesiPatologicaProssima,
      ),
      'esameObiettivo': serializer.toJson<String>(esameObiettivo),
      'accertamentiIntegrativi': serializer.toJson<String>(
        accertamentiIntegrativi,
      ),
      'provvedimentiMedico': serializer.toJson<String?>(provvedimentiMedico),
      'giudizioIdoneita': serializer.toJson<int>(giudizioIdoneita),
      'scadenzaVisitaSuccessiva': serializer.toJson<DateTime?>(
        scadenzaVisitaSuccessiva,
      ),
      'dataTrasmissioneLavoratore': serializer.toJson<DateTime?>(
        dataTrasmissioneLavoratore,
      ),
      'dataTrasmissioneDatore': serializer.toJson<DateTime?>(
        dataTrasmissioneDatore,
      ),
      'malattiaProfSegnalata': serializer.toJson<bool>(malattiaProfSegnalata),
      'tipologiaMalattia': serializer.toJson<String?>(tipologiaMalattia),
      'rMmc': serializer.toJson<bool>(rMmc),
      'rSovraccaricoArti': serializer.toJson<bool>(rSovraccaricoArti),
      'rPosturali': serializer.toJson<bool>(rPosturali),
      'rChimico': serializer.toJson<bool>(rChimico),
      'rCancerogeni': serializer.toJson<bool>(rCancerogeni),
      'rMutageni': serializer.toJson<bool>(rMutageni),
      'rAmianto': serializer.toJson<bool>(rAmianto),
      'rSilice': serializer.toJson<bool>(rSilice),
      'rBiologico': serializer.toJson<bool>(rBiologico),
      'rVdt': serializer.toJson<bool>(rVdt),
      'rVibrazioniCorpo': serializer.toJson<bool>(rVibrazioniCorpo),
      'rVibrazioniMano': serializer.toJson<bool>(rVibrazioniMano),
      'rRumore': serializer.toJson<bool>(rRumore),
      'rCampiElettro': serializer.toJson<bool>(rCampiElettro),
      'rRoa': serializer.toJson<bool>(rRoa),
      'rUv': serializer.toJson<bool>(rUv),
      'rMicroclima': serializer.toJson<bool>(rMicroclima),
      'rInfrasuoni': serializer.toJson<bool>(rInfrasuoni),
      'rAtmosfere': serializer.toJson<bool>(rAtmosfere),
      'rNotturno': serializer.toJson<bool>(rNotturno),
      'rRiproduzione': serializer.toJson<bool>(rRiproduzione),
      'rAltriRischi': serializer.toJson<String?>(rAltriRischi),
      'screeningAlcol': serializer.toJson<bool>(screeningAlcol),
      'screeningSostanze': serializer.toJson<bool>(screeningSostanze),
      'invioSert': serializer.toJson<bool>(invioSert),
      'dipendenzaConfermata': serializer.toJson<bool>(dipendenzaConfermata),
    };
  }

  Visita copyWith({
    int? id,
    int? lavoratoreId,
    DateTime? dataVisita,
    int? tipoVisita,
    Value<String?> reparto = const Value.absent(),
    String? mansioneSpecifica,
    String? fattoriRischio3A,
    String? anamnesiLavorativa,
    String? anamnesiFamiliare,
    String? anamnesiFisiologica,
    String? anamnesiPatologicaRemota,
    String? anamnesiPatologicaProssima,
    String? esameObiettivo,
    String? accertamentiIntegrativi,
    Value<String?> provvedimentiMedico = const Value.absent(),
    int? giudizioIdoneita,
    Value<DateTime?> scadenzaVisitaSuccessiva = const Value.absent(),
    Value<DateTime?> dataTrasmissioneLavoratore = const Value.absent(),
    Value<DateTime?> dataTrasmissioneDatore = const Value.absent(),
    bool? malattiaProfSegnalata,
    Value<String?> tipologiaMalattia = const Value.absent(),
    bool? rMmc,
    bool? rSovraccaricoArti,
    bool? rPosturali,
    bool? rChimico,
    bool? rCancerogeni,
    bool? rMutageni,
    bool? rAmianto,
    bool? rSilice,
    bool? rBiologico,
    bool? rVdt,
    bool? rVibrazioniCorpo,
    bool? rVibrazioniMano,
    bool? rRumore,
    bool? rCampiElettro,
    bool? rRoa,
    bool? rUv,
    bool? rMicroclima,
    bool? rInfrasuoni,
    bool? rAtmosfere,
    bool? rNotturno,
    bool? rRiproduzione,
    Value<String?> rAltriRischi = const Value.absent(),
    bool? screeningAlcol,
    bool? screeningSostanze,
    bool? invioSert,
    bool? dipendenzaConfermata,
  }) => Visita(
    id: id ?? this.id,
    lavoratoreId: lavoratoreId ?? this.lavoratoreId,
    dataVisita: dataVisita ?? this.dataVisita,
    tipoVisita: tipoVisita ?? this.tipoVisita,
    reparto: reparto.present ? reparto.value : this.reparto,
    mansioneSpecifica: mansioneSpecifica ?? this.mansioneSpecifica,
    fattoriRischio3A: fattoriRischio3A ?? this.fattoriRischio3A,
    anamnesiLavorativa: anamnesiLavorativa ?? this.anamnesiLavorativa,
    anamnesiFamiliare: anamnesiFamiliare ?? this.anamnesiFamiliare,
    anamnesiFisiologica: anamnesiFisiologica ?? this.anamnesiFisiologica,
    anamnesiPatologicaRemota:
        anamnesiPatologicaRemota ?? this.anamnesiPatologicaRemota,
    anamnesiPatologicaProssima:
        anamnesiPatologicaProssima ?? this.anamnesiPatologicaProssima,
    esameObiettivo: esameObiettivo ?? this.esameObiettivo,
    accertamentiIntegrativi:
        accertamentiIntegrativi ?? this.accertamentiIntegrativi,
    provvedimentiMedico: provvedimentiMedico.present
        ? provvedimentiMedico.value
        : this.provvedimentiMedico,
    giudizioIdoneita: giudizioIdoneita ?? this.giudizioIdoneita,
    scadenzaVisitaSuccessiva: scadenzaVisitaSuccessiva.present
        ? scadenzaVisitaSuccessiva.value
        : this.scadenzaVisitaSuccessiva,
    dataTrasmissioneLavoratore: dataTrasmissioneLavoratore.present
        ? dataTrasmissioneLavoratore.value
        : this.dataTrasmissioneLavoratore,
    dataTrasmissioneDatore: dataTrasmissioneDatore.present
        ? dataTrasmissioneDatore.value
        : this.dataTrasmissioneDatore,
    malattiaProfSegnalata: malattiaProfSegnalata ?? this.malattiaProfSegnalata,
    tipologiaMalattia: tipologiaMalattia.present
        ? tipologiaMalattia.value
        : this.tipologiaMalattia,
    rMmc: rMmc ?? this.rMmc,
    rSovraccaricoArti: rSovraccaricoArti ?? this.rSovraccaricoArti,
    rPosturali: rPosturali ?? this.rPosturali,
    rChimico: rChimico ?? this.rChimico,
    rCancerogeni: rCancerogeni ?? this.rCancerogeni,
    rMutageni: rMutageni ?? this.rMutageni,
    rAmianto: rAmianto ?? this.rAmianto,
    rSilice: rSilice ?? this.rSilice,
    rBiologico: rBiologico ?? this.rBiologico,
    rVdt: rVdt ?? this.rVdt,
    rVibrazioniCorpo: rVibrazioniCorpo ?? this.rVibrazioniCorpo,
    rVibrazioniMano: rVibrazioniMano ?? this.rVibrazioniMano,
    rRumore: rRumore ?? this.rRumore,
    rCampiElettro: rCampiElettro ?? this.rCampiElettro,
    rRoa: rRoa ?? this.rRoa,
    rUv: rUv ?? this.rUv,
    rMicroclima: rMicroclima ?? this.rMicroclima,
    rInfrasuoni: rInfrasuoni ?? this.rInfrasuoni,
    rAtmosfere: rAtmosfere ?? this.rAtmosfere,
    rNotturno: rNotturno ?? this.rNotturno,
    rRiproduzione: rRiproduzione ?? this.rRiproduzione,
    rAltriRischi: rAltriRischi.present ? rAltriRischi.value : this.rAltriRischi,
    screeningAlcol: screeningAlcol ?? this.screeningAlcol,
    screeningSostanze: screeningSostanze ?? this.screeningSostanze,
    invioSert: invioSert ?? this.invioSert,
    dipendenzaConfermata: dipendenzaConfermata ?? this.dipendenzaConfermata,
  );
  Visita copyWithCompanion(VisiteCompanion data) {
    return Visita(
      id: data.id.present ? data.id.value : this.id,
      lavoratoreId: data.lavoratoreId.present
          ? data.lavoratoreId.value
          : this.lavoratoreId,
      dataVisita: data.dataVisita.present
          ? data.dataVisita.value
          : this.dataVisita,
      tipoVisita: data.tipoVisita.present
          ? data.tipoVisita.value
          : this.tipoVisita,
      reparto: data.reparto.present ? data.reparto.value : this.reparto,
      mansioneSpecifica: data.mansioneSpecifica.present
          ? data.mansioneSpecifica.value
          : this.mansioneSpecifica,
      fattoriRischio3A: data.fattoriRischio3A.present
          ? data.fattoriRischio3A.value
          : this.fattoriRischio3A,
      anamnesiLavorativa: data.anamnesiLavorativa.present
          ? data.anamnesiLavorativa.value
          : this.anamnesiLavorativa,
      anamnesiFamiliare: data.anamnesiFamiliare.present
          ? data.anamnesiFamiliare.value
          : this.anamnesiFamiliare,
      anamnesiFisiologica: data.anamnesiFisiologica.present
          ? data.anamnesiFisiologica.value
          : this.anamnesiFisiologica,
      anamnesiPatologicaRemota: data.anamnesiPatologicaRemota.present
          ? data.anamnesiPatologicaRemota.value
          : this.anamnesiPatologicaRemota,
      anamnesiPatologicaProssima: data.anamnesiPatologicaProssima.present
          ? data.anamnesiPatologicaProssima.value
          : this.anamnesiPatologicaProssima,
      esameObiettivo: data.esameObiettivo.present
          ? data.esameObiettivo.value
          : this.esameObiettivo,
      accertamentiIntegrativi: data.accertamentiIntegrativi.present
          ? data.accertamentiIntegrativi.value
          : this.accertamentiIntegrativi,
      provvedimentiMedico: data.provvedimentiMedico.present
          ? data.provvedimentiMedico.value
          : this.provvedimentiMedico,
      giudizioIdoneita: data.giudizioIdoneita.present
          ? data.giudizioIdoneita.value
          : this.giudizioIdoneita,
      scadenzaVisitaSuccessiva: data.scadenzaVisitaSuccessiva.present
          ? data.scadenzaVisitaSuccessiva.value
          : this.scadenzaVisitaSuccessiva,
      dataTrasmissioneLavoratore: data.dataTrasmissioneLavoratore.present
          ? data.dataTrasmissioneLavoratore.value
          : this.dataTrasmissioneLavoratore,
      dataTrasmissioneDatore: data.dataTrasmissioneDatore.present
          ? data.dataTrasmissioneDatore.value
          : this.dataTrasmissioneDatore,
      malattiaProfSegnalata: data.malattiaProfSegnalata.present
          ? data.malattiaProfSegnalata.value
          : this.malattiaProfSegnalata,
      tipologiaMalattia: data.tipologiaMalattia.present
          ? data.tipologiaMalattia.value
          : this.tipologiaMalattia,
      rMmc: data.rMmc.present ? data.rMmc.value : this.rMmc,
      rSovraccaricoArti: data.rSovraccaricoArti.present
          ? data.rSovraccaricoArti.value
          : this.rSovraccaricoArti,
      rPosturali: data.rPosturali.present
          ? data.rPosturali.value
          : this.rPosturali,
      rChimico: data.rChimico.present ? data.rChimico.value : this.rChimico,
      rCancerogeni: data.rCancerogeni.present
          ? data.rCancerogeni.value
          : this.rCancerogeni,
      rMutageni: data.rMutageni.present ? data.rMutageni.value : this.rMutageni,
      rAmianto: data.rAmianto.present ? data.rAmianto.value : this.rAmianto,
      rSilice: data.rSilice.present ? data.rSilice.value : this.rSilice,
      rBiologico: data.rBiologico.present
          ? data.rBiologico.value
          : this.rBiologico,
      rVdt: data.rVdt.present ? data.rVdt.value : this.rVdt,
      rVibrazioniCorpo: data.rVibrazioniCorpo.present
          ? data.rVibrazioniCorpo.value
          : this.rVibrazioniCorpo,
      rVibrazioniMano: data.rVibrazioniMano.present
          ? data.rVibrazioniMano.value
          : this.rVibrazioniMano,
      rRumore: data.rRumore.present ? data.rRumore.value : this.rRumore,
      rCampiElettro: data.rCampiElettro.present
          ? data.rCampiElettro.value
          : this.rCampiElettro,
      rRoa: data.rRoa.present ? data.rRoa.value : this.rRoa,
      rUv: data.rUv.present ? data.rUv.value : this.rUv,
      rMicroclima: data.rMicroclima.present
          ? data.rMicroclima.value
          : this.rMicroclima,
      rInfrasuoni: data.rInfrasuoni.present
          ? data.rInfrasuoni.value
          : this.rInfrasuoni,
      rAtmosfere: data.rAtmosfere.present
          ? data.rAtmosfere.value
          : this.rAtmosfere,
      rNotturno: data.rNotturno.present ? data.rNotturno.value : this.rNotturno,
      rRiproduzione: data.rRiproduzione.present
          ? data.rRiproduzione.value
          : this.rRiproduzione,
      rAltriRischi: data.rAltriRischi.present
          ? data.rAltriRischi.value
          : this.rAltriRischi,
      screeningAlcol: data.screeningAlcol.present
          ? data.screeningAlcol.value
          : this.screeningAlcol,
      screeningSostanze: data.screeningSostanze.present
          ? data.screeningSostanze.value
          : this.screeningSostanze,
      invioSert: data.invioSert.present ? data.invioSert.value : this.invioSert,
      dipendenzaConfermata: data.dipendenzaConfermata.present
          ? data.dipendenzaConfermata.value
          : this.dipendenzaConfermata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Visita(')
          ..write('id: $id, ')
          ..write('lavoratoreId: $lavoratoreId, ')
          ..write('dataVisita: $dataVisita, ')
          ..write('tipoVisita: $tipoVisita, ')
          ..write('reparto: $reparto, ')
          ..write('mansioneSpecifica: $mansioneSpecifica, ')
          ..write('fattoriRischio3A: $fattoriRischio3A, ')
          ..write('anamnesiLavorativa: $anamnesiLavorativa, ')
          ..write('anamnesiFamiliare: $anamnesiFamiliare, ')
          ..write('anamnesiFisiologica: $anamnesiFisiologica, ')
          ..write('anamnesiPatologicaRemota: $anamnesiPatologicaRemota, ')
          ..write('anamnesiPatologicaProssima: $anamnesiPatologicaProssima, ')
          ..write('esameObiettivo: $esameObiettivo, ')
          ..write('accertamentiIntegrativi: $accertamentiIntegrativi, ')
          ..write('provvedimentiMedico: $provvedimentiMedico, ')
          ..write('giudizioIdoneita: $giudizioIdoneita, ')
          ..write('scadenzaVisitaSuccessiva: $scadenzaVisitaSuccessiva, ')
          ..write('dataTrasmissioneLavoratore: $dataTrasmissioneLavoratore, ')
          ..write('dataTrasmissioneDatore: $dataTrasmissioneDatore, ')
          ..write('malattiaProfSegnalata: $malattiaProfSegnalata, ')
          ..write('tipologiaMalattia: $tipologiaMalattia, ')
          ..write('rMmc: $rMmc, ')
          ..write('rSovraccaricoArti: $rSovraccaricoArti, ')
          ..write('rPosturali: $rPosturali, ')
          ..write('rChimico: $rChimico, ')
          ..write('rCancerogeni: $rCancerogeni, ')
          ..write('rMutageni: $rMutageni, ')
          ..write('rAmianto: $rAmianto, ')
          ..write('rSilice: $rSilice, ')
          ..write('rBiologico: $rBiologico, ')
          ..write('rVdt: $rVdt, ')
          ..write('rVibrazioniCorpo: $rVibrazioniCorpo, ')
          ..write('rVibrazioniMano: $rVibrazioniMano, ')
          ..write('rRumore: $rRumore, ')
          ..write('rCampiElettro: $rCampiElettro, ')
          ..write('rRoa: $rRoa, ')
          ..write('rUv: $rUv, ')
          ..write('rMicroclima: $rMicroclima, ')
          ..write('rInfrasuoni: $rInfrasuoni, ')
          ..write('rAtmosfere: $rAtmosfere, ')
          ..write('rNotturno: $rNotturno, ')
          ..write('rRiproduzione: $rRiproduzione, ')
          ..write('rAltriRischi: $rAltriRischi, ')
          ..write('screeningAlcol: $screeningAlcol, ')
          ..write('screeningSostanze: $screeningSostanze, ')
          ..write('invioSert: $invioSert, ')
          ..write('dipendenzaConfermata: $dipendenzaConfermata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    lavoratoreId,
    dataVisita,
    tipoVisita,
    reparto,
    mansioneSpecifica,
    fattoriRischio3A,
    anamnesiLavorativa,
    anamnesiFamiliare,
    anamnesiFisiologica,
    anamnesiPatologicaRemota,
    anamnesiPatologicaProssima,
    esameObiettivo,
    accertamentiIntegrativi,
    provvedimentiMedico,
    giudizioIdoneita,
    scadenzaVisitaSuccessiva,
    dataTrasmissioneLavoratore,
    dataTrasmissioneDatore,
    malattiaProfSegnalata,
    tipologiaMalattia,
    rMmc,
    rSovraccaricoArti,
    rPosturali,
    rChimico,
    rCancerogeni,
    rMutageni,
    rAmianto,
    rSilice,
    rBiologico,
    rVdt,
    rVibrazioniCorpo,
    rVibrazioniMano,
    rRumore,
    rCampiElettro,
    rRoa,
    rUv,
    rMicroclima,
    rInfrasuoni,
    rAtmosfere,
    rNotturno,
    rRiproduzione,
    rAltriRischi,
    screeningAlcol,
    screeningSostanze,
    invioSert,
    dipendenzaConfermata,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Visita &&
          other.id == this.id &&
          other.lavoratoreId == this.lavoratoreId &&
          other.dataVisita == this.dataVisita &&
          other.tipoVisita == this.tipoVisita &&
          other.reparto == this.reparto &&
          other.mansioneSpecifica == this.mansioneSpecifica &&
          other.fattoriRischio3A == this.fattoriRischio3A &&
          other.anamnesiLavorativa == this.anamnesiLavorativa &&
          other.anamnesiFamiliare == this.anamnesiFamiliare &&
          other.anamnesiFisiologica == this.anamnesiFisiologica &&
          other.anamnesiPatologicaRemota == this.anamnesiPatologicaRemota &&
          other.anamnesiPatologicaProssima == this.anamnesiPatologicaProssima &&
          other.esameObiettivo == this.esameObiettivo &&
          other.accertamentiIntegrativi == this.accertamentiIntegrativi &&
          other.provvedimentiMedico == this.provvedimentiMedico &&
          other.giudizioIdoneita == this.giudizioIdoneita &&
          other.scadenzaVisitaSuccessiva == this.scadenzaVisitaSuccessiva &&
          other.dataTrasmissioneLavoratore == this.dataTrasmissioneLavoratore &&
          other.dataTrasmissioneDatore == this.dataTrasmissioneDatore &&
          other.malattiaProfSegnalata == this.malattiaProfSegnalata &&
          other.tipologiaMalattia == this.tipologiaMalattia &&
          other.rMmc == this.rMmc &&
          other.rSovraccaricoArti == this.rSovraccaricoArti &&
          other.rPosturali == this.rPosturali &&
          other.rChimico == this.rChimico &&
          other.rCancerogeni == this.rCancerogeni &&
          other.rMutageni == this.rMutageni &&
          other.rAmianto == this.rAmianto &&
          other.rSilice == this.rSilice &&
          other.rBiologico == this.rBiologico &&
          other.rVdt == this.rVdt &&
          other.rVibrazioniCorpo == this.rVibrazioniCorpo &&
          other.rVibrazioniMano == this.rVibrazioniMano &&
          other.rRumore == this.rRumore &&
          other.rCampiElettro == this.rCampiElettro &&
          other.rRoa == this.rRoa &&
          other.rUv == this.rUv &&
          other.rMicroclima == this.rMicroclima &&
          other.rInfrasuoni == this.rInfrasuoni &&
          other.rAtmosfere == this.rAtmosfere &&
          other.rNotturno == this.rNotturno &&
          other.rRiproduzione == this.rRiproduzione &&
          other.rAltriRischi == this.rAltriRischi &&
          other.screeningAlcol == this.screeningAlcol &&
          other.screeningSostanze == this.screeningSostanze &&
          other.invioSert == this.invioSert &&
          other.dipendenzaConfermata == this.dipendenzaConfermata);
}

class VisiteCompanion extends UpdateCompanion<Visita> {
  final Value<int> id;
  final Value<int> lavoratoreId;
  final Value<DateTime> dataVisita;
  final Value<int> tipoVisita;
  final Value<String?> reparto;
  final Value<String> mansioneSpecifica;
  final Value<String> fattoriRischio3A;
  final Value<String> anamnesiLavorativa;
  final Value<String> anamnesiFamiliare;
  final Value<String> anamnesiFisiologica;
  final Value<String> anamnesiPatologicaRemota;
  final Value<String> anamnesiPatologicaProssima;
  final Value<String> esameObiettivo;
  final Value<String> accertamentiIntegrativi;
  final Value<String?> provvedimentiMedico;
  final Value<int> giudizioIdoneita;
  final Value<DateTime?> scadenzaVisitaSuccessiva;
  final Value<DateTime?> dataTrasmissioneLavoratore;
  final Value<DateTime?> dataTrasmissioneDatore;
  final Value<bool> malattiaProfSegnalata;
  final Value<String?> tipologiaMalattia;
  final Value<bool> rMmc;
  final Value<bool> rSovraccaricoArti;
  final Value<bool> rPosturali;
  final Value<bool> rChimico;
  final Value<bool> rCancerogeni;
  final Value<bool> rMutageni;
  final Value<bool> rAmianto;
  final Value<bool> rSilice;
  final Value<bool> rBiologico;
  final Value<bool> rVdt;
  final Value<bool> rVibrazioniCorpo;
  final Value<bool> rVibrazioniMano;
  final Value<bool> rRumore;
  final Value<bool> rCampiElettro;
  final Value<bool> rRoa;
  final Value<bool> rUv;
  final Value<bool> rMicroclima;
  final Value<bool> rInfrasuoni;
  final Value<bool> rAtmosfere;
  final Value<bool> rNotturno;
  final Value<bool> rRiproduzione;
  final Value<String?> rAltriRischi;
  final Value<bool> screeningAlcol;
  final Value<bool> screeningSostanze;
  final Value<bool> invioSert;
  final Value<bool> dipendenzaConfermata;
  const VisiteCompanion({
    this.id = const Value.absent(),
    this.lavoratoreId = const Value.absent(),
    this.dataVisita = const Value.absent(),
    this.tipoVisita = const Value.absent(),
    this.reparto = const Value.absent(),
    this.mansioneSpecifica = const Value.absent(),
    this.fattoriRischio3A = const Value.absent(),
    this.anamnesiLavorativa = const Value.absent(),
    this.anamnesiFamiliare = const Value.absent(),
    this.anamnesiFisiologica = const Value.absent(),
    this.anamnesiPatologicaRemota = const Value.absent(),
    this.anamnesiPatologicaProssima = const Value.absent(),
    this.esameObiettivo = const Value.absent(),
    this.accertamentiIntegrativi = const Value.absent(),
    this.provvedimentiMedico = const Value.absent(),
    this.giudizioIdoneita = const Value.absent(),
    this.scadenzaVisitaSuccessiva = const Value.absent(),
    this.dataTrasmissioneLavoratore = const Value.absent(),
    this.dataTrasmissioneDatore = const Value.absent(),
    this.malattiaProfSegnalata = const Value.absent(),
    this.tipologiaMalattia = const Value.absent(),
    this.rMmc = const Value.absent(),
    this.rSovraccaricoArti = const Value.absent(),
    this.rPosturali = const Value.absent(),
    this.rChimico = const Value.absent(),
    this.rCancerogeni = const Value.absent(),
    this.rMutageni = const Value.absent(),
    this.rAmianto = const Value.absent(),
    this.rSilice = const Value.absent(),
    this.rBiologico = const Value.absent(),
    this.rVdt = const Value.absent(),
    this.rVibrazioniCorpo = const Value.absent(),
    this.rVibrazioniMano = const Value.absent(),
    this.rRumore = const Value.absent(),
    this.rCampiElettro = const Value.absent(),
    this.rRoa = const Value.absent(),
    this.rUv = const Value.absent(),
    this.rMicroclima = const Value.absent(),
    this.rInfrasuoni = const Value.absent(),
    this.rAtmosfere = const Value.absent(),
    this.rNotturno = const Value.absent(),
    this.rRiproduzione = const Value.absent(),
    this.rAltriRischi = const Value.absent(),
    this.screeningAlcol = const Value.absent(),
    this.screeningSostanze = const Value.absent(),
    this.invioSert = const Value.absent(),
    this.dipendenzaConfermata = const Value.absent(),
  });
  VisiteCompanion.insert({
    this.id = const Value.absent(),
    required int lavoratoreId,
    required DateTime dataVisita,
    required int tipoVisita,
    this.reparto = const Value.absent(),
    required String mansioneSpecifica,
    required String fattoriRischio3A,
    required String anamnesiLavorativa,
    required String anamnesiFamiliare,
    required String anamnesiFisiologica,
    required String anamnesiPatologicaRemota,
    required String anamnesiPatologicaProssima,
    required String esameObiettivo,
    required String accertamentiIntegrativi,
    this.provvedimentiMedico = const Value.absent(),
    required int giudizioIdoneita,
    this.scadenzaVisitaSuccessiva = const Value.absent(),
    this.dataTrasmissioneLavoratore = const Value.absent(),
    this.dataTrasmissioneDatore = const Value.absent(),
    this.malattiaProfSegnalata = const Value.absent(),
    this.tipologiaMalattia = const Value.absent(),
    this.rMmc = const Value.absent(),
    this.rSovraccaricoArti = const Value.absent(),
    this.rPosturali = const Value.absent(),
    this.rChimico = const Value.absent(),
    this.rCancerogeni = const Value.absent(),
    this.rMutageni = const Value.absent(),
    this.rAmianto = const Value.absent(),
    this.rSilice = const Value.absent(),
    this.rBiologico = const Value.absent(),
    this.rVdt = const Value.absent(),
    this.rVibrazioniCorpo = const Value.absent(),
    this.rVibrazioniMano = const Value.absent(),
    this.rRumore = const Value.absent(),
    this.rCampiElettro = const Value.absent(),
    this.rRoa = const Value.absent(),
    this.rUv = const Value.absent(),
    this.rMicroclima = const Value.absent(),
    this.rInfrasuoni = const Value.absent(),
    this.rAtmosfere = const Value.absent(),
    this.rNotturno = const Value.absent(),
    this.rRiproduzione = const Value.absent(),
    this.rAltriRischi = const Value.absent(),
    this.screeningAlcol = const Value.absent(),
    this.screeningSostanze = const Value.absent(),
    this.invioSert = const Value.absent(),
    this.dipendenzaConfermata = const Value.absent(),
  }) : lavoratoreId = Value(lavoratoreId),
       dataVisita = Value(dataVisita),
       tipoVisita = Value(tipoVisita),
       mansioneSpecifica = Value(mansioneSpecifica),
       fattoriRischio3A = Value(fattoriRischio3A),
       anamnesiLavorativa = Value(anamnesiLavorativa),
       anamnesiFamiliare = Value(anamnesiFamiliare),
       anamnesiFisiologica = Value(anamnesiFisiologica),
       anamnesiPatologicaRemota = Value(anamnesiPatologicaRemota),
       anamnesiPatologicaProssima = Value(anamnesiPatologicaProssima),
       esameObiettivo = Value(esameObiettivo),
       accertamentiIntegrativi = Value(accertamentiIntegrativi),
       giudizioIdoneita = Value(giudizioIdoneita);
  static Insertable<Visita> custom({
    Expression<int>? id,
    Expression<int>? lavoratoreId,
    Expression<DateTime>? dataVisita,
    Expression<int>? tipoVisita,
    Expression<String>? reparto,
    Expression<String>? mansioneSpecifica,
    Expression<String>? fattoriRischio3A,
    Expression<String>? anamnesiLavorativa,
    Expression<String>? anamnesiFamiliare,
    Expression<String>? anamnesiFisiologica,
    Expression<String>? anamnesiPatologicaRemota,
    Expression<String>? anamnesiPatologicaProssima,
    Expression<String>? esameObiettivo,
    Expression<String>? accertamentiIntegrativi,
    Expression<String>? provvedimentiMedico,
    Expression<int>? giudizioIdoneita,
    Expression<DateTime>? scadenzaVisitaSuccessiva,
    Expression<DateTime>? dataTrasmissioneLavoratore,
    Expression<DateTime>? dataTrasmissioneDatore,
    Expression<bool>? malattiaProfSegnalata,
    Expression<String>? tipologiaMalattia,
    Expression<bool>? rMmc,
    Expression<bool>? rSovraccaricoArti,
    Expression<bool>? rPosturali,
    Expression<bool>? rChimico,
    Expression<bool>? rCancerogeni,
    Expression<bool>? rMutageni,
    Expression<bool>? rAmianto,
    Expression<bool>? rSilice,
    Expression<bool>? rBiologico,
    Expression<bool>? rVdt,
    Expression<bool>? rVibrazioniCorpo,
    Expression<bool>? rVibrazioniMano,
    Expression<bool>? rRumore,
    Expression<bool>? rCampiElettro,
    Expression<bool>? rRoa,
    Expression<bool>? rUv,
    Expression<bool>? rMicroclima,
    Expression<bool>? rInfrasuoni,
    Expression<bool>? rAtmosfere,
    Expression<bool>? rNotturno,
    Expression<bool>? rRiproduzione,
    Expression<String>? rAltriRischi,
    Expression<bool>? screeningAlcol,
    Expression<bool>? screeningSostanze,
    Expression<bool>? invioSert,
    Expression<bool>? dipendenzaConfermata,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lavoratoreId != null) 'lavoratore_id': lavoratoreId,
      if (dataVisita != null) 'data_visita': dataVisita,
      if (tipoVisita != null) 'tipo_visita': tipoVisita,
      if (reparto != null) 'reparto': reparto,
      if (mansioneSpecifica != null) 'mansione_specifica': mansioneSpecifica,
      if (fattoriRischio3A != null) 'fattori_rischio3_a': fattoriRischio3A,
      if (anamnesiLavorativa != null) 'anamnesi_lavorativa': anamnesiLavorativa,
      if (anamnesiFamiliare != null) 'anamnesi_familiare': anamnesiFamiliare,
      if (anamnesiFisiologica != null)
        'anamnesi_fisiologica': anamnesiFisiologica,
      if (anamnesiPatologicaRemota != null)
        'anamnesi_patologica_remota': anamnesiPatologicaRemota,
      if (anamnesiPatologicaProssima != null)
        'anamnesi_patologica_prossima': anamnesiPatologicaProssima,
      if (esameObiettivo != null) 'esame_obiettivo': esameObiettivo,
      if (accertamentiIntegrativi != null)
        'accertamenti_integrativi': accertamentiIntegrativi,
      if (provvedimentiMedico != null)
        'provvedimenti_medico': provvedimentiMedico,
      if (giudizioIdoneita != null) 'giudizio_idoneita': giudizioIdoneita,
      if (scadenzaVisitaSuccessiva != null)
        'scadenza_visita_successiva': scadenzaVisitaSuccessiva,
      if (dataTrasmissioneLavoratore != null)
        'data_trasmissione_lavoratore': dataTrasmissioneLavoratore,
      if (dataTrasmissioneDatore != null)
        'data_trasmissione_datore': dataTrasmissioneDatore,
      if (malattiaProfSegnalata != null)
        'malattia_prof_segnalata': malattiaProfSegnalata,
      if (tipologiaMalattia != null) 'tipologia_malattia': tipologiaMalattia,
      if (rMmc != null) 'r_mmc': rMmc,
      if (rSovraccaricoArti != null) 'r_sovraccarico_arti': rSovraccaricoArti,
      if (rPosturali != null) 'r_posturali': rPosturali,
      if (rChimico != null) 'r_chimico': rChimico,
      if (rCancerogeni != null) 'r_cancerogeni': rCancerogeni,
      if (rMutageni != null) 'r_mutageni': rMutageni,
      if (rAmianto != null) 'r_amianto': rAmianto,
      if (rSilice != null) 'r_silice': rSilice,
      if (rBiologico != null) 'r_biologico': rBiologico,
      if (rVdt != null) 'r_vdt': rVdt,
      if (rVibrazioniCorpo != null) 'r_vibrazioni_corpo': rVibrazioniCorpo,
      if (rVibrazioniMano != null) 'r_vibrazioni_mano': rVibrazioniMano,
      if (rRumore != null) 'r_rumore': rRumore,
      if (rCampiElettro != null) 'r_campi_elettro': rCampiElettro,
      if (rRoa != null) 'r_roa': rRoa,
      if (rUv != null) 'r_uv': rUv,
      if (rMicroclima != null) 'r_microclima': rMicroclima,
      if (rInfrasuoni != null) 'r_infrasuoni': rInfrasuoni,
      if (rAtmosfere != null) 'r_atmosfere': rAtmosfere,
      if (rNotturno != null) 'r_notturno': rNotturno,
      if (rRiproduzione != null) 'r_riproduzione': rRiproduzione,
      if (rAltriRischi != null) 'r_altri_rischi': rAltriRischi,
      if (screeningAlcol != null) 'screening_alcol': screeningAlcol,
      if (screeningSostanze != null) 'screening_sostanze': screeningSostanze,
      if (invioSert != null) 'invio_sert': invioSert,
      if (dipendenzaConfermata != null)
        'dipendenza_confermata': dipendenzaConfermata,
    });
  }

  VisiteCompanion copyWith({
    Value<int>? id,
    Value<int>? lavoratoreId,
    Value<DateTime>? dataVisita,
    Value<int>? tipoVisita,
    Value<String?>? reparto,
    Value<String>? mansioneSpecifica,
    Value<String>? fattoriRischio3A,
    Value<String>? anamnesiLavorativa,
    Value<String>? anamnesiFamiliare,
    Value<String>? anamnesiFisiologica,
    Value<String>? anamnesiPatologicaRemota,
    Value<String>? anamnesiPatologicaProssima,
    Value<String>? esameObiettivo,
    Value<String>? accertamentiIntegrativi,
    Value<String?>? provvedimentiMedico,
    Value<int>? giudizioIdoneita,
    Value<DateTime?>? scadenzaVisitaSuccessiva,
    Value<DateTime?>? dataTrasmissioneLavoratore,
    Value<DateTime?>? dataTrasmissioneDatore,
    Value<bool>? malattiaProfSegnalata,
    Value<String?>? tipologiaMalattia,
    Value<bool>? rMmc,
    Value<bool>? rSovraccaricoArti,
    Value<bool>? rPosturali,
    Value<bool>? rChimico,
    Value<bool>? rCancerogeni,
    Value<bool>? rMutageni,
    Value<bool>? rAmianto,
    Value<bool>? rSilice,
    Value<bool>? rBiologico,
    Value<bool>? rVdt,
    Value<bool>? rVibrazioniCorpo,
    Value<bool>? rVibrazioniMano,
    Value<bool>? rRumore,
    Value<bool>? rCampiElettro,
    Value<bool>? rRoa,
    Value<bool>? rUv,
    Value<bool>? rMicroclima,
    Value<bool>? rInfrasuoni,
    Value<bool>? rAtmosfere,
    Value<bool>? rNotturno,
    Value<bool>? rRiproduzione,
    Value<String?>? rAltriRischi,
    Value<bool>? screeningAlcol,
    Value<bool>? screeningSostanze,
    Value<bool>? invioSert,
    Value<bool>? dipendenzaConfermata,
  }) {
    return VisiteCompanion(
      id: id ?? this.id,
      lavoratoreId: lavoratoreId ?? this.lavoratoreId,
      dataVisita: dataVisita ?? this.dataVisita,
      tipoVisita: tipoVisita ?? this.tipoVisita,
      reparto: reparto ?? this.reparto,
      mansioneSpecifica: mansioneSpecifica ?? this.mansioneSpecifica,
      fattoriRischio3A: fattoriRischio3A ?? this.fattoriRischio3A,
      anamnesiLavorativa: anamnesiLavorativa ?? this.anamnesiLavorativa,
      anamnesiFamiliare: anamnesiFamiliare ?? this.anamnesiFamiliare,
      anamnesiFisiologica: anamnesiFisiologica ?? this.anamnesiFisiologica,
      anamnesiPatologicaRemota:
          anamnesiPatologicaRemota ?? this.anamnesiPatologicaRemota,
      anamnesiPatologicaProssima:
          anamnesiPatologicaProssima ?? this.anamnesiPatologicaProssima,
      esameObiettivo: esameObiettivo ?? this.esameObiettivo,
      accertamentiIntegrativi:
          accertamentiIntegrativi ?? this.accertamentiIntegrativi,
      provvedimentiMedico: provvedimentiMedico ?? this.provvedimentiMedico,
      giudizioIdoneita: giudizioIdoneita ?? this.giudizioIdoneita,
      scadenzaVisitaSuccessiva:
          scadenzaVisitaSuccessiva ?? this.scadenzaVisitaSuccessiva,
      dataTrasmissioneLavoratore:
          dataTrasmissioneLavoratore ?? this.dataTrasmissioneLavoratore,
      dataTrasmissioneDatore:
          dataTrasmissioneDatore ?? this.dataTrasmissioneDatore,
      malattiaProfSegnalata:
          malattiaProfSegnalata ?? this.malattiaProfSegnalata,
      tipologiaMalattia: tipologiaMalattia ?? this.tipologiaMalattia,
      rMmc: rMmc ?? this.rMmc,
      rSovraccaricoArti: rSovraccaricoArti ?? this.rSovraccaricoArti,
      rPosturali: rPosturali ?? this.rPosturali,
      rChimico: rChimico ?? this.rChimico,
      rCancerogeni: rCancerogeni ?? this.rCancerogeni,
      rMutageni: rMutageni ?? this.rMutageni,
      rAmianto: rAmianto ?? this.rAmianto,
      rSilice: rSilice ?? this.rSilice,
      rBiologico: rBiologico ?? this.rBiologico,
      rVdt: rVdt ?? this.rVdt,
      rVibrazioniCorpo: rVibrazioniCorpo ?? this.rVibrazioniCorpo,
      rVibrazioniMano: rVibrazioniMano ?? this.rVibrazioniMano,
      rRumore: rRumore ?? this.rRumore,
      rCampiElettro: rCampiElettro ?? this.rCampiElettro,
      rRoa: rRoa ?? this.rRoa,
      rUv: rUv ?? this.rUv,
      rMicroclima: rMicroclima ?? this.rMicroclima,
      rInfrasuoni: rInfrasuoni ?? this.rInfrasuoni,
      rAtmosfere: rAtmosfere ?? this.rAtmosfere,
      rNotturno: rNotturno ?? this.rNotturno,
      rRiproduzione: rRiproduzione ?? this.rRiproduzione,
      rAltriRischi: rAltriRischi ?? this.rAltriRischi,
      screeningAlcol: screeningAlcol ?? this.screeningAlcol,
      screeningSostanze: screeningSostanze ?? this.screeningSostanze,
      invioSert: invioSert ?? this.invioSert,
      dipendenzaConfermata: dipendenzaConfermata ?? this.dipendenzaConfermata,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lavoratoreId.present) {
      map['lavoratore_id'] = Variable<int>(lavoratoreId.value);
    }
    if (dataVisita.present) {
      map['data_visita'] = Variable<DateTime>(dataVisita.value);
    }
    if (tipoVisita.present) {
      map['tipo_visita'] = Variable<int>(tipoVisita.value);
    }
    if (reparto.present) {
      map['reparto'] = Variable<String>(reparto.value);
    }
    if (mansioneSpecifica.present) {
      map['mansione_specifica'] = Variable<String>(mansioneSpecifica.value);
    }
    if (fattoriRischio3A.present) {
      map['fattori_rischio3_a'] = Variable<String>(fattoriRischio3A.value);
    }
    if (anamnesiLavorativa.present) {
      map['anamnesi_lavorativa'] = Variable<String>(anamnesiLavorativa.value);
    }
    if (anamnesiFamiliare.present) {
      map['anamnesi_familiare'] = Variable<String>(anamnesiFamiliare.value);
    }
    if (anamnesiFisiologica.present) {
      map['anamnesi_fisiologica'] = Variable<String>(anamnesiFisiologica.value);
    }
    if (anamnesiPatologicaRemota.present) {
      map['anamnesi_patologica_remota'] = Variable<String>(
        anamnesiPatologicaRemota.value,
      );
    }
    if (anamnesiPatologicaProssima.present) {
      map['anamnesi_patologica_prossima'] = Variable<String>(
        anamnesiPatologicaProssima.value,
      );
    }
    if (esameObiettivo.present) {
      map['esame_obiettivo'] = Variable<String>(esameObiettivo.value);
    }
    if (accertamentiIntegrativi.present) {
      map['accertamenti_integrativi'] = Variable<String>(
        accertamentiIntegrativi.value,
      );
    }
    if (provvedimentiMedico.present) {
      map['provvedimenti_medico'] = Variable<String>(provvedimentiMedico.value);
    }
    if (giudizioIdoneita.present) {
      map['giudizio_idoneita'] = Variable<int>(giudizioIdoneita.value);
    }
    if (scadenzaVisitaSuccessiva.present) {
      map['scadenza_visita_successiva'] = Variable<DateTime>(
        scadenzaVisitaSuccessiva.value,
      );
    }
    if (dataTrasmissioneLavoratore.present) {
      map['data_trasmissione_lavoratore'] = Variable<DateTime>(
        dataTrasmissioneLavoratore.value,
      );
    }
    if (dataTrasmissioneDatore.present) {
      map['data_trasmissione_datore'] = Variable<DateTime>(
        dataTrasmissioneDatore.value,
      );
    }
    if (malattiaProfSegnalata.present) {
      map['malattia_prof_segnalata'] = Variable<bool>(
        malattiaProfSegnalata.value,
      );
    }
    if (tipologiaMalattia.present) {
      map['tipologia_malattia'] = Variable<String>(tipologiaMalattia.value);
    }
    if (rMmc.present) {
      map['r_mmc'] = Variable<bool>(rMmc.value);
    }
    if (rSovraccaricoArti.present) {
      map['r_sovraccarico_arti'] = Variable<bool>(rSovraccaricoArti.value);
    }
    if (rPosturali.present) {
      map['r_posturali'] = Variable<bool>(rPosturali.value);
    }
    if (rChimico.present) {
      map['r_chimico'] = Variable<bool>(rChimico.value);
    }
    if (rCancerogeni.present) {
      map['r_cancerogeni'] = Variable<bool>(rCancerogeni.value);
    }
    if (rMutageni.present) {
      map['r_mutageni'] = Variable<bool>(rMutageni.value);
    }
    if (rAmianto.present) {
      map['r_amianto'] = Variable<bool>(rAmianto.value);
    }
    if (rSilice.present) {
      map['r_silice'] = Variable<bool>(rSilice.value);
    }
    if (rBiologico.present) {
      map['r_biologico'] = Variable<bool>(rBiologico.value);
    }
    if (rVdt.present) {
      map['r_vdt'] = Variable<bool>(rVdt.value);
    }
    if (rVibrazioniCorpo.present) {
      map['r_vibrazioni_corpo'] = Variable<bool>(rVibrazioniCorpo.value);
    }
    if (rVibrazioniMano.present) {
      map['r_vibrazioni_mano'] = Variable<bool>(rVibrazioniMano.value);
    }
    if (rRumore.present) {
      map['r_rumore'] = Variable<bool>(rRumore.value);
    }
    if (rCampiElettro.present) {
      map['r_campi_elettro'] = Variable<bool>(rCampiElettro.value);
    }
    if (rRoa.present) {
      map['r_roa'] = Variable<bool>(rRoa.value);
    }
    if (rUv.present) {
      map['r_uv'] = Variable<bool>(rUv.value);
    }
    if (rMicroclima.present) {
      map['r_microclima'] = Variable<bool>(rMicroclima.value);
    }
    if (rInfrasuoni.present) {
      map['r_infrasuoni'] = Variable<bool>(rInfrasuoni.value);
    }
    if (rAtmosfere.present) {
      map['r_atmosfere'] = Variable<bool>(rAtmosfere.value);
    }
    if (rNotturno.present) {
      map['r_notturno'] = Variable<bool>(rNotturno.value);
    }
    if (rRiproduzione.present) {
      map['r_riproduzione'] = Variable<bool>(rRiproduzione.value);
    }
    if (rAltriRischi.present) {
      map['r_altri_rischi'] = Variable<String>(rAltriRischi.value);
    }
    if (screeningAlcol.present) {
      map['screening_alcol'] = Variable<bool>(screeningAlcol.value);
    }
    if (screeningSostanze.present) {
      map['screening_sostanze'] = Variable<bool>(screeningSostanze.value);
    }
    if (invioSert.present) {
      map['invio_sert'] = Variable<bool>(invioSert.value);
    }
    if (dipendenzaConfermata.present) {
      map['dipendenza_confermata'] = Variable<bool>(dipendenzaConfermata.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisiteCompanion(')
          ..write('id: $id, ')
          ..write('lavoratoreId: $lavoratoreId, ')
          ..write('dataVisita: $dataVisita, ')
          ..write('tipoVisita: $tipoVisita, ')
          ..write('reparto: $reparto, ')
          ..write('mansioneSpecifica: $mansioneSpecifica, ')
          ..write('fattoriRischio3A: $fattoriRischio3A, ')
          ..write('anamnesiLavorativa: $anamnesiLavorativa, ')
          ..write('anamnesiFamiliare: $anamnesiFamiliare, ')
          ..write('anamnesiFisiologica: $anamnesiFisiologica, ')
          ..write('anamnesiPatologicaRemota: $anamnesiPatologicaRemota, ')
          ..write('anamnesiPatologicaProssima: $anamnesiPatologicaProssima, ')
          ..write('esameObiettivo: $esameObiettivo, ')
          ..write('accertamentiIntegrativi: $accertamentiIntegrativi, ')
          ..write('provvedimentiMedico: $provvedimentiMedico, ')
          ..write('giudizioIdoneita: $giudizioIdoneita, ')
          ..write('scadenzaVisitaSuccessiva: $scadenzaVisitaSuccessiva, ')
          ..write('dataTrasmissioneLavoratore: $dataTrasmissioneLavoratore, ')
          ..write('dataTrasmissioneDatore: $dataTrasmissioneDatore, ')
          ..write('malattiaProfSegnalata: $malattiaProfSegnalata, ')
          ..write('tipologiaMalattia: $tipologiaMalattia, ')
          ..write('rMmc: $rMmc, ')
          ..write('rSovraccaricoArti: $rSovraccaricoArti, ')
          ..write('rPosturali: $rPosturali, ')
          ..write('rChimico: $rChimico, ')
          ..write('rCancerogeni: $rCancerogeni, ')
          ..write('rMutageni: $rMutageni, ')
          ..write('rAmianto: $rAmianto, ')
          ..write('rSilice: $rSilice, ')
          ..write('rBiologico: $rBiologico, ')
          ..write('rVdt: $rVdt, ')
          ..write('rVibrazioniCorpo: $rVibrazioniCorpo, ')
          ..write('rVibrazioniMano: $rVibrazioniMano, ')
          ..write('rRumore: $rRumore, ')
          ..write('rCampiElettro: $rCampiElettro, ')
          ..write('rRoa: $rRoa, ')
          ..write('rUv: $rUv, ')
          ..write('rMicroclima: $rMicroclima, ')
          ..write('rInfrasuoni: $rInfrasuoni, ')
          ..write('rAtmosfere: $rAtmosfere, ')
          ..write('rNotturno: $rNotturno, ')
          ..write('rRiproduzione: $rRiproduzione, ')
          ..write('rAltriRischi: $rAltriRischi, ')
          ..write('screeningAlcol: $screeningAlcol, ')
          ..write('screeningSostanze: $screeningSostanze, ')
          ..write('invioSert: $invioSert, ')
          ..write('dipendenzaConfermata: $dipendenzaConfermata')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AziendeTable aziende = $AziendeTable(this);
  late final $LavoratoriTable lavoratori = $LavoratoriTable(this);
  late final $VisiteTable visite = $VisiteTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    aziende,
    lavoratori,
    visite,
  ];
}

typedef $$AziendeTableCreateCompanionBuilder =
    AziendeCompanion Function({
      Value<int> id,
      required String ragioneSociale,
      required String partitaIvaCf,
      required String codiceFiscaleSocieta,
      required String indirizzoSedeLegale,
      required String denominazioneUnitaProduttiva,
      required String indirizzoUnitaProduttiva,
      required String codiceAteco,
      Value<int> occupati3006Maschi,
      Value<int> occupati3006Femmine,
      Value<int> occupati3112Maschi,
      Value<int> occupati3112Femmine,
    });
typedef $$AziendeTableUpdateCompanionBuilder =
    AziendeCompanion Function({
      Value<int> id,
      Value<String> ragioneSociale,
      Value<String> partitaIvaCf,
      Value<String> codiceFiscaleSocieta,
      Value<String> indirizzoSedeLegale,
      Value<String> denominazioneUnitaProduttiva,
      Value<String> indirizzoUnitaProduttiva,
      Value<String> codiceAteco,
      Value<int> occupati3006Maschi,
      Value<int> occupati3006Femmine,
      Value<int> occupati3112Maschi,
      Value<int> occupati3112Femmine,
    });

final class $$AziendeTableReferences
    extends BaseReferences<_$AppDatabase, $AziendeTable, Azienda> {
  $$AziendeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LavoratoriTable, List<Lavoratore>>
  _lavoratoriRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lavoratori,
    aliasName: $_aliasNameGenerator(db.aziende.id, db.lavoratori.aziendaId),
  );

  $$LavoratoriTableProcessedTableManager get lavoratoriRefs {
    final manager = $$LavoratoriTableTableManager(
      $_db,
      $_db.lavoratori,
    ).filter((f) => f.aziendaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_lavoratoriRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AziendeTableFilterComposer
    extends Composer<_$AppDatabase, $AziendeTable> {
  $$AziendeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ragioneSociale => $composableBuilder(
    column: $table.ragioneSociale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partitaIvaCf => $composableBuilder(
    column: $table.partitaIvaCf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codiceFiscaleSocieta => $composableBuilder(
    column: $table.codiceFiscaleSocieta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get indirizzoSedeLegale => $composableBuilder(
    column: $table.indirizzoSedeLegale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get denominazioneUnitaProduttiva => $composableBuilder(
    column: $table.denominazioneUnitaProduttiva,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get indirizzoUnitaProduttiva => $composableBuilder(
    column: $table.indirizzoUnitaProduttiva,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codiceAteco => $composableBuilder(
    column: $table.codiceAteco,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get occupati3006Maschi => $composableBuilder(
    column: $table.occupati3006Maschi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get occupati3006Femmine => $composableBuilder(
    column: $table.occupati3006Femmine,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get occupati3112Maschi => $composableBuilder(
    column: $table.occupati3112Maschi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get occupati3112Femmine => $composableBuilder(
    column: $table.occupati3112Femmine,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> lavoratoriRefs(
    Expression<bool> Function($$LavoratoriTableFilterComposer f) f,
  ) {
    final $$LavoratoriTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lavoratori,
      getReferencedColumn: (t) => t.aziendaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LavoratoriTableFilterComposer(
            $db: $db,
            $table: $db.lavoratori,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AziendeTableOrderingComposer
    extends Composer<_$AppDatabase, $AziendeTable> {
  $$AziendeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ragioneSociale => $composableBuilder(
    column: $table.ragioneSociale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partitaIvaCf => $composableBuilder(
    column: $table.partitaIvaCf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codiceFiscaleSocieta => $composableBuilder(
    column: $table.codiceFiscaleSocieta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get indirizzoSedeLegale => $composableBuilder(
    column: $table.indirizzoSedeLegale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get denominazioneUnitaProduttiva =>
      $composableBuilder(
        column: $table.denominazioneUnitaProduttiva,
        builder: (column) => ColumnOrderings(column),
      );

  ColumnOrderings<String> get indirizzoUnitaProduttiva => $composableBuilder(
    column: $table.indirizzoUnitaProduttiva,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codiceAteco => $composableBuilder(
    column: $table.codiceAteco,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occupati3006Maschi => $composableBuilder(
    column: $table.occupati3006Maschi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occupati3006Femmine => $composableBuilder(
    column: $table.occupati3006Femmine,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occupati3112Maschi => $composableBuilder(
    column: $table.occupati3112Maschi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occupati3112Femmine => $composableBuilder(
    column: $table.occupati3112Femmine,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AziendeTableAnnotationComposer
    extends Composer<_$AppDatabase, $AziendeTable> {
  $$AziendeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ragioneSociale => $composableBuilder(
    column: $table.ragioneSociale,
    builder: (column) => column,
  );

  GeneratedColumn<String> get partitaIvaCf => $composableBuilder(
    column: $table.partitaIvaCf,
    builder: (column) => column,
  );

  GeneratedColumn<String> get codiceFiscaleSocieta => $composableBuilder(
    column: $table.codiceFiscaleSocieta,
    builder: (column) => column,
  );

  GeneratedColumn<String> get indirizzoSedeLegale => $composableBuilder(
    column: $table.indirizzoSedeLegale,
    builder: (column) => column,
  );

  GeneratedColumn<String> get denominazioneUnitaProduttiva =>
      $composableBuilder(
        column: $table.denominazioneUnitaProduttiva,
        builder: (column) => column,
      );

  GeneratedColumn<String> get indirizzoUnitaProduttiva => $composableBuilder(
    column: $table.indirizzoUnitaProduttiva,
    builder: (column) => column,
  );

  GeneratedColumn<String> get codiceAteco => $composableBuilder(
    column: $table.codiceAteco,
    builder: (column) => column,
  );

  GeneratedColumn<int> get occupati3006Maschi => $composableBuilder(
    column: $table.occupati3006Maschi,
    builder: (column) => column,
  );

  GeneratedColumn<int> get occupati3006Femmine => $composableBuilder(
    column: $table.occupati3006Femmine,
    builder: (column) => column,
  );

  GeneratedColumn<int> get occupati3112Maschi => $composableBuilder(
    column: $table.occupati3112Maschi,
    builder: (column) => column,
  );

  GeneratedColumn<int> get occupati3112Femmine => $composableBuilder(
    column: $table.occupati3112Femmine,
    builder: (column) => column,
  );

  Expression<T> lavoratoriRefs<T extends Object>(
    Expression<T> Function($$LavoratoriTableAnnotationComposer a) f,
  ) {
    final $$LavoratoriTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lavoratori,
      getReferencedColumn: (t) => t.aziendaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LavoratoriTableAnnotationComposer(
            $db: $db,
            $table: $db.lavoratori,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AziendeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AziendeTable,
          Azienda,
          $$AziendeTableFilterComposer,
          $$AziendeTableOrderingComposer,
          $$AziendeTableAnnotationComposer,
          $$AziendeTableCreateCompanionBuilder,
          $$AziendeTableUpdateCompanionBuilder,
          (Azienda, $$AziendeTableReferences),
          Azienda,
          PrefetchHooks Function({bool lavoratoriRefs})
        > {
  $$AziendeTableTableManager(_$AppDatabase db, $AziendeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AziendeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AziendeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AziendeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> ragioneSociale = const Value.absent(),
                Value<String> partitaIvaCf = const Value.absent(),
                Value<String> codiceFiscaleSocieta = const Value.absent(),
                Value<String> indirizzoSedeLegale = const Value.absent(),
                Value<String> denominazioneUnitaProduttiva =
                    const Value.absent(),
                Value<String> indirizzoUnitaProduttiva = const Value.absent(),
                Value<String> codiceAteco = const Value.absent(),
                Value<int> occupati3006Maschi = const Value.absent(),
                Value<int> occupati3006Femmine = const Value.absent(),
                Value<int> occupati3112Maschi = const Value.absent(),
                Value<int> occupati3112Femmine = const Value.absent(),
              }) => AziendeCompanion(
                id: id,
                ragioneSociale: ragioneSociale,
                partitaIvaCf: partitaIvaCf,
                codiceFiscaleSocieta: codiceFiscaleSocieta,
                indirizzoSedeLegale: indirizzoSedeLegale,
                denominazioneUnitaProduttiva: denominazioneUnitaProduttiva,
                indirizzoUnitaProduttiva: indirizzoUnitaProduttiva,
                codiceAteco: codiceAteco,
                occupati3006Maschi: occupati3006Maschi,
                occupati3006Femmine: occupati3006Femmine,
                occupati3112Maschi: occupati3112Maschi,
                occupati3112Femmine: occupati3112Femmine,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String ragioneSociale,
                required String partitaIvaCf,
                required String codiceFiscaleSocieta,
                required String indirizzoSedeLegale,
                required String denominazioneUnitaProduttiva,
                required String indirizzoUnitaProduttiva,
                required String codiceAteco,
                Value<int> occupati3006Maschi = const Value.absent(),
                Value<int> occupati3006Femmine = const Value.absent(),
                Value<int> occupati3112Maschi = const Value.absent(),
                Value<int> occupati3112Femmine = const Value.absent(),
              }) => AziendeCompanion.insert(
                id: id,
                ragioneSociale: ragioneSociale,
                partitaIvaCf: partitaIvaCf,
                codiceFiscaleSocieta: codiceFiscaleSocieta,
                indirizzoSedeLegale: indirizzoSedeLegale,
                denominazioneUnitaProduttiva: denominazioneUnitaProduttiva,
                indirizzoUnitaProduttiva: indirizzoUnitaProduttiva,
                codiceAteco: codiceAteco,
                occupati3006Maschi: occupati3006Maschi,
                occupati3006Femmine: occupati3006Femmine,
                occupati3112Maschi: occupati3112Maschi,
                occupati3112Femmine: occupati3112Femmine,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AziendeTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({lavoratoriRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (lavoratoriRefs) db.lavoratori],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (lavoratoriRefs)
                    await $_getPrefetchedData<
                      Azienda,
                      $AziendeTable,
                      Lavoratore
                    >(
                      currentTable: table,
                      referencedTable: $$AziendeTableReferences
                          ._lavoratoriRefsTable(db),
                      managerFromTypedResult: (p0) => $$AziendeTableReferences(
                        db,
                        table,
                        p0,
                      ).lavoratoriRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.aziendaId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AziendeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AziendeTable,
      Azienda,
      $$AziendeTableFilterComposer,
      $$AziendeTableOrderingComposer,
      $$AziendeTableAnnotationComposer,
      $$AziendeTableCreateCompanionBuilder,
      $$AziendeTableUpdateCompanionBuilder,
      (Azienda, $$AziendeTableReferences),
      Azienda,
      PrefetchHooks Function({bool lavoratoriRefs})
    >;
typedef $$LavoratoriTableCreateCompanionBuilder =
    LavoratoriCompanion Function({
      Value<int> id,
      required int aziendaId,
      required String cognome,
      required String nome,
      required String sesso,
      required String luogoNascita,
      required DateTime dataNascita,
      required String domicilioComune,
      required String domicilioProvincia,
      required String domicilioIndirizzo,
      required String domicilioTelefono,
      required String nazionalita,
      required String codiceFiscale,
    });
typedef $$LavoratoriTableUpdateCompanionBuilder =
    LavoratoriCompanion Function({
      Value<int> id,
      Value<int> aziendaId,
      Value<String> cognome,
      Value<String> nome,
      Value<String> sesso,
      Value<String> luogoNascita,
      Value<DateTime> dataNascita,
      Value<String> domicilioComune,
      Value<String> domicilioProvincia,
      Value<String> domicilioIndirizzo,
      Value<String> domicilioTelefono,
      Value<String> nazionalita,
      Value<String> codiceFiscale,
    });

final class $$LavoratoriTableReferences
    extends BaseReferences<_$AppDatabase, $LavoratoriTable, Lavoratore> {
  $$LavoratoriTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AziendeTable _aziendaIdTable(_$AppDatabase db) =>
      db.aziende.createAlias(
        $_aliasNameGenerator(db.lavoratori.aziendaId, db.aziende.id),
      );

  $$AziendeTableProcessedTableManager get aziendaId {
    final $_column = $_itemColumn<int>('azienda_id')!;

    final manager = $$AziendeTableTableManager(
      $_db,
      $_db.aziende,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aziendaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$VisiteTable, List<Visita>> _visiteRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.visite,
    aliasName: $_aliasNameGenerator(db.lavoratori.id, db.visite.lavoratoreId),
  );

  $$VisiteTableProcessedTableManager get visiteRefs {
    final manager = $$VisiteTableTableManager(
      $_db,
      $_db.visite,
    ).filter((f) => f.lavoratoreId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_visiteRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LavoratoriTableFilterComposer
    extends Composer<_$AppDatabase, $LavoratoriTable> {
  $$LavoratoriTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cognome => $composableBuilder(
    column: $table.cognome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sesso => $composableBuilder(
    column: $table.sesso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get luogoNascita => $composableBuilder(
    column: $table.luogoNascita,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataNascita => $composableBuilder(
    column: $table.dataNascita,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get domicilioComune => $composableBuilder(
    column: $table.domicilioComune,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get domicilioProvincia => $composableBuilder(
    column: $table.domicilioProvincia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get domicilioIndirizzo => $composableBuilder(
    column: $table.domicilioIndirizzo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get domicilioTelefono => $composableBuilder(
    column: $table.domicilioTelefono,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nazionalita => $composableBuilder(
    column: $table.nazionalita,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codiceFiscale => $composableBuilder(
    column: $table.codiceFiscale,
    builder: (column) => ColumnFilters(column),
  );

  $$AziendeTableFilterComposer get aziendaId {
    final $$AziendeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aziendaId,
      referencedTable: $db.aziende,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AziendeTableFilterComposer(
            $db: $db,
            $table: $db.aziende,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> visiteRefs(
    Expression<bool> Function($$VisiteTableFilterComposer f) f,
  ) {
    final $$VisiteTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.visite,
      getReferencedColumn: (t) => t.lavoratoreId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisiteTableFilterComposer(
            $db: $db,
            $table: $db.visite,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LavoratoriTableOrderingComposer
    extends Composer<_$AppDatabase, $LavoratoriTable> {
  $$LavoratoriTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cognome => $composableBuilder(
    column: $table.cognome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sesso => $composableBuilder(
    column: $table.sesso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get luogoNascita => $composableBuilder(
    column: $table.luogoNascita,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataNascita => $composableBuilder(
    column: $table.dataNascita,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get domicilioComune => $composableBuilder(
    column: $table.domicilioComune,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get domicilioProvincia => $composableBuilder(
    column: $table.domicilioProvincia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get domicilioIndirizzo => $composableBuilder(
    column: $table.domicilioIndirizzo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get domicilioTelefono => $composableBuilder(
    column: $table.domicilioTelefono,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nazionalita => $composableBuilder(
    column: $table.nazionalita,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codiceFiscale => $composableBuilder(
    column: $table.codiceFiscale,
    builder: (column) => ColumnOrderings(column),
  );

  $$AziendeTableOrderingComposer get aziendaId {
    final $$AziendeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aziendaId,
      referencedTable: $db.aziende,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AziendeTableOrderingComposer(
            $db: $db,
            $table: $db.aziende,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LavoratoriTableAnnotationComposer
    extends Composer<_$AppDatabase, $LavoratoriTable> {
  $$LavoratoriTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cognome =>
      $composableBuilder(column: $table.cognome, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get sesso =>
      $composableBuilder(column: $table.sesso, builder: (column) => column);

  GeneratedColumn<String> get luogoNascita => $composableBuilder(
    column: $table.luogoNascita,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dataNascita => $composableBuilder(
    column: $table.dataNascita,
    builder: (column) => column,
  );

  GeneratedColumn<String> get domicilioComune => $composableBuilder(
    column: $table.domicilioComune,
    builder: (column) => column,
  );

  GeneratedColumn<String> get domicilioProvincia => $composableBuilder(
    column: $table.domicilioProvincia,
    builder: (column) => column,
  );

  GeneratedColumn<String> get domicilioIndirizzo => $composableBuilder(
    column: $table.domicilioIndirizzo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get domicilioTelefono => $composableBuilder(
    column: $table.domicilioTelefono,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nazionalita => $composableBuilder(
    column: $table.nazionalita,
    builder: (column) => column,
  );

  GeneratedColumn<String> get codiceFiscale => $composableBuilder(
    column: $table.codiceFiscale,
    builder: (column) => column,
  );

  $$AziendeTableAnnotationComposer get aziendaId {
    final $$AziendeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aziendaId,
      referencedTable: $db.aziende,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AziendeTableAnnotationComposer(
            $db: $db,
            $table: $db.aziende,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> visiteRefs<T extends Object>(
    Expression<T> Function($$VisiteTableAnnotationComposer a) f,
  ) {
    final $$VisiteTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.visite,
      getReferencedColumn: (t) => t.lavoratoreId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisiteTableAnnotationComposer(
            $db: $db,
            $table: $db.visite,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LavoratoriTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LavoratoriTable,
          Lavoratore,
          $$LavoratoriTableFilterComposer,
          $$LavoratoriTableOrderingComposer,
          $$LavoratoriTableAnnotationComposer,
          $$LavoratoriTableCreateCompanionBuilder,
          $$LavoratoriTableUpdateCompanionBuilder,
          (Lavoratore, $$LavoratoriTableReferences),
          Lavoratore,
          PrefetchHooks Function({bool aziendaId, bool visiteRefs})
        > {
  $$LavoratoriTableTableManager(_$AppDatabase db, $LavoratoriTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LavoratoriTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LavoratoriTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LavoratoriTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> aziendaId = const Value.absent(),
                Value<String> cognome = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> sesso = const Value.absent(),
                Value<String> luogoNascita = const Value.absent(),
                Value<DateTime> dataNascita = const Value.absent(),
                Value<String> domicilioComune = const Value.absent(),
                Value<String> domicilioProvincia = const Value.absent(),
                Value<String> domicilioIndirizzo = const Value.absent(),
                Value<String> domicilioTelefono = const Value.absent(),
                Value<String> nazionalita = const Value.absent(),
                Value<String> codiceFiscale = const Value.absent(),
              }) => LavoratoriCompanion(
                id: id,
                aziendaId: aziendaId,
                cognome: cognome,
                nome: nome,
                sesso: sesso,
                luogoNascita: luogoNascita,
                dataNascita: dataNascita,
                domicilioComune: domicilioComune,
                domicilioProvincia: domicilioProvincia,
                domicilioIndirizzo: domicilioIndirizzo,
                domicilioTelefono: domicilioTelefono,
                nazionalita: nazionalita,
                codiceFiscale: codiceFiscale,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int aziendaId,
                required String cognome,
                required String nome,
                required String sesso,
                required String luogoNascita,
                required DateTime dataNascita,
                required String domicilioComune,
                required String domicilioProvincia,
                required String domicilioIndirizzo,
                required String domicilioTelefono,
                required String nazionalita,
                required String codiceFiscale,
              }) => LavoratoriCompanion.insert(
                id: id,
                aziendaId: aziendaId,
                cognome: cognome,
                nome: nome,
                sesso: sesso,
                luogoNascita: luogoNascita,
                dataNascita: dataNascita,
                domicilioComune: domicilioComune,
                domicilioProvincia: domicilioProvincia,
                domicilioIndirizzo: domicilioIndirizzo,
                domicilioTelefono: domicilioTelefono,
                nazionalita: nazionalita,
                codiceFiscale: codiceFiscale,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LavoratoriTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({aziendaId = false, visiteRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (visiteRefs) db.visite],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (aziendaId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.aziendaId,
                                referencedTable: $$LavoratoriTableReferences
                                    ._aziendaIdTable(db),
                                referencedColumn: $$LavoratoriTableReferences
                                    ._aziendaIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (visiteRefs)
                    await $_getPrefetchedData<
                      Lavoratore,
                      $LavoratoriTable,
                      Visita
                    >(
                      currentTable: table,
                      referencedTable: $$LavoratoriTableReferences
                          ._visiteRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LavoratoriTableReferences(db, table, p0).visiteRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.lavoratoreId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LavoratoriTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LavoratoriTable,
      Lavoratore,
      $$LavoratoriTableFilterComposer,
      $$LavoratoriTableOrderingComposer,
      $$LavoratoriTableAnnotationComposer,
      $$LavoratoriTableCreateCompanionBuilder,
      $$LavoratoriTableUpdateCompanionBuilder,
      (Lavoratore, $$LavoratoriTableReferences),
      Lavoratore,
      PrefetchHooks Function({bool aziendaId, bool visiteRefs})
    >;
typedef $$VisiteTableCreateCompanionBuilder =
    VisiteCompanion Function({
      Value<int> id,
      required int lavoratoreId,
      required DateTime dataVisita,
      required int tipoVisita,
      Value<String?> reparto,
      required String mansioneSpecifica,
      required String fattoriRischio3A,
      required String anamnesiLavorativa,
      required String anamnesiFamiliare,
      required String anamnesiFisiologica,
      required String anamnesiPatologicaRemota,
      required String anamnesiPatologicaProssima,
      required String esameObiettivo,
      required String accertamentiIntegrativi,
      Value<String?> provvedimentiMedico,
      required int giudizioIdoneita,
      Value<DateTime?> scadenzaVisitaSuccessiva,
      Value<DateTime?> dataTrasmissioneLavoratore,
      Value<DateTime?> dataTrasmissioneDatore,
      Value<bool> malattiaProfSegnalata,
      Value<String?> tipologiaMalattia,
      Value<bool> rMmc,
      Value<bool> rSovraccaricoArti,
      Value<bool> rPosturali,
      Value<bool> rChimico,
      Value<bool> rCancerogeni,
      Value<bool> rMutageni,
      Value<bool> rAmianto,
      Value<bool> rSilice,
      Value<bool> rBiologico,
      Value<bool> rVdt,
      Value<bool> rVibrazioniCorpo,
      Value<bool> rVibrazioniMano,
      Value<bool> rRumore,
      Value<bool> rCampiElettro,
      Value<bool> rRoa,
      Value<bool> rUv,
      Value<bool> rMicroclima,
      Value<bool> rInfrasuoni,
      Value<bool> rAtmosfere,
      Value<bool> rNotturno,
      Value<bool> rRiproduzione,
      Value<String?> rAltriRischi,
      Value<bool> screeningAlcol,
      Value<bool> screeningSostanze,
      Value<bool> invioSert,
      Value<bool> dipendenzaConfermata,
    });
typedef $$VisiteTableUpdateCompanionBuilder =
    VisiteCompanion Function({
      Value<int> id,
      Value<int> lavoratoreId,
      Value<DateTime> dataVisita,
      Value<int> tipoVisita,
      Value<String?> reparto,
      Value<String> mansioneSpecifica,
      Value<String> fattoriRischio3A,
      Value<String> anamnesiLavorativa,
      Value<String> anamnesiFamiliare,
      Value<String> anamnesiFisiologica,
      Value<String> anamnesiPatologicaRemota,
      Value<String> anamnesiPatologicaProssima,
      Value<String> esameObiettivo,
      Value<String> accertamentiIntegrativi,
      Value<String?> provvedimentiMedico,
      Value<int> giudizioIdoneita,
      Value<DateTime?> scadenzaVisitaSuccessiva,
      Value<DateTime?> dataTrasmissioneLavoratore,
      Value<DateTime?> dataTrasmissioneDatore,
      Value<bool> malattiaProfSegnalata,
      Value<String?> tipologiaMalattia,
      Value<bool> rMmc,
      Value<bool> rSovraccaricoArti,
      Value<bool> rPosturali,
      Value<bool> rChimico,
      Value<bool> rCancerogeni,
      Value<bool> rMutageni,
      Value<bool> rAmianto,
      Value<bool> rSilice,
      Value<bool> rBiologico,
      Value<bool> rVdt,
      Value<bool> rVibrazioniCorpo,
      Value<bool> rVibrazioniMano,
      Value<bool> rRumore,
      Value<bool> rCampiElettro,
      Value<bool> rRoa,
      Value<bool> rUv,
      Value<bool> rMicroclima,
      Value<bool> rInfrasuoni,
      Value<bool> rAtmosfere,
      Value<bool> rNotturno,
      Value<bool> rRiproduzione,
      Value<String?> rAltriRischi,
      Value<bool> screeningAlcol,
      Value<bool> screeningSostanze,
      Value<bool> invioSert,
      Value<bool> dipendenzaConfermata,
    });

final class $$VisiteTableReferences
    extends BaseReferences<_$AppDatabase, $VisiteTable, Visita> {
  $$VisiteTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LavoratoriTable _lavoratoreIdTable(_$AppDatabase db) =>
      db.lavoratori.createAlias(
        $_aliasNameGenerator(db.visite.lavoratoreId, db.lavoratori.id),
      );

  $$LavoratoriTableProcessedTableManager get lavoratoreId {
    final $_column = $_itemColumn<int>('lavoratore_id')!;

    final manager = $$LavoratoriTableTableManager(
      $_db,
      $_db.lavoratori,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lavoratoreIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VisiteTableFilterComposer
    extends Composer<_$AppDatabase, $VisiteTable> {
  $$VisiteTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataVisita => $composableBuilder(
    column: $table.dataVisita,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tipoVisita => $composableBuilder(
    column: $table.tipoVisita,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reparto => $composableBuilder(
    column: $table.reparto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mansioneSpecifica => $composableBuilder(
    column: $table.mansioneSpecifica,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fattoriRischio3A => $composableBuilder(
    column: $table.fattoriRischio3A,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get anamnesiLavorativa => $composableBuilder(
    column: $table.anamnesiLavorativa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get anamnesiFamiliare => $composableBuilder(
    column: $table.anamnesiFamiliare,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get anamnesiFisiologica => $composableBuilder(
    column: $table.anamnesiFisiologica,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get anamnesiPatologicaRemota => $composableBuilder(
    column: $table.anamnesiPatologicaRemota,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get anamnesiPatologicaProssima => $composableBuilder(
    column: $table.anamnesiPatologicaProssima,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get esameObiettivo => $composableBuilder(
    column: $table.esameObiettivo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accertamentiIntegrativi => $composableBuilder(
    column: $table.accertamentiIntegrativi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provvedimentiMedico => $composableBuilder(
    column: $table.provvedimentiMedico,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get giudizioIdoneita => $composableBuilder(
    column: $table.giudizioIdoneita,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scadenzaVisitaSuccessiva => $composableBuilder(
    column: $table.scadenzaVisitaSuccessiva,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataTrasmissioneLavoratore => $composableBuilder(
    column: $table.dataTrasmissioneLavoratore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataTrasmissioneDatore => $composableBuilder(
    column: $table.dataTrasmissioneDatore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get malattiaProfSegnalata => $composableBuilder(
    column: $table.malattiaProfSegnalata,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipologiaMalattia => $composableBuilder(
    column: $table.tipologiaMalattia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rMmc => $composableBuilder(
    column: $table.rMmc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rSovraccaricoArti => $composableBuilder(
    column: $table.rSovraccaricoArti,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rPosturali => $composableBuilder(
    column: $table.rPosturali,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rChimico => $composableBuilder(
    column: $table.rChimico,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rCancerogeni => $composableBuilder(
    column: $table.rCancerogeni,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rMutageni => $composableBuilder(
    column: $table.rMutageni,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rAmianto => $composableBuilder(
    column: $table.rAmianto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rSilice => $composableBuilder(
    column: $table.rSilice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rBiologico => $composableBuilder(
    column: $table.rBiologico,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rVdt => $composableBuilder(
    column: $table.rVdt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rVibrazioniCorpo => $composableBuilder(
    column: $table.rVibrazioniCorpo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rVibrazioniMano => $composableBuilder(
    column: $table.rVibrazioniMano,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rRumore => $composableBuilder(
    column: $table.rRumore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rCampiElettro => $composableBuilder(
    column: $table.rCampiElettro,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rRoa => $composableBuilder(
    column: $table.rRoa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rUv => $composableBuilder(
    column: $table.rUv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rMicroclima => $composableBuilder(
    column: $table.rMicroclima,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rInfrasuoni => $composableBuilder(
    column: $table.rInfrasuoni,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rAtmosfere => $composableBuilder(
    column: $table.rAtmosfere,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rNotturno => $composableBuilder(
    column: $table.rNotturno,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rRiproduzione => $composableBuilder(
    column: $table.rRiproduzione,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rAltriRischi => $composableBuilder(
    column: $table.rAltriRischi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get screeningAlcol => $composableBuilder(
    column: $table.screeningAlcol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get screeningSostanze => $composableBuilder(
    column: $table.screeningSostanze,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get invioSert => $composableBuilder(
    column: $table.invioSert,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get dipendenzaConfermata => $composableBuilder(
    column: $table.dipendenzaConfermata,
    builder: (column) => ColumnFilters(column),
  );

  $$LavoratoriTableFilterComposer get lavoratoreId {
    final $$LavoratoriTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lavoratoreId,
      referencedTable: $db.lavoratori,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LavoratoriTableFilterComposer(
            $db: $db,
            $table: $db.lavoratori,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VisiteTableOrderingComposer
    extends Composer<_$AppDatabase, $VisiteTable> {
  $$VisiteTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataVisita => $composableBuilder(
    column: $table.dataVisita,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tipoVisita => $composableBuilder(
    column: $table.tipoVisita,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reparto => $composableBuilder(
    column: $table.reparto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mansioneSpecifica => $composableBuilder(
    column: $table.mansioneSpecifica,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fattoriRischio3A => $composableBuilder(
    column: $table.fattoriRischio3A,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get anamnesiLavorativa => $composableBuilder(
    column: $table.anamnesiLavorativa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get anamnesiFamiliare => $composableBuilder(
    column: $table.anamnesiFamiliare,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get anamnesiFisiologica => $composableBuilder(
    column: $table.anamnesiFisiologica,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get anamnesiPatologicaRemota => $composableBuilder(
    column: $table.anamnesiPatologicaRemota,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get anamnesiPatologicaProssima => $composableBuilder(
    column: $table.anamnesiPatologicaProssima,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get esameObiettivo => $composableBuilder(
    column: $table.esameObiettivo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accertamentiIntegrativi => $composableBuilder(
    column: $table.accertamentiIntegrativi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provvedimentiMedico => $composableBuilder(
    column: $table.provvedimentiMedico,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get giudizioIdoneita => $composableBuilder(
    column: $table.giudizioIdoneita,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scadenzaVisitaSuccessiva => $composableBuilder(
    column: $table.scadenzaVisitaSuccessiva,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataTrasmissioneLavoratore =>
      $composableBuilder(
        column: $table.dataTrasmissioneLavoratore,
        builder: (column) => ColumnOrderings(column),
      );

  ColumnOrderings<DateTime> get dataTrasmissioneDatore => $composableBuilder(
    column: $table.dataTrasmissioneDatore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get malattiaProfSegnalata => $composableBuilder(
    column: $table.malattiaProfSegnalata,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipologiaMalattia => $composableBuilder(
    column: $table.tipologiaMalattia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rMmc => $composableBuilder(
    column: $table.rMmc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rSovraccaricoArti => $composableBuilder(
    column: $table.rSovraccaricoArti,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rPosturali => $composableBuilder(
    column: $table.rPosturali,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rChimico => $composableBuilder(
    column: $table.rChimico,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rCancerogeni => $composableBuilder(
    column: $table.rCancerogeni,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rMutageni => $composableBuilder(
    column: $table.rMutageni,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rAmianto => $composableBuilder(
    column: $table.rAmianto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rSilice => $composableBuilder(
    column: $table.rSilice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rBiologico => $composableBuilder(
    column: $table.rBiologico,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rVdt => $composableBuilder(
    column: $table.rVdt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rVibrazioniCorpo => $composableBuilder(
    column: $table.rVibrazioniCorpo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rVibrazioniMano => $composableBuilder(
    column: $table.rVibrazioniMano,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rRumore => $composableBuilder(
    column: $table.rRumore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rCampiElettro => $composableBuilder(
    column: $table.rCampiElettro,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rRoa => $composableBuilder(
    column: $table.rRoa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rUv => $composableBuilder(
    column: $table.rUv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rMicroclima => $composableBuilder(
    column: $table.rMicroclima,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rInfrasuoni => $composableBuilder(
    column: $table.rInfrasuoni,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rAtmosfere => $composableBuilder(
    column: $table.rAtmosfere,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rNotturno => $composableBuilder(
    column: $table.rNotturno,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rRiproduzione => $composableBuilder(
    column: $table.rRiproduzione,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rAltriRischi => $composableBuilder(
    column: $table.rAltriRischi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get screeningAlcol => $composableBuilder(
    column: $table.screeningAlcol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get screeningSostanze => $composableBuilder(
    column: $table.screeningSostanze,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get invioSert => $composableBuilder(
    column: $table.invioSert,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get dipendenzaConfermata => $composableBuilder(
    column: $table.dipendenzaConfermata,
    builder: (column) => ColumnOrderings(column),
  );

  $$LavoratoriTableOrderingComposer get lavoratoreId {
    final $$LavoratoriTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lavoratoreId,
      referencedTable: $db.lavoratori,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LavoratoriTableOrderingComposer(
            $db: $db,
            $table: $db.lavoratori,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VisiteTableAnnotationComposer
    extends Composer<_$AppDatabase, $VisiteTable> {
  $$VisiteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get dataVisita => $composableBuilder(
    column: $table.dataVisita,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tipoVisita => $composableBuilder(
    column: $table.tipoVisita,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reparto =>
      $composableBuilder(column: $table.reparto, builder: (column) => column);

  GeneratedColumn<String> get mansioneSpecifica => $composableBuilder(
    column: $table.mansioneSpecifica,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fattoriRischio3A => $composableBuilder(
    column: $table.fattoriRischio3A,
    builder: (column) => column,
  );

  GeneratedColumn<String> get anamnesiLavorativa => $composableBuilder(
    column: $table.anamnesiLavorativa,
    builder: (column) => column,
  );

  GeneratedColumn<String> get anamnesiFamiliare => $composableBuilder(
    column: $table.anamnesiFamiliare,
    builder: (column) => column,
  );

  GeneratedColumn<String> get anamnesiFisiologica => $composableBuilder(
    column: $table.anamnesiFisiologica,
    builder: (column) => column,
  );

  GeneratedColumn<String> get anamnesiPatologicaRemota => $composableBuilder(
    column: $table.anamnesiPatologicaRemota,
    builder: (column) => column,
  );

  GeneratedColumn<String> get anamnesiPatologicaProssima => $composableBuilder(
    column: $table.anamnesiPatologicaProssima,
    builder: (column) => column,
  );

  GeneratedColumn<String> get esameObiettivo => $composableBuilder(
    column: $table.esameObiettivo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accertamentiIntegrativi => $composableBuilder(
    column: $table.accertamentiIntegrativi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get provvedimentiMedico => $composableBuilder(
    column: $table.provvedimentiMedico,
    builder: (column) => column,
  );

  GeneratedColumn<int> get giudizioIdoneita => $composableBuilder(
    column: $table.giudizioIdoneita,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scadenzaVisitaSuccessiva => $composableBuilder(
    column: $table.scadenzaVisitaSuccessiva,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dataTrasmissioneLavoratore =>
      $composableBuilder(
        column: $table.dataTrasmissioneLavoratore,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get dataTrasmissioneDatore => $composableBuilder(
    column: $table.dataTrasmissioneDatore,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get malattiaProfSegnalata => $composableBuilder(
    column: $table.malattiaProfSegnalata,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tipologiaMalattia => $composableBuilder(
    column: $table.tipologiaMalattia,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rMmc =>
      $composableBuilder(column: $table.rMmc, builder: (column) => column);

  GeneratedColumn<bool> get rSovraccaricoArti => $composableBuilder(
    column: $table.rSovraccaricoArti,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rPosturali => $composableBuilder(
    column: $table.rPosturali,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rChimico =>
      $composableBuilder(column: $table.rChimico, builder: (column) => column);

  GeneratedColumn<bool> get rCancerogeni => $composableBuilder(
    column: $table.rCancerogeni,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rMutageni =>
      $composableBuilder(column: $table.rMutageni, builder: (column) => column);

  GeneratedColumn<bool> get rAmianto =>
      $composableBuilder(column: $table.rAmianto, builder: (column) => column);

  GeneratedColumn<bool> get rSilice =>
      $composableBuilder(column: $table.rSilice, builder: (column) => column);

  GeneratedColumn<bool> get rBiologico => $composableBuilder(
    column: $table.rBiologico,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rVdt =>
      $composableBuilder(column: $table.rVdt, builder: (column) => column);

  GeneratedColumn<bool> get rVibrazioniCorpo => $composableBuilder(
    column: $table.rVibrazioniCorpo,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rVibrazioniMano => $composableBuilder(
    column: $table.rVibrazioniMano,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rRumore =>
      $composableBuilder(column: $table.rRumore, builder: (column) => column);

  GeneratedColumn<bool> get rCampiElettro => $composableBuilder(
    column: $table.rCampiElettro,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rRoa =>
      $composableBuilder(column: $table.rRoa, builder: (column) => column);

  GeneratedColumn<bool> get rUv =>
      $composableBuilder(column: $table.rUv, builder: (column) => column);

  GeneratedColumn<bool> get rMicroclima => $composableBuilder(
    column: $table.rMicroclima,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rInfrasuoni => $composableBuilder(
    column: $table.rInfrasuoni,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rAtmosfere => $composableBuilder(
    column: $table.rAtmosfere,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rNotturno =>
      $composableBuilder(column: $table.rNotturno, builder: (column) => column);

  GeneratedColumn<bool> get rRiproduzione => $composableBuilder(
    column: $table.rRiproduzione,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rAltriRischi => $composableBuilder(
    column: $table.rAltriRischi,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get screeningAlcol => $composableBuilder(
    column: $table.screeningAlcol,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get screeningSostanze => $composableBuilder(
    column: $table.screeningSostanze,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get invioSert =>
      $composableBuilder(column: $table.invioSert, builder: (column) => column);

  GeneratedColumn<bool> get dipendenzaConfermata => $composableBuilder(
    column: $table.dipendenzaConfermata,
    builder: (column) => column,
  );

  $$LavoratoriTableAnnotationComposer get lavoratoreId {
    final $$LavoratoriTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lavoratoreId,
      referencedTable: $db.lavoratori,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LavoratoriTableAnnotationComposer(
            $db: $db,
            $table: $db.lavoratori,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VisiteTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VisiteTable,
          Visita,
          $$VisiteTableFilterComposer,
          $$VisiteTableOrderingComposer,
          $$VisiteTableAnnotationComposer,
          $$VisiteTableCreateCompanionBuilder,
          $$VisiteTableUpdateCompanionBuilder,
          (Visita, $$VisiteTableReferences),
          Visita,
          PrefetchHooks Function({bool lavoratoreId})
        > {
  $$VisiteTableTableManager(_$AppDatabase db, $VisiteTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VisiteTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VisiteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VisiteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> lavoratoreId = const Value.absent(),
                Value<DateTime> dataVisita = const Value.absent(),
                Value<int> tipoVisita = const Value.absent(),
                Value<String?> reparto = const Value.absent(),
                Value<String> mansioneSpecifica = const Value.absent(),
                Value<String> fattoriRischio3A = const Value.absent(),
                Value<String> anamnesiLavorativa = const Value.absent(),
                Value<String> anamnesiFamiliare = const Value.absent(),
                Value<String> anamnesiFisiologica = const Value.absent(),
                Value<String> anamnesiPatologicaRemota = const Value.absent(),
                Value<String> anamnesiPatologicaProssima = const Value.absent(),
                Value<String> esameObiettivo = const Value.absent(),
                Value<String> accertamentiIntegrativi = const Value.absent(),
                Value<String?> provvedimentiMedico = const Value.absent(),
                Value<int> giudizioIdoneita = const Value.absent(),
                Value<DateTime?> scadenzaVisitaSuccessiva =
                    const Value.absent(),
                Value<DateTime?> dataTrasmissioneLavoratore =
                    const Value.absent(),
                Value<DateTime?> dataTrasmissioneDatore = const Value.absent(),
                Value<bool> malattiaProfSegnalata = const Value.absent(),
                Value<String?> tipologiaMalattia = const Value.absent(),
                Value<bool> rMmc = const Value.absent(),
                Value<bool> rSovraccaricoArti = const Value.absent(),
                Value<bool> rPosturali = const Value.absent(),
                Value<bool> rChimico = const Value.absent(),
                Value<bool> rCancerogeni = const Value.absent(),
                Value<bool> rMutageni = const Value.absent(),
                Value<bool> rAmianto = const Value.absent(),
                Value<bool> rSilice = const Value.absent(),
                Value<bool> rBiologico = const Value.absent(),
                Value<bool> rVdt = const Value.absent(),
                Value<bool> rVibrazioniCorpo = const Value.absent(),
                Value<bool> rVibrazioniMano = const Value.absent(),
                Value<bool> rRumore = const Value.absent(),
                Value<bool> rCampiElettro = const Value.absent(),
                Value<bool> rRoa = const Value.absent(),
                Value<bool> rUv = const Value.absent(),
                Value<bool> rMicroclima = const Value.absent(),
                Value<bool> rInfrasuoni = const Value.absent(),
                Value<bool> rAtmosfere = const Value.absent(),
                Value<bool> rNotturno = const Value.absent(),
                Value<bool> rRiproduzione = const Value.absent(),
                Value<String?> rAltriRischi = const Value.absent(),
                Value<bool> screeningAlcol = const Value.absent(),
                Value<bool> screeningSostanze = const Value.absent(),
                Value<bool> invioSert = const Value.absent(),
                Value<bool> dipendenzaConfermata = const Value.absent(),
              }) => VisiteCompanion(
                id: id,
                lavoratoreId: lavoratoreId,
                dataVisita: dataVisita,
                tipoVisita: tipoVisita,
                reparto: reparto,
                mansioneSpecifica: mansioneSpecifica,
                fattoriRischio3A: fattoriRischio3A,
                anamnesiLavorativa: anamnesiLavorativa,
                anamnesiFamiliare: anamnesiFamiliare,
                anamnesiFisiologica: anamnesiFisiologica,
                anamnesiPatologicaRemota: anamnesiPatologicaRemota,
                anamnesiPatologicaProssima: anamnesiPatologicaProssima,
                esameObiettivo: esameObiettivo,
                accertamentiIntegrativi: accertamentiIntegrativi,
                provvedimentiMedico: provvedimentiMedico,
                giudizioIdoneita: giudizioIdoneita,
                scadenzaVisitaSuccessiva: scadenzaVisitaSuccessiva,
                dataTrasmissioneLavoratore: dataTrasmissioneLavoratore,
                dataTrasmissioneDatore: dataTrasmissioneDatore,
                malattiaProfSegnalata: malattiaProfSegnalata,
                tipologiaMalattia: tipologiaMalattia,
                rMmc: rMmc,
                rSovraccaricoArti: rSovraccaricoArti,
                rPosturali: rPosturali,
                rChimico: rChimico,
                rCancerogeni: rCancerogeni,
                rMutageni: rMutageni,
                rAmianto: rAmianto,
                rSilice: rSilice,
                rBiologico: rBiologico,
                rVdt: rVdt,
                rVibrazioniCorpo: rVibrazioniCorpo,
                rVibrazioniMano: rVibrazioniMano,
                rRumore: rRumore,
                rCampiElettro: rCampiElettro,
                rRoa: rRoa,
                rUv: rUv,
                rMicroclima: rMicroclima,
                rInfrasuoni: rInfrasuoni,
                rAtmosfere: rAtmosfere,
                rNotturno: rNotturno,
                rRiproduzione: rRiproduzione,
                rAltriRischi: rAltriRischi,
                screeningAlcol: screeningAlcol,
                screeningSostanze: screeningSostanze,
                invioSert: invioSert,
                dipendenzaConfermata: dipendenzaConfermata,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int lavoratoreId,
                required DateTime dataVisita,
                required int tipoVisita,
                Value<String?> reparto = const Value.absent(),
                required String mansioneSpecifica,
                required String fattoriRischio3A,
                required String anamnesiLavorativa,
                required String anamnesiFamiliare,
                required String anamnesiFisiologica,
                required String anamnesiPatologicaRemota,
                required String anamnesiPatologicaProssima,
                required String esameObiettivo,
                required String accertamentiIntegrativi,
                Value<String?> provvedimentiMedico = const Value.absent(),
                required int giudizioIdoneita,
                Value<DateTime?> scadenzaVisitaSuccessiva =
                    const Value.absent(),
                Value<DateTime?> dataTrasmissioneLavoratore =
                    const Value.absent(),
                Value<DateTime?> dataTrasmissioneDatore = const Value.absent(),
                Value<bool> malattiaProfSegnalata = const Value.absent(),
                Value<String?> tipologiaMalattia = const Value.absent(),
                Value<bool> rMmc = const Value.absent(),
                Value<bool> rSovraccaricoArti = const Value.absent(),
                Value<bool> rPosturali = const Value.absent(),
                Value<bool> rChimico = const Value.absent(),
                Value<bool> rCancerogeni = const Value.absent(),
                Value<bool> rMutageni = const Value.absent(),
                Value<bool> rAmianto = const Value.absent(),
                Value<bool> rSilice = const Value.absent(),
                Value<bool> rBiologico = const Value.absent(),
                Value<bool> rVdt = const Value.absent(),
                Value<bool> rVibrazioniCorpo = const Value.absent(),
                Value<bool> rVibrazioniMano = const Value.absent(),
                Value<bool> rRumore = const Value.absent(),
                Value<bool> rCampiElettro = const Value.absent(),
                Value<bool> rRoa = const Value.absent(),
                Value<bool> rUv = const Value.absent(),
                Value<bool> rMicroclima = const Value.absent(),
                Value<bool> rInfrasuoni = const Value.absent(),
                Value<bool> rAtmosfere = const Value.absent(),
                Value<bool> rNotturno = const Value.absent(),
                Value<bool> rRiproduzione = const Value.absent(),
                Value<String?> rAltriRischi = const Value.absent(),
                Value<bool> screeningAlcol = const Value.absent(),
                Value<bool> screeningSostanze = const Value.absent(),
                Value<bool> invioSert = const Value.absent(),
                Value<bool> dipendenzaConfermata = const Value.absent(),
              }) => VisiteCompanion.insert(
                id: id,
                lavoratoreId: lavoratoreId,
                dataVisita: dataVisita,
                tipoVisita: tipoVisita,
                reparto: reparto,
                mansioneSpecifica: mansioneSpecifica,
                fattoriRischio3A: fattoriRischio3A,
                anamnesiLavorativa: anamnesiLavorativa,
                anamnesiFamiliare: anamnesiFamiliare,
                anamnesiFisiologica: anamnesiFisiologica,
                anamnesiPatologicaRemota: anamnesiPatologicaRemota,
                anamnesiPatologicaProssima: anamnesiPatologicaProssima,
                esameObiettivo: esameObiettivo,
                accertamentiIntegrativi: accertamentiIntegrativi,
                provvedimentiMedico: provvedimentiMedico,
                giudizioIdoneita: giudizioIdoneita,
                scadenzaVisitaSuccessiva: scadenzaVisitaSuccessiva,
                dataTrasmissioneLavoratore: dataTrasmissioneLavoratore,
                dataTrasmissioneDatore: dataTrasmissioneDatore,
                malattiaProfSegnalata: malattiaProfSegnalata,
                tipologiaMalattia: tipologiaMalattia,
                rMmc: rMmc,
                rSovraccaricoArti: rSovraccaricoArti,
                rPosturali: rPosturali,
                rChimico: rChimico,
                rCancerogeni: rCancerogeni,
                rMutageni: rMutageni,
                rAmianto: rAmianto,
                rSilice: rSilice,
                rBiologico: rBiologico,
                rVdt: rVdt,
                rVibrazioniCorpo: rVibrazioniCorpo,
                rVibrazioniMano: rVibrazioniMano,
                rRumore: rRumore,
                rCampiElettro: rCampiElettro,
                rRoa: rRoa,
                rUv: rUv,
                rMicroclima: rMicroclima,
                rInfrasuoni: rInfrasuoni,
                rAtmosfere: rAtmosfere,
                rNotturno: rNotturno,
                rRiproduzione: rRiproduzione,
                rAltriRischi: rAltriRischi,
                screeningAlcol: screeningAlcol,
                screeningSostanze: screeningSostanze,
                invioSert: invioSert,
                dipendenzaConfermata: dipendenzaConfermata,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$VisiteTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({lavoratoreId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (lavoratoreId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.lavoratoreId,
                                referencedTable: $$VisiteTableReferences
                                    ._lavoratoreIdTable(db),
                                referencedColumn: $$VisiteTableReferences
                                    ._lavoratoreIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VisiteTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VisiteTable,
      Visita,
      $$VisiteTableFilterComposer,
      $$VisiteTableOrderingComposer,
      $$VisiteTableAnnotationComposer,
      $$VisiteTableCreateCompanionBuilder,
      $$VisiteTableUpdateCompanionBuilder,
      (Visita, $$VisiteTableReferences),
      Visita,
      PrefetchHooks Function({bool lavoratoreId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AziendeTableTableManager get aziende =>
      $$AziendeTableTableManager(_db, _db.aziende);
  $$LavoratoriTableTableManager get lavoratori =>
      $$LavoratoriTableTableManager(_db, _db.lavoratori);
  $$VisiteTableTableManager get visite =>
      $$VisiteTableTableManager(_db, _db.visite);
}
