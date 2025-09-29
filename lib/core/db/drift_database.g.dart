// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $PetsTable extends Pets with TableInfo<$PetsTable, PetRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindsMeta = const VerificationMeta('kinds');
  @override
  late final GeneratedColumn<String> kinds = GeneratedColumn<String>(
    'kinds',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<int> sex = GeneratedColumn<int>(
    'sex',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birthdateMeta = const VerificationMeta(
    'birthdate',
  );
  @override
  late final GeneratedColumn<DateTime> birthdate = GeneratedColumn<DateTime>(
    'birthdate',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  chronicIllness = GeneratedColumn<String>(
    'chronic_illness',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<String>?>($PetsTable.$converterchronicIllnessn);
  static const VerificationMeta _iconIdMeta = const VerificationMeta('iconId');
  @override
  late final GeneratedColumn<String> iconId = GeneratedColumn<String>(
    'icon_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<int> syncState = GeneratedColumn<int>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    name,
    kinds,
    sex,
    birthdate,
    chronicIllness,
    iconId,
    updatedAt,
    deletedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pets';
  @override
  VerificationContext validateIntegrity(
    Insertable<PetRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('kinds')) {
      context.handle(
        _kindsMeta,
        kinds.isAcceptableOrUnknown(data['kinds']!, _kindsMeta),
      );
    } else if (isInserting) {
      context.missing(_kindsMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('birthdate')) {
      context.handle(
        _birthdateMeta,
        birthdate.isAcceptableOrUnknown(data['birthdate']!, _birthdateMeta),
      );
    }
    if (data.containsKey('icon_id')) {
      context.handle(
        _iconIdMeta,
        iconId.isAcceptableOrUnknown(data['icon_id']!, _iconIdMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  PetRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PetRow(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}local_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      kinds:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}kinds'],
          )!,
      sex:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sex'],
          )!,
      birthdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birthdate'],
      ),
      chronicIllness: $PetsTable.$converterchronicIllnessn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}chronic_illness'],
        ),
      ),
      iconId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_id'],
      ),
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncState:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sync_state'],
          )!,
    );
  }

  @override
  $PetsTable createAlias(String alias) {
    return $PetsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterchronicIllness =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterchronicIllnessn =
      NullAwareTypeConverter.wrap($converterchronicIllness);
}

class PetRow extends DataClass implements Insertable<PetRow> {
  final String localId;
  final String name;
  final String kinds;
  final int sex;
  final DateTime? birthdate;
  final List<String>? chronicIllness;
  final String? iconId;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;
  const PetRow({
    required this.localId,
    required this.name,
    required this.kinds,
    required this.sex,
    this.birthdate,
    this.chronicIllness,
    this.iconId,
    required this.updatedAt,
    this.deletedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    map['name'] = Variable<String>(name);
    map['kinds'] = Variable<String>(kinds);
    map['sex'] = Variable<int>(sex);
    if (!nullToAbsent || birthdate != null) {
      map['birthdate'] = Variable<DateTime>(birthdate);
    }
    if (!nullToAbsent || chronicIllness != null) {
      map['chronic_illness'] = Variable<String>(
        $PetsTable.$converterchronicIllnessn.toSql(chronicIllness),
      );
    }
    if (!nullToAbsent || iconId != null) {
      map['icon_id'] = Variable<String>(iconId);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_state'] = Variable<int>(syncState);
    return map;
  }

  PetsCompanion toCompanion(bool nullToAbsent) {
    return PetsCompanion(
      localId: Value(localId),
      name: Value(name),
      kinds: Value(kinds),
      sex: Value(sex),
      birthdate:
          birthdate == null && nullToAbsent
              ? const Value.absent()
              : Value(birthdate),
      chronicIllness:
          chronicIllness == null && nullToAbsent
              ? const Value.absent()
              : Value(chronicIllness),
      iconId:
          iconId == null && nullToAbsent ? const Value.absent() : Value(iconId),
      updatedAt: Value(updatedAt),
      deletedAt:
          deletedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(deletedAt),
      syncState: Value(syncState),
    );
  }

  factory PetRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PetRow(
      localId: serializer.fromJson<String>(json['localId']),
      name: serializer.fromJson<String>(json['name']),
      kinds: serializer.fromJson<String>(json['kinds']),
      sex: serializer.fromJson<int>(json['sex']),
      birthdate: serializer.fromJson<DateTime?>(json['birthdate']),
      chronicIllness: serializer.fromJson<List<String>?>(
        json['chronicIllness'],
      ),
      iconId: serializer.fromJson<String?>(json['iconId']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncState: serializer.fromJson<int>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'name': serializer.toJson<String>(name),
      'kinds': serializer.toJson<String>(kinds),
      'sex': serializer.toJson<int>(sex),
      'birthdate': serializer.toJson<DateTime?>(birthdate),
      'chronicIllness': serializer.toJson<List<String>?>(chronicIllness),
      'iconId': serializer.toJson<String?>(iconId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncState': serializer.toJson<int>(syncState),
    };
  }

  PetRow copyWith({
    String? localId,
    String? name,
    String? kinds,
    int? sex,
    Value<DateTime?> birthdate = const Value.absent(),
    Value<List<String>?> chronicIllness = const Value.absent(),
    Value<String?> iconId = const Value.absent(),
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? syncState,
  }) => PetRow(
    localId: localId ?? this.localId,
    name: name ?? this.name,
    kinds: kinds ?? this.kinds,
    sex: sex ?? this.sex,
    birthdate: birthdate.present ? birthdate.value : this.birthdate,
    chronicIllness:
        chronicIllness.present ? chronicIllness.value : this.chronicIllness,
    iconId: iconId.present ? iconId.value : this.iconId,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncState: syncState ?? this.syncState,
  );
  PetRow copyWithCompanion(PetsCompanion data) {
    return PetRow(
      localId: data.localId.present ? data.localId.value : this.localId,
      name: data.name.present ? data.name.value : this.name,
      kinds: data.kinds.present ? data.kinds.value : this.kinds,
      sex: data.sex.present ? data.sex.value : this.sex,
      birthdate: data.birthdate.present ? data.birthdate.value : this.birthdate,
      chronicIllness:
          data.chronicIllness.present
              ? data.chronicIllness.value
              : this.chronicIllness,
      iconId: data.iconId.present ? data.iconId.value : this.iconId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PetRow(')
          ..write('localId: $localId, ')
          ..write('name: $name, ')
          ..write('kinds: $kinds, ')
          ..write('sex: $sex, ')
          ..write('birthdate: $birthdate, ')
          ..write('chronicIllness: $chronicIllness, ')
          ..write('iconId: $iconId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    name,
    kinds,
    sex,
    birthdate,
    chronicIllness,
    iconId,
    updatedAt,
    deletedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PetRow &&
          other.localId == this.localId &&
          other.name == this.name &&
          other.kinds == this.kinds &&
          other.sex == this.sex &&
          other.birthdate == this.birthdate &&
          other.chronicIllness == this.chronicIllness &&
          other.iconId == this.iconId &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncState == this.syncState);
}

class PetsCompanion extends UpdateCompanion<PetRow> {
  final Value<String> localId;
  final Value<String> name;
  final Value<String> kinds;
  final Value<int> sex;
  final Value<DateTime?> birthdate;
  final Value<List<String>?> chronicIllness;
  final Value<String?> iconId;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> syncState;
  final Value<int> rowid;
  const PetsCompanion({
    this.localId = const Value.absent(),
    this.name = const Value.absent(),
    this.kinds = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthdate = const Value.absent(),
    this.chronicIllness = const Value.absent(),
    this.iconId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PetsCompanion.insert({
    required String localId,
    required String name,
    required String kinds,
    required int sex,
    this.birthdate = const Value.absent(),
    this.chronicIllness = const Value.absent(),
    this.iconId = const Value.absent(),
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       name = Value(name),
       kinds = Value(kinds),
       sex = Value(sex),
       updatedAt = Value(updatedAt);
  static Insertable<PetRow> custom({
    Expression<String>? localId,
    Expression<String>? name,
    Expression<String>? kinds,
    Expression<int>? sex,
    Expression<DateTime>? birthdate,
    Expression<String>? chronicIllness,
    Expression<String>? iconId,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (name != null) 'name': name,
      if (kinds != null) 'kinds': kinds,
      if (sex != null) 'sex': sex,
      if (birthdate != null) 'birthdate': birthdate,
      if (chronicIllness != null) 'chronic_illness': chronicIllness,
      if (iconId != null) 'icon_id': iconId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PetsCompanion copyWith({
    Value<String>? localId,
    Value<String>? name,
    Value<String>? kinds,
    Value<int>? sex,
    Value<DateTime?>? birthdate,
    Value<List<String>?>? chronicIllness,
    Value<String?>? iconId,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? syncState,
    Value<int>? rowid,
  }) {
    return PetsCompanion(
      localId: localId ?? this.localId,
      name: name ?? this.name,
      kinds: kinds ?? this.kinds,
      sex: sex ?? this.sex,
      birthdate: birthdate ?? this.birthdate,
      chronicIllness: chronicIllness ?? this.chronicIllness,
      iconId: iconId ?? this.iconId,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (kinds.present) {
      map['kinds'] = Variable<String>(kinds.value);
    }
    if (sex.present) {
      map['sex'] = Variable<int>(sex.value);
    }
    if (birthdate.present) {
      map['birthdate'] = Variable<DateTime>(birthdate.value);
    }
    if (chronicIllness.present) {
      map['chronic_illness'] = Variable<String>(
        $PetsTable.$converterchronicIllnessn.toSql(chronicIllness.value),
      );
    }
    if (iconId.present) {
      map['icon_id'] = Variable<String>(iconId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetsCompanion(')
          ..write('localId: $localId, ')
          ..write('name: $name, ')
          ..write('kinds: $kinds, ')
          ..write('sex: $sex, ')
          ..write('birthdate: $birthdate, ')
          ..write('chronicIllness: $chronicIllness, ')
          ..write('iconId: $iconId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicineTable extends Medicine
    with TableInfo<$MedicineTable, MedicineRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicineTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _effectMeta = const VerificationMeta('effect');
  @override
  late final GeneratedColumn<String> effect = GeneratedColumn<String>(
    'effect',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<int> syncState = GeneratedColumn<int>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    name,
    effect,
    updatedAt,
    deletedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicine';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicineRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('effect')) {
      context.handle(
        _effectMeta,
        effect.isAcceptableOrUnknown(data['effect']!, _effectMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  MedicineRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicineRow(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}local_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      effect: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}effect'],
      ),
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncState:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sync_state'],
          )!,
    );
  }

  @override
  $MedicineTable createAlias(String alias) {
    return $MedicineTable(attachedDatabase, alias);
  }
}

class MedicineRow extends DataClass implements Insertable<MedicineRow> {
  final String localId;
  final String name;
  final String? effect;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;
  const MedicineRow({
    required this.localId,
    required this.name,
    this.effect,
    required this.updatedAt,
    this.deletedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || effect != null) {
      map['effect'] = Variable<String>(effect);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_state'] = Variable<int>(syncState);
    return map;
  }

  MedicineCompanion toCompanion(bool nullToAbsent) {
    return MedicineCompanion(
      localId: Value(localId),
      name: Value(name),
      effect:
          effect == null && nullToAbsent ? const Value.absent() : Value(effect),
      updatedAt: Value(updatedAt),
      deletedAt:
          deletedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(deletedAt),
      syncState: Value(syncState),
    );
  }

  factory MedicineRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicineRow(
      localId: serializer.fromJson<String>(json['localId']),
      name: serializer.fromJson<String>(json['name']),
      effect: serializer.fromJson<String?>(json['effect']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncState: serializer.fromJson<int>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'name': serializer.toJson<String>(name),
      'effect': serializer.toJson<String?>(effect),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncState': serializer.toJson<int>(syncState),
    };
  }

  MedicineRow copyWith({
    String? localId,
    String? name,
    Value<String?> effect = const Value.absent(),
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? syncState,
  }) => MedicineRow(
    localId: localId ?? this.localId,
    name: name ?? this.name,
    effect: effect.present ? effect.value : this.effect,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncState: syncState ?? this.syncState,
  );
  MedicineRow copyWithCompanion(MedicineCompanion data) {
    return MedicineRow(
      localId: data.localId.present ? data.localId.value : this.localId,
      name: data.name.present ? data.name.value : this.name,
      effect: data.effect.present ? data.effect.value : this.effect,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicineRow(')
          ..write('localId: $localId, ')
          ..write('name: $name, ')
          ..write('effect: $effect, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, name, effect, updatedAt, deletedAt, syncState);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicineRow &&
          other.localId == this.localId &&
          other.name == this.name &&
          other.effect == this.effect &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncState == this.syncState);
}

class MedicineCompanion extends UpdateCompanion<MedicineRow> {
  final Value<String> localId;
  final Value<String> name;
  final Value<String?> effect;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> syncState;
  final Value<int> rowid;
  const MedicineCompanion({
    this.localId = const Value.absent(),
    this.name = const Value.absent(),
    this.effect = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicineCompanion.insert({
    required String localId,
    required String name,
    this.effect = const Value.absent(),
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       name = Value(name),
       updatedAt = Value(updatedAt);
  static Insertable<MedicineRow> custom({
    Expression<String>? localId,
    Expression<String>? name,
    Expression<String>? effect,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (name != null) 'name': name,
      if (effect != null) 'effect': effect,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicineCompanion copyWith({
    Value<String>? localId,
    Value<String>? name,
    Value<String?>? effect,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? syncState,
    Value<int>? rowid,
  }) {
    return MedicineCompanion(
      localId: localId ?? this.localId,
      name: name ?? this.name,
      effect: effect ?? this.effect,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (effect.present) {
      map['effect'] = Variable<String>(effect.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicineCompanion(')
          ..write('localId: $localId, ')
          ..write('name: $name, ')
          ..write('effect: $effect, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HospitalsTable extends Hospitals
    with TableInfo<$HospitalsTable, HospitalRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HospitalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _telMeta = const VerificationMeta('tel');
  @override
  late final GeneratedColumn<String> tel = GeneratedColumn<String>(
    'tel',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<int> syncState = GeneratedColumn<int>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    name,
    address,
    tel,
    updatedAt,
    deletedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hospitals';
  @override
  VerificationContext validateIntegrity(
    Insertable<HospitalRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('tel')) {
      context.handle(
        _telMeta,
        tel.isAcceptableOrUnknown(data['tel']!, _telMeta),
      );
    } else if (isInserting) {
      context.missing(_telMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  HospitalRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HospitalRow(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}local_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      address:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}address'],
          )!,
      tel:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}tel'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncState:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sync_state'],
          )!,
    );
  }

  @override
  $HospitalsTable createAlias(String alias) {
    return $HospitalsTable(attachedDatabase, alias);
  }
}

class HospitalRow extends DataClass implements Insertable<HospitalRow> {
  final String localId;
  final String name;
  final String address;
  final String tel;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;
  const HospitalRow({
    required this.localId,
    required this.name,
    required this.address,
    required this.tel,
    required this.updatedAt,
    this.deletedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['tel'] = Variable<String>(tel);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_state'] = Variable<int>(syncState);
    return map;
  }

  HospitalsCompanion toCompanion(bool nullToAbsent) {
    return HospitalsCompanion(
      localId: Value(localId),
      name: Value(name),
      address: Value(address),
      tel: Value(tel),
      updatedAt: Value(updatedAt),
      deletedAt:
          deletedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(deletedAt),
      syncState: Value(syncState),
    );
  }

  factory HospitalRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HospitalRow(
      localId: serializer.fromJson<String>(json['localId']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      tel: serializer.fromJson<String>(json['tel']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncState: serializer.fromJson<int>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'tel': serializer.toJson<String>(tel),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncState': serializer.toJson<int>(syncState),
    };
  }

  HospitalRow copyWith({
    String? localId,
    String? name,
    String? address,
    String? tel,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? syncState,
  }) => HospitalRow(
    localId: localId ?? this.localId,
    name: name ?? this.name,
    address: address ?? this.address,
    tel: tel ?? this.tel,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncState: syncState ?? this.syncState,
  );
  HospitalRow copyWithCompanion(HospitalsCompanion data) {
    return HospitalRow(
      localId: data.localId.present ? data.localId.value : this.localId,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      tel: data.tel.present ? data.tel.value : this.tel,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HospitalRow(')
          ..write('localId: $localId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('tel: $tel, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, name, address, tel, updatedAt, deletedAt, syncState);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HospitalRow &&
          other.localId == this.localId &&
          other.name == this.name &&
          other.address == this.address &&
          other.tel == this.tel &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncState == this.syncState);
}

class HospitalsCompanion extends UpdateCompanion<HospitalRow> {
  final Value<String> localId;
  final Value<String> name;
  final Value<String> address;
  final Value<String> tel;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> syncState;
  final Value<int> rowid;
  const HospitalsCompanion({
    this.localId = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.tel = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HospitalsCompanion.insert({
    required String localId,
    required String name,
    required String address,
    required String tel,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       name = Value(name),
       address = Value(address),
       tel = Value(tel),
       updatedAt = Value(updatedAt);
  static Insertable<HospitalRow> custom({
    Expression<String>? localId,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? tel,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (tel != null) 'tel': tel,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HospitalsCompanion copyWith({
    Value<String>? localId,
    Value<String>? name,
    Value<String>? address,
    Value<String>? tel,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? syncState,
    Value<int>? rowid,
  }) {
    return HospitalsCompanion(
      localId: localId ?? this.localId,
      name: name ?? this.name,
      address: address ?? this.address,
      tel: tel ?? this.tel,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (tel.present) {
      map['tel'] = Variable<String>(tel.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HospitalsCompanion(')
          ..write('localId: $localId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('tel: $tel, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HospitalHistoriesTable extends HospitalHistories
    with TableInfo<$HospitalHistoriesTable, HospitalHistoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HospitalHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pets (local_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _hospitalIdMeta = const VerificationMeta(
    'hospitalId',
  );
  @override
  late final GeneratedColumn<String> hospitalId = GeneratedColumn<String>(
    'hospital_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES hospitals (local_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _symptomMeta = const VerificationMeta(
    'symptom',
  );
  @override
  late final GeneratedColumn<String> symptom = GeneratedColumn<String>(
    'symptom',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _feeMeta = const VerificationMeta('fee');
  @override
  late final GeneratedColumn<int> fee = GeneratedColumn<int>(
    'fee',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<int> syncState = GeneratedColumn<int>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    petId,
    hospitalId,
    date,
    symptom,
    fee,
    memo,
    updatedAt,
    deletedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hospital_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<HospitalHistoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    }
    if (data.containsKey('hospital_id')) {
      context.handle(
        _hospitalIdMeta,
        hospitalId.isAcceptableOrUnknown(data['hospital_id']!, _hospitalIdMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('symptom')) {
      context.handle(
        _symptomMeta,
        symptom.isAcceptableOrUnknown(data['symptom']!, _symptomMeta),
      );
    }
    if (data.containsKey('fee')) {
      context.handle(
        _feeMeta,
        fee.isAcceptableOrUnknown(data['fee']!, _feeMeta),
      );
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  HospitalHistoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HospitalHistoryRow(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}local_id'],
          )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      ),
      hospitalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hospital_id'],
      ),
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      symptom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symptom'],
      ),
      fee: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fee'],
      ),
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      ),
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncState:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sync_state'],
          )!,
    );
  }

  @override
  $HospitalHistoriesTable createAlias(String alias) {
    return $HospitalHistoriesTable(attachedDatabase, alias);
  }
}

class HospitalHistoryRow extends DataClass
    implements Insertable<HospitalHistoryRow> {
  final String localId;
  final String? petId;
  final String? hospitalId;
  final DateTime date;
  final String? symptom;
  final int? fee;
  final String? memo;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;
  const HospitalHistoryRow({
    required this.localId,
    this.petId,
    this.hospitalId,
    required this.date,
    this.symptom,
    this.fee,
    this.memo,
    required this.updatedAt,
    this.deletedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    if (!nullToAbsent || petId != null) {
      map['pet_id'] = Variable<String>(petId);
    }
    if (!nullToAbsent || hospitalId != null) {
      map['hospital_id'] = Variable<String>(hospitalId);
    }
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || symptom != null) {
      map['symptom'] = Variable<String>(symptom);
    }
    if (!nullToAbsent || fee != null) {
      map['fee'] = Variable<int>(fee);
    }
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_state'] = Variable<int>(syncState);
    return map;
  }

  HospitalHistoriesCompanion toCompanion(bool nullToAbsent) {
    return HospitalHistoriesCompanion(
      localId: Value(localId),
      petId:
          petId == null && nullToAbsent ? const Value.absent() : Value(petId),
      hospitalId:
          hospitalId == null && nullToAbsent
              ? const Value.absent()
              : Value(hospitalId),
      date: Value(date),
      symptom:
          symptom == null && nullToAbsent
              ? const Value.absent()
              : Value(symptom),
      fee: fee == null && nullToAbsent ? const Value.absent() : Value(fee),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      updatedAt: Value(updatedAt),
      deletedAt:
          deletedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(deletedAt),
      syncState: Value(syncState),
    );
  }

  factory HospitalHistoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HospitalHistoryRow(
      localId: serializer.fromJson<String>(json['localId']),
      petId: serializer.fromJson<String?>(json['petId']),
      hospitalId: serializer.fromJson<String?>(json['hospitalId']),
      date: serializer.fromJson<DateTime>(json['date']),
      symptom: serializer.fromJson<String?>(json['symptom']),
      fee: serializer.fromJson<int?>(json['fee']),
      memo: serializer.fromJson<String?>(json['memo']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncState: serializer.fromJson<int>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'petId': serializer.toJson<String?>(petId),
      'hospitalId': serializer.toJson<String?>(hospitalId),
      'date': serializer.toJson<DateTime>(date),
      'symptom': serializer.toJson<String?>(symptom),
      'fee': serializer.toJson<int?>(fee),
      'memo': serializer.toJson<String?>(memo),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncState': serializer.toJson<int>(syncState),
    };
  }

  HospitalHistoryRow copyWith({
    String? localId,
    Value<String?> petId = const Value.absent(),
    Value<String?> hospitalId = const Value.absent(),
    DateTime? date,
    Value<String?> symptom = const Value.absent(),
    Value<int?> fee = const Value.absent(),
    Value<String?> memo = const Value.absent(),
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? syncState,
  }) => HospitalHistoryRow(
    localId: localId ?? this.localId,
    petId: petId.present ? petId.value : this.petId,
    hospitalId: hospitalId.present ? hospitalId.value : this.hospitalId,
    date: date ?? this.date,
    symptom: symptom.present ? symptom.value : this.symptom,
    fee: fee.present ? fee.value : this.fee,
    memo: memo.present ? memo.value : this.memo,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncState: syncState ?? this.syncState,
  );
  HospitalHistoryRow copyWithCompanion(HospitalHistoriesCompanion data) {
    return HospitalHistoryRow(
      localId: data.localId.present ? data.localId.value : this.localId,
      petId: data.petId.present ? data.petId.value : this.petId,
      hospitalId:
          data.hospitalId.present ? data.hospitalId.value : this.hospitalId,
      date: data.date.present ? data.date.value : this.date,
      symptom: data.symptom.present ? data.symptom.value : this.symptom,
      fee: data.fee.present ? data.fee.value : this.fee,
      memo: data.memo.present ? data.memo.value : this.memo,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HospitalHistoryRow(')
          ..write('localId: $localId, ')
          ..write('petId: $petId, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('date: $date, ')
          ..write('symptom: $symptom, ')
          ..write('fee: $fee, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    petId,
    hospitalId,
    date,
    symptom,
    fee,
    memo,
    updatedAt,
    deletedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HospitalHistoryRow &&
          other.localId == this.localId &&
          other.petId == this.petId &&
          other.hospitalId == this.hospitalId &&
          other.date == this.date &&
          other.symptom == this.symptom &&
          other.fee == this.fee &&
          other.memo == this.memo &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncState == this.syncState);
}

class HospitalHistoriesCompanion extends UpdateCompanion<HospitalHistoryRow> {
  final Value<String> localId;
  final Value<String?> petId;
  final Value<String?> hospitalId;
  final Value<DateTime> date;
  final Value<String?> symptom;
  final Value<int?> fee;
  final Value<String?> memo;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> syncState;
  final Value<int> rowid;
  const HospitalHistoriesCompanion({
    this.localId = const Value.absent(),
    this.petId = const Value.absent(),
    this.hospitalId = const Value.absent(),
    this.date = const Value.absent(),
    this.symptom = const Value.absent(),
    this.fee = const Value.absent(),
    this.memo = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HospitalHistoriesCompanion.insert({
    required String localId,
    this.petId = const Value.absent(),
    this.hospitalId = const Value.absent(),
    required DateTime date,
    this.symptom = const Value.absent(),
    this.fee = const Value.absent(),
    this.memo = const Value.absent(),
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       date = Value(date),
       updatedAt = Value(updatedAt);
  static Insertable<HospitalHistoryRow> custom({
    Expression<String>? localId,
    Expression<String>? petId,
    Expression<String>? hospitalId,
    Expression<DateTime>? date,
    Expression<String>? symptom,
    Expression<int>? fee,
    Expression<String>? memo,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (petId != null) 'pet_id': petId,
      if (hospitalId != null) 'hospital_id': hospitalId,
      if (date != null) 'date': date,
      if (symptom != null) 'symptom': symptom,
      if (fee != null) 'fee': fee,
      if (memo != null) 'memo': memo,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HospitalHistoriesCompanion copyWith({
    Value<String>? localId,
    Value<String?>? petId,
    Value<String?>? hospitalId,
    Value<DateTime>? date,
    Value<String?>? symptom,
    Value<int?>? fee,
    Value<String?>? memo,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? syncState,
    Value<int>? rowid,
  }) {
    return HospitalHistoriesCompanion(
      localId: localId ?? this.localId,
      petId: petId ?? this.petId,
      hospitalId: hospitalId ?? this.hospitalId,
      date: date ?? this.date,
      symptom: symptom ?? this.symptom,
      fee: fee ?? this.fee,
      memo: memo ?? this.memo,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (hospitalId.present) {
      map['hospital_id'] = Variable<String>(hospitalId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (symptom.present) {
      map['symptom'] = Variable<String>(symptom.value);
    }
    if (fee.present) {
      map['fee'] = Variable<int>(fee.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HospitalHistoriesCompanion(')
          ..write('localId: $localId, ')
          ..write('petId: $petId, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('date: $date, ')
          ..write('symptom: $symptom, ')
          ..write('fee: $fee, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicineHistoriesTable extends MedicineHistories
    with TableInfo<$MedicineHistoriesTable, MedicineHistoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicineHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pets (local_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _hospitalIdMeta = const VerificationMeta(
    'hospitalId',
  );
  @override
  late final GeneratedColumn<String> hospitalId = GeneratedColumn<String>(
    'hospital_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES hospitals (local_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _medicineIdMeta = const VerificationMeta(
    'medicineId',
  );
  @override
  late final GeneratedColumn<String> medicineId = GeneratedColumn<String>(
    'medicine_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medicine (local_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<int> syncState = GeneratedColumn<int>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    petId,
    hospitalId,
    medicineId,
    date,
    memo,
    updatedAt,
    deletedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicine_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicineHistoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    }
    if (data.containsKey('hospital_id')) {
      context.handle(
        _hospitalIdMeta,
        hospitalId.isAcceptableOrUnknown(data['hospital_id']!, _hospitalIdMeta),
      );
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
        _medicineIdMeta,
        medicineId.isAcceptableOrUnknown(data['medicine_id']!, _medicineIdMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  MedicineHistoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicineHistoryRow(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}local_id'],
          )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      ),
      hospitalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hospital_id'],
      ),
      medicineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medicine_id'],
      ),
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      ),
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncState:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sync_state'],
          )!,
    );
  }

  @override
  $MedicineHistoriesTable createAlias(String alias) {
    return $MedicineHistoriesTable(attachedDatabase, alias);
  }
}

class MedicineHistoryRow extends DataClass
    implements Insertable<MedicineHistoryRow> {
  final String localId;
  final String? petId;
  final String? hospitalId;
  final String? medicineId;
  final DateTime date;
  final String? memo;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;
  const MedicineHistoryRow({
    required this.localId,
    this.petId,
    this.hospitalId,
    this.medicineId,
    required this.date,
    this.memo,
    required this.updatedAt,
    this.deletedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    if (!nullToAbsent || petId != null) {
      map['pet_id'] = Variable<String>(petId);
    }
    if (!nullToAbsent || hospitalId != null) {
      map['hospital_id'] = Variable<String>(hospitalId);
    }
    if (!nullToAbsent || medicineId != null) {
      map['medicine_id'] = Variable<String>(medicineId);
    }
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_state'] = Variable<int>(syncState);
    return map;
  }

  MedicineHistoriesCompanion toCompanion(bool nullToAbsent) {
    return MedicineHistoriesCompanion(
      localId: Value(localId),
      petId:
          petId == null && nullToAbsent ? const Value.absent() : Value(petId),
      hospitalId:
          hospitalId == null && nullToAbsent
              ? const Value.absent()
              : Value(hospitalId),
      medicineId:
          medicineId == null && nullToAbsent
              ? const Value.absent()
              : Value(medicineId),
      date: Value(date),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      updatedAt: Value(updatedAt),
      deletedAt:
          deletedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(deletedAt),
      syncState: Value(syncState),
    );
  }

  factory MedicineHistoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicineHistoryRow(
      localId: serializer.fromJson<String>(json['localId']),
      petId: serializer.fromJson<String?>(json['petId']),
      hospitalId: serializer.fromJson<String?>(json['hospitalId']),
      medicineId: serializer.fromJson<String?>(json['medicineId']),
      date: serializer.fromJson<DateTime>(json['date']),
      memo: serializer.fromJson<String?>(json['memo']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncState: serializer.fromJson<int>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'petId': serializer.toJson<String?>(petId),
      'hospitalId': serializer.toJson<String?>(hospitalId),
      'medicineId': serializer.toJson<String?>(medicineId),
      'date': serializer.toJson<DateTime>(date),
      'memo': serializer.toJson<String?>(memo),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncState': serializer.toJson<int>(syncState),
    };
  }

  MedicineHistoryRow copyWith({
    String? localId,
    Value<String?> petId = const Value.absent(),
    Value<String?> hospitalId = const Value.absent(),
    Value<String?> medicineId = const Value.absent(),
    DateTime? date,
    Value<String?> memo = const Value.absent(),
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? syncState,
  }) => MedicineHistoryRow(
    localId: localId ?? this.localId,
    petId: petId.present ? petId.value : this.petId,
    hospitalId: hospitalId.present ? hospitalId.value : this.hospitalId,
    medicineId: medicineId.present ? medicineId.value : this.medicineId,
    date: date ?? this.date,
    memo: memo.present ? memo.value : this.memo,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncState: syncState ?? this.syncState,
  );
  MedicineHistoryRow copyWithCompanion(MedicineHistoriesCompanion data) {
    return MedicineHistoryRow(
      localId: data.localId.present ? data.localId.value : this.localId,
      petId: data.petId.present ? data.petId.value : this.petId,
      hospitalId:
          data.hospitalId.present ? data.hospitalId.value : this.hospitalId,
      medicineId:
          data.medicineId.present ? data.medicineId.value : this.medicineId,
      date: data.date.present ? data.date.value : this.date,
      memo: data.memo.present ? data.memo.value : this.memo,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicineHistoryRow(')
          ..write('localId: $localId, ')
          ..write('petId: $petId, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('medicineId: $medicineId, ')
          ..write('date: $date, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    petId,
    hospitalId,
    medicineId,
    date,
    memo,
    updatedAt,
    deletedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicineHistoryRow &&
          other.localId == this.localId &&
          other.petId == this.petId &&
          other.hospitalId == this.hospitalId &&
          other.medicineId == this.medicineId &&
          other.date == this.date &&
          other.memo == this.memo &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncState == this.syncState);
}

class MedicineHistoriesCompanion extends UpdateCompanion<MedicineHistoryRow> {
  final Value<String> localId;
  final Value<String?> petId;
  final Value<String?> hospitalId;
  final Value<String?> medicineId;
  final Value<DateTime> date;
  final Value<String?> memo;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> syncState;
  final Value<int> rowid;
  const MedicineHistoriesCompanion({
    this.localId = const Value.absent(),
    this.petId = const Value.absent(),
    this.hospitalId = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.date = const Value.absent(),
    this.memo = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicineHistoriesCompanion.insert({
    required String localId,
    this.petId = const Value.absent(),
    this.hospitalId = const Value.absent(),
    this.medicineId = const Value.absent(),
    required DateTime date,
    this.memo = const Value.absent(),
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       date = Value(date),
       updatedAt = Value(updatedAt);
  static Insertable<MedicineHistoryRow> custom({
    Expression<String>? localId,
    Expression<String>? petId,
    Expression<String>? hospitalId,
    Expression<String>? medicineId,
    Expression<DateTime>? date,
    Expression<String>? memo,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (petId != null) 'pet_id': petId,
      if (hospitalId != null) 'hospital_id': hospitalId,
      if (medicineId != null) 'medicine_id': medicineId,
      if (date != null) 'date': date,
      if (memo != null) 'memo': memo,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicineHistoriesCompanion copyWith({
    Value<String>? localId,
    Value<String?>? petId,
    Value<String?>? hospitalId,
    Value<String?>? medicineId,
    Value<DateTime>? date,
    Value<String?>? memo,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? syncState,
    Value<int>? rowid,
  }) {
    return MedicineHistoriesCompanion(
      localId: localId ?? this.localId,
      petId: petId ?? this.petId,
      hospitalId: hospitalId ?? this.hospitalId,
      medicineId: medicineId ?? this.medicineId,
      date: date ?? this.date,
      memo: memo ?? this.memo,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (hospitalId.present) {
      map['hospital_id'] = Variable<String>(hospitalId.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<String>(medicineId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicineHistoriesCompanion(')
          ..write('localId: $localId, ')
          ..write('petId: $petId, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('medicineId: $medicineId, ')
          ..write('date: $date, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VaccinesTable extends Vaccines
    with TableInfo<$VaccinesTable, VaccineRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VaccinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<int> syncState = GeneratedColumn<int>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    name,
    memo,
    updatedAt,
    deletedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vaccines';
  @override
  VerificationContext validateIntegrity(
    Insertable<VaccineRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  VaccineRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VaccineRow(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}local_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      ),
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncState:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sync_state'],
          )!,
    );
  }

  @override
  $VaccinesTable createAlias(String alias) {
    return $VaccinesTable(attachedDatabase, alias);
  }
}

class VaccineRow extends DataClass implements Insertable<VaccineRow> {
  final String localId;
  final String name;
  final String? memo;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;
  const VaccineRow({
    required this.localId,
    required this.name,
    this.memo,
    required this.updatedAt,
    this.deletedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_state'] = Variable<int>(syncState);
    return map;
  }

  VaccinesCompanion toCompanion(bool nullToAbsent) {
    return VaccinesCompanion(
      localId: Value(localId),
      name: Value(name),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      updatedAt: Value(updatedAt),
      deletedAt:
          deletedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(deletedAt),
      syncState: Value(syncState),
    );
  }

  factory VaccineRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VaccineRow(
      localId: serializer.fromJson<String>(json['localId']),
      name: serializer.fromJson<String>(json['name']),
      memo: serializer.fromJson<String?>(json['memo']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncState: serializer.fromJson<int>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'name': serializer.toJson<String>(name),
      'memo': serializer.toJson<String?>(memo),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncState': serializer.toJson<int>(syncState),
    };
  }

  VaccineRow copyWith({
    String? localId,
    String? name,
    Value<String?> memo = const Value.absent(),
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? syncState,
  }) => VaccineRow(
    localId: localId ?? this.localId,
    name: name ?? this.name,
    memo: memo.present ? memo.value : this.memo,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncState: syncState ?? this.syncState,
  );
  VaccineRow copyWithCompanion(VaccinesCompanion data) {
    return VaccineRow(
      localId: data.localId.present ? data.localId.value : this.localId,
      name: data.name.present ? data.name.value : this.name,
      memo: data.memo.present ? data.memo.value : this.memo,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VaccineRow(')
          ..write('localId: $localId, ')
          ..write('name: $name, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, name, memo, updatedAt, deletedAt, syncState);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VaccineRow &&
          other.localId == this.localId &&
          other.name == this.name &&
          other.memo == this.memo &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncState == this.syncState);
}

class VaccinesCompanion extends UpdateCompanion<VaccineRow> {
  final Value<String> localId;
  final Value<String> name;
  final Value<String?> memo;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> syncState;
  final Value<int> rowid;
  const VaccinesCompanion({
    this.localId = const Value.absent(),
    this.name = const Value.absent(),
    this.memo = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VaccinesCompanion.insert({
    required String localId,
    required String name,
    this.memo = const Value.absent(),
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       name = Value(name),
       updatedAt = Value(updatedAt);
  static Insertable<VaccineRow> custom({
    Expression<String>? localId,
    Expression<String>? name,
    Expression<String>? memo,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (name != null) 'name': name,
      if (memo != null) 'memo': memo,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VaccinesCompanion copyWith({
    Value<String>? localId,
    Value<String>? name,
    Value<String?>? memo,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? syncState,
    Value<int>? rowid,
  }) {
    return VaccinesCompanion(
      localId: localId ?? this.localId,
      name: name ?? this.name,
      memo: memo ?? this.memo,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VaccinesCompanion(')
          ..write('localId: $localId, ')
          ..write('name: $name, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VaccineHistoriesTable extends VaccineHistories
    with TableInfo<$VaccineHistoriesTable, VaccineHistoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VaccineHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pets (local_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _hospitalIdMeta = const VerificationMeta(
    'hospitalId',
  );
  @override
  late final GeneratedColumn<String> hospitalId = GeneratedColumn<String>(
    'hospital_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES hospitals (local_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _vaccineIdMeta = const VerificationMeta(
    'vaccineId',
  );
  @override
  late final GeneratedColumn<String> vaccineId = GeneratedColumn<String>(
    'vaccine_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vaccines (local_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<int> syncState = GeneratedColumn<int>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    petId,
    hospitalId,
    vaccineId,
    date,
    memo,
    updatedAt,
    deletedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vaccine_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<VaccineHistoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    }
    if (data.containsKey('hospital_id')) {
      context.handle(
        _hospitalIdMeta,
        hospitalId.isAcceptableOrUnknown(data['hospital_id']!, _hospitalIdMeta),
      );
    }
    if (data.containsKey('vaccine_id')) {
      context.handle(
        _vaccineIdMeta,
        vaccineId.isAcceptableOrUnknown(data['vaccine_id']!, _vaccineIdMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  VaccineHistoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VaccineHistoryRow(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}local_id'],
          )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      ),
      hospitalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hospital_id'],
      ),
      vaccineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vaccine_id'],
      ),
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      ),
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncState:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sync_state'],
          )!,
    );
  }

  @override
  $VaccineHistoriesTable createAlias(String alias) {
    return $VaccineHistoriesTable(attachedDatabase, alias);
  }
}

class VaccineHistoryRow extends DataClass
    implements Insertable<VaccineHistoryRow> {
  final String localId;
  final String? petId;
  final String? hospitalId;
  final String? vaccineId;
  final DateTime date;
  final String? memo;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;
  const VaccineHistoryRow({
    required this.localId,
    this.petId,
    this.hospitalId,
    this.vaccineId,
    required this.date,
    this.memo,
    required this.updatedAt,
    this.deletedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    if (!nullToAbsent || petId != null) {
      map['pet_id'] = Variable<String>(petId);
    }
    if (!nullToAbsent || hospitalId != null) {
      map['hospital_id'] = Variable<String>(hospitalId);
    }
    if (!nullToAbsent || vaccineId != null) {
      map['vaccine_id'] = Variable<String>(vaccineId);
    }
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_state'] = Variable<int>(syncState);
    return map;
  }

  VaccineHistoriesCompanion toCompanion(bool nullToAbsent) {
    return VaccineHistoriesCompanion(
      localId: Value(localId),
      petId:
          petId == null && nullToAbsent ? const Value.absent() : Value(petId),
      hospitalId:
          hospitalId == null && nullToAbsent
              ? const Value.absent()
              : Value(hospitalId),
      vaccineId:
          vaccineId == null && nullToAbsent
              ? const Value.absent()
              : Value(vaccineId),
      date: Value(date),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      updatedAt: Value(updatedAt),
      deletedAt:
          deletedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(deletedAt),
      syncState: Value(syncState),
    );
  }

  factory VaccineHistoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VaccineHistoryRow(
      localId: serializer.fromJson<String>(json['localId']),
      petId: serializer.fromJson<String?>(json['petId']),
      hospitalId: serializer.fromJson<String?>(json['hospitalId']),
      vaccineId: serializer.fromJson<String?>(json['vaccineId']),
      date: serializer.fromJson<DateTime>(json['date']),
      memo: serializer.fromJson<String?>(json['memo']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncState: serializer.fromJson<int>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'petId': serializer.toJson<String?>(petId),
      'hospitalId': serializer.toJson<String?>(hospitalId),
      'vaccineId': serializer.toJson<String?>(vaccineId),
      'date': serializer.toJson<DateTime>(date),
      'memo': serializer.toJson<String?>(memo),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncState': serializer.toJson<int>(syncState),
    };
  }

  VaccineHistoryRow copyWith({
    String? localId,
    Value<String?> petId = const Value.absent(),
    Value<String?> hospitalId = const Value.absent(),
    Value<String?> vaccineId = const Value.absent(),
    DateTime? date,
    Value<String?> memo = const Value.absent(),
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? syncState,
  }) => VaccineHistoryRow(
    localId: localId ?? this.localId,
    petId: petId.present ? petId.value : this.petId,
    hospitalId: hospitalId.present ? hospitalId.value : this.hospitalId,
    vaccineId: vaccineId.present ? vaccineId.value : this.vaccineId,
    date: date ?? this.date,
    memo: memo.present ? memo.value : this.memo,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncState: syncState ?? this.syncState,
  );
  VaccineHistoryRow copyWithCompanion(VaccineHistoriesCompanion data) {
    return VaccineHistoryRow(
      localId: data.localId.present ? data.localId.value : this.localId,
      petId: data.petId.present ? data.petId.value : this.petId,
      hospitalId:
          data.hospitalId.present ? data.hospitalId.value : this.hospitalId,
      vaccineId: data.vaccineId.present ? data.vaccineId.value : this.vaccineId,
      date: data.date.present ? data.date.value : this.date,
      memo: data.memo.present ? data.memo.value : this.memo,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VaccineHistoryRow(')
          ..write('localId: $localId, ')
          ..write('petId: $petId, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('vaccineId: $vaccineId, ')
          ..write('date: $date, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    petId,
    hospitalId,
    vaccineId,
    date,
    memo,
    updatedAt,
    deletedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VaccineHistoryRow &&
          other.localId == this.localId &&
          other.petId == this.petId &&
          other.hospitalId == this.hospitalId &&
          other.vaccineId == this.vaccineId &&
          other.date == this.date &&
          other.memo == this.memo &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncState == this.syncState);
}

class VaccineHistoriesCompanion extends UpdateCompanion<VaccineHistoryRow> {
  final Value<String> localId;
  final Value<String?> petId;
  final Value<String?> hospitalId;
  final Value<String?> vaccineId;
  final Value<DateTime> date;
  final Value<String?> memo;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> syncState;
  final Value<int> rowid;
  const VaccineHistoriesCompanion({
    this.localId = const Value.absent(),
    this.petId = const Value.absent(),
    this.hospitalId = const Value.absent(),
    this.vaccineId = const Value.absent(),
    this.date = const Value.absent(),
    this.memo = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VaccineHistoriesCompanion.insert({
    required String localId,
    this.petId = const Value.absent(),
    this.hospitalId = const Value.absent(),
    this.vaccineId = const Value.absent(),
    required DateTime date,
    this.memo = const Value.absent(),
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       date = Value(date),
       updatedAt = Value(updatedAt);
  static Insertable<VaccineHistoryRow> custom({
    Expression<String>? localId,
    Expression<String>? petId,
    Expression<String>? hospitalId,
    Expression<String>? vaccineId,
    Expression<DateTime>? date,
    Expression<String>? memo,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (petId != null) 'pet_id': petId,
      if (hospitalId != null) 'hospital_id': hospitalId,
      if (vaccineId != null) 'vaccine_id': vaccineId,
      if (date != null) 'date': date,
      if (memo != null) 'memo': memo,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VaccineHistoriesCompanion copyWith({
    Value<String>? localId,
    Value<String?>? petId,
    Value<String?>? hospitalId,
    Value<String?>? vaccineId,
    Value<DateTime>? date,
    Value<String?>? memo,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? syncState,
    Value<int>? rowid,
  }) {
    return VaccineHistoriesCompanion(
      localId: localId ?? this.localId,
      petId: petId ?? this.petId,
      hospitalId: hospitalId ?? this.hospitalId,
      vaccineId: vaccineId ?? this.vaccineId,
      date: date ?? this.date,
      memo: memo ?? this.memo,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (hospitalId.present) {
      map['hospital_id'] = Variable<String>(hospitalId.value);
    }
    if (vaccineId.present) {
      map['vaccine_id'] = Variable<String>(vaccineId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VaccineHistoriesCompanion(')
          ..write('localId: $localId, ')
          ..write('petId: $petId, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('vaccineId: $vaccineId, ')
          ..write('date: $date, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PetDiariesTable extends PetDiaries
    with TableInfo<$PetDiariesTable, PetDiaryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetDiariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pets (local_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<int> syncState = GeneratedColumn<int>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    petId,
    date,
    title,
    content,
    updatedAt,
    deletedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pet_diaries';
  @override
  VerificationContext validateIntegrity(
    Insertable<PetDiaryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  PetDiaryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PetDiaryRow(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}local_id'],
          )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      ),
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      content:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}content'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncState:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sync_state'],
          )!,
    );
  }

  @override
  $PetDiariesTable createAlias(String alias) {
    return $PetDiariesTable(attachedDatabase, alias);
  }
}

class PetDiaryRow extends DataClass implements Insertable<PetDiaryRow> {
  final String localId;
  final String? petId;
  final DateTime date;
  final String title;
  final String content;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;
  const PetDiaryRow({
    required this.localId,
    this.petId,
    required this.date,
    required this.title,
    required this.content,
    required this.updatedAt,
    this.deletedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    if (!nullToAbsent || petId != null) {
      map['pet_id'] = Variable<String>(petId);
    }
    map['date'] = Variable<DateTime>(date);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_state'] = Variable<int>(syncState);
    return map;
  }

  PetDiariesCompanion toCompanion(bool nullToAbsent) {
    return PetDiariesCompanion(
      localId: Value(localId),
      petId:
          petId == null && nullToAbsent ? const Value.absent() : Value(petId),
      date: Value(date),
      title: Value(title),
      content: Value(content),
      updatedAt: Value(updatedAt),
      deletedAt:
          deletedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(deletedAt),
      syncState: Value(syncState),
    );
  }

  factory PetDiaryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PetDiaryRow(
      localId: serializer.fromJson<String>(json['localId']),
      petId: serializer.fromJson<String?>(json['petId']),
      date: serializer.fromJson<DateTime>(json['date']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncState: serializer.fromJson<int>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'petId': serializer.toJson<String?>(petId),
      'date': serializer.toJson<DateTime>(date),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncState': serializer.toJson<int>(syncState),
    };
  }

  PetDiaryRow copyWith({
    String? localId,
    Value<String?> petId = const Value.absent(),
    DateTime? date,
    String? title,
    String? content,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? syncState,
  }) => PetDiaryRow(
    localId: localId ?? this.localId,
    petId: petId.present ? petId.value : this.petId,
    date: date ?? this.date,
    title: title ?? this.title,
    content: content ?? this.content,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncState: syncState ?? this.syncState,
  );
  PetDiaryRow copyWithCompanion(PetDiariesCompanion data) {
    return PetDiaryRow(
      localId: data.localId.present ? data.localId.value : this.localId,
      petId: data.petId.present ? data.petId.value : this.petId,
      date: data.date.present ? data.date.value : this.date,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PetDiaryRow(')
          ..write('localId: $localId, ')
          ..write('petId: $petId, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    petId,
    date,
    title,
    content,
    updatedAt,
    deletedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PetDiaryRow &&
          other.localId == this.localId &&
          other.petId == this.petId &&
          other.date == this.date &&
          other.title == this.title &&
          other.content == this.content &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncState == this.syncState);
}

class PetDiariesCompanion extends UpdateCompanion<PetDiaryRow> {
  final Value<String> localId;
  final Value<String?> petId;
  final Value<DateTime> date;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> syncState;
  final Value<int> rowid;
  const PetDiariesCompanion({
    this.localId = const Value.absent(),
    this.petId = const Value.absent(),
    this.date = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PetDiariesCompanion.insert({
    required String localId,
    this.petId = const Value.absent(),
    required DateTime date,
    required String title,
    required String content,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       date = Value(date),
       title = Value(title),
       content = Value(content),
       updatedAt = Value(updatedAt);
  static Insertable<PetDiaryRow> custom({
    Expression<String>? localId,
    Expression<String>? petId,
    Expression<DateTime>? date,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (petId != null) 'pet_id': petId,
      if (date != null) 'date': date,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PetDiariesCompanion copyWith({
    Value<String>? localId,
    Value<String?>? petId,
    Value<DateTime>? date,
    Value<String>? title,
    Value<String>? content,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? syncState,
    Value<int>? rowid,
  }) {
    return PetDiariesCompanion(
      localId: localId ?? this.localId,
      petId: petId ?? this.petId,
      date: date ?? this.date,
      title: title ?? this.title,
      content: content ?? this.content,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetDiariesCompanion(')
          ..write('localId: $localId, ')
          ..write('petId: $petId, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PetsTable pets = $PetsTable(this);
  late final $MedicineTable medicine = $MedicineTable(this);
  late final $HospitalsTable hospitals = $HospitalsTable(this);
  late final $HospitalHistoriesTable hospitalHistories =
      $HospitalHistoriesTable(this);
  late final $MedicineHistoriesTable medicineHistories =
      $MedicineHistoriesTable(this);
  late final $VaccinesTable vaccines = $VaccinesTable(this);
  late final $VaccineHistoriesTable vaccineHistories = $VaccineHistoriesTable(
    this,
  );
  late final $PetDiariesTable petDiaries = $PetDiariesTable(this);
  late final PetDao petDao = PetDao(this as AppDatabase);
  late final MedicineDao medicineDao = MedicineDao(this as AppDatabase);
  late final HospitalDao hospitalDao = HospitalDao(this as AppDatabase);
  late final HospitalHistoryDao hospitalHistoryDao = HospitalHistoryDao(
    this as AppDatabase,
  );
  late final MedicineHistoryDao medicineHistoryDao = MedicineHistoryDao(
    this as AppDatabase,
  );
  late final VaccineDao vaccineDao = VaccineDao(this as AppDatabase);
  late final VaccineHistoryDao vaccineHistoryDao = VaccineHistoryDao(
    this as AppDatabase,
  );
  late final PetDiaryDao petDiaryDao = PetDiaryDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    pets,
    medicine,
    hospitals,
    hospitalHistories,
    medicineHistories,
    vaccines,
    vaccineHistories,
    petDiaries,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('hospital_histories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'hospitals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('hospital_histories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('medicine_histories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'hospitals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('medicine_histories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'medicine',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('medicine_histories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('vaccine_histories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'hospitals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('vaccine_histories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'vaccines',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('vaccine_histories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('pet_diaries', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$PetsTableCreateCompanionBuilder =
    PetsCompanion Function({
      required String localId,
      required String name,
      required String kinds,
      required int sex,
      Value<DateTime?> birthdate,
      Value<List<String>?> chronicIllness,
      Value<String?> iconId,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });
typedef $$PetsTableUpdateCompanionBuilder =
    PetsCompanion Function({
      Value<String> localId,
      Value<String> name,
      Value<String> kinds,
      Value<int> sex,
      Value<DateTime?> birthdate,
      Value<List<String>?> chronicIllness,
      Value<String?> iconId,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });

final class $$PetsTableReferences
    extends BaseReferences<_$AppDatabase, $PetsTable, PetRow> {
  $$PetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HospitalHistoriesTable, List<HospitalHistoryRow>>
  _hospitalHistoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.hospitalHistories,
        aliasName: $_aliasNameGenerator(
          db.pets.localId,
          db.hospitalHistories.petId,
        ),
      );

  $$HospitalHistoriesTableProcessedTableManager get hospitalHistoriesRefs {
    final manager = $$HospitalHistoriesTableTableManager(
      $_db,
      $_db.hospitalHistories,
    ).filter(
      (f) => f.petId.localId.sqlEquals($_itemColumn<String>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _hospitalHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MedicineHistoriesTable, List<MedicineHistoryRow>>
  _medicineHistoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.medicineHistories,
        aliasName: $_aliasNameGenerator(
          db.pets.localId,
          db.medicineHistories.petId,
        ),
      );

  $$MedicineHistoriesTableProcessedTableManager get medicineHistoriesRefs {
    final manager = $$MedicineHistoriesTableTableManager(
      $_db,
      $_db.medicineHistories,
    ).filter(
      (f) => f.petId.localId.sqlEquals($_itemColumn<String>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _medicineHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VaccineHistoriesTable, List<VaccineHistoryRow>>
  _vaccineHistoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vaccineHistories,
    aliasName: $_aliasNameGenerator(db.pets.localId, db.vaccineHistories.petId),
  );

  $$VaccineHistoriesTableProcessedTableManager get vaccineHistoriesRefs {
    final manager = $$VaccineHistoriesTableTableManager(
      $_db,
      $_db.vaccineHistories,
    ).filter(
      (f) => f.petId.localId.sqlEquals($_itemColumn<String>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _vaccineHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PetDiariesTable, List<PetDiaryRow>>
  _petDiariesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.petDiaries,
    aliasName: $_aliasNameGenerator(db.pets.localId, db.petDiaries.petId),
  );

  $$PetDiariesTableProcessedTableManager get petDiariesRefs {
    final manager = $$PetDiariesTableTableManager($_db, $_db.petDiaries).filter(
      (f) => f.petId.localId.sqlEquals($_itemColumn<String>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_petDiariesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PetsTableFilterComposer extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kinds => $composableBuilder(
    column: $table.kinds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthdate => $composableBuilder(
    column: $table.birthdate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get chronicIllness => $composableBuilder(
    column: $table.chronicIllness,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get iconId => $composableBuilder(
    column: $table.iconId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> hospitalHistoriesRefs(
    Expression<bool> Function($$HospitalHistoriesTableFilterComposer f) f,
  ) {
    final $$HospitalHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.hospitalHistories,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.hospitalHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicineHistoriesRefs(
    Expression<bool> Function($$MedicineHistoriesTableFilterComposer f) f,
  ) {
    final $$MedicineHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.medicineHistories,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.medicineHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> vaccineHistoriesRefs(
    Expression<bool> Function($$VaccineHistoriesTableFilterComposer f) f,
  ) {
    final $$VaccineHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.vaccineHistories,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VaccineHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.vaccineHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> petDiariesRefs(
    Expression<bool> Function($$PetDiariesTableFilterComposer f) f,
  ) {
    final $$PetDiariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.petDiaries,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetDiariesTableFilterComposer(
            $db: $db,
            $table: $db.petDiaries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PetsTableOrderingComposer extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kinds => $composableBuilder(
    column: $table.kinds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthdate => $composableBuilder(
    column: $table.birthdate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chronicIllness => $composableBuilder(
    column: $table.chronicIllness,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconId => $composableBuilder(
    column: $table.iconId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get kinds =>
      $composableBuilder(column: $table.kinds, builder: (column) => column);

  GeneratedColumn<int> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<DateTime> get birthdate =>
      $composableBuilder(column: $table.birthdate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get chronicIllness =>
      $composableBuilder(
        column: $table.chronicIllness,
        builder: (column) => column,
      );

  GeneratedColumn<String> get iconId =>
      $composableBuilder(column: $table.iconId, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  Expression<T> hospitalHistoriesRefs<T extends Object>(
    Expression<T> Function($$HospitalHistoriesTableAnnotationComposer a) f,
  ) {
    final $$HospitalHistoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.hospitalHistories,
          getReferencedColumn: (t) => t.petId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HospitalHistoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.hospitalHistories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> medicineHistoriesRefs<T extends Object>(
    Expression<T> Function($$MedicineHistoriesTableAnnotationComposer a) f,
  ) {
    final $$MedicineHistoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.medicineHistories,
          getReferencedColumn: (t) => t.petId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MedicineHistoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.medicineHistories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> vaccineHistoriesRefs<T extends Object>(
    Expression<T> Function($$VaccineHistoriesTableAnnotationComposer a) f,
  ) {
    final $$VaccineHistoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.vaccineHistories,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VaccineHistoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.vaccineHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> petDiariesRefs<T extends Object>(
    Expression<T> Function($$PetDiariesTableAnnotationComposer a) f,
  ) {
    final $$PetDiariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.petDiaries,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetDiariesTableAnnotationComposer(
            $db: $db,
            $table: $db.petDiaries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PetsTable,
          PetRow,
          $$PetsTableFilterComposer,
          $$PetsTableOrderingComposer,
          $$PetsTableAnnotationComposer,
          $$PetsTableCreateCompanionBuilder,
          $$PetsTableUpdateCompanionBuilder,
          (PetRow, $$PetsTableReferences),
          PetRow,
          PrefetchHooks Function({
            bool hospitalHistoriesRefs,
            bool medicineHistoriesRefs,
            bool vaccineHistoriesRefs,
            bool petDiariesRefs,
          })
        > {
  $$PetsTableTableManager(_$AppDatabase db, $PetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> kinds = const Value.absent(),
                Value<int> sex = const Value.absent(),
                Value<DateTime?> birthdate = const Value.absent(),
                Value<List<String>?> chronicIllness = const Value.absent(),
                Value<String?> iconId = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetsCompanion(
                localId: localId,
                name: name,
                kinds: kinds,
                sex: sex,
                birthdate: birthdate,
                chronicIllness: chronicIllness,
                iconId: iconId,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                required String name,
                required String kinds,
                required int sex,
                Value<DateTime?> birthdate = const Value.absent(),
                Value<List<String>?> chronicIllness = const Value.absent(),
                Value<String?> iconId = const Value.absent(),
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetsCompanion.insert(
                localId: localId,
                name: name,
                kinds: kinds,
                sex: sex,
                birthdate: birthdate,
                chronicIllness: chronicIllness,
                iconId: iconId,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$PetsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            hospitalHistoriesRefs = false,
            medicineHistoriesRefs = false,
            vaccineHistoriesRefs = false,
            petDiariesRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (hospitalHistoriesRefs) db.hospitalHistories,
                if (medicineHistoriesRefs) db.medicineHistories,
                if (vaccineHistoriesRefs) db.vaccineHistories,
                if (petDiariesRefs) db.petDiaries,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (hospitalHistoriesRefs)
                    await $_getPrefetchedData<
                      PetRow,
                      $PetsTable,
                      HospitalHistoryRow
                    >(
                      currentTable: table,
                      referencedTable: $$PetsTableReferences
                          ._hospitalHistoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$PetsTableReferences(
                                db,
                                table,
                                p0,
                              ).hospitalHistoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.petId == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (medicineHistoriesRefs)
                    await $_getPrefetchedData<
                      PetRow,
                      $PetsTable,
                      MedicineHistoryRow
                    >(
                      currentTable: table,
                      referencedTable: $$PetsTableReferences
                          ._medicineHistoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$PetsTableReferences(
                                db,
                                table,
                                p0,
                              ).medicineHistoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.petId == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (vaccineHistoriesRefs)
                    await $_getPrefetchedData<
                      PetRow,
                      $PetsTable,
                      VaccineHistoryRow
                    >(
                      currentTable: table,
                      referencedTable: $$PetsTableReferences
                          ._vaccineHistoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$PetsTableReferences(
                                db,
                                table,
                                p0,
                              ).vaccineHistoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.petId == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (petDiariesRefs)
                    await $_getPrefetchedData<PetRow, $PetsTable, PetDiaryRow>(
                      currentTable: table,
                      referencedTable: $$PetsTableReferences
                          ._petDiariesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$PetsTableReferences(
                                db,
                                table,
                                p0,
                              ).petDiariesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.petId == item.localId,
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

typedef $$PetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PetsTable,
      PetRow,
      $$PetsTableFilterComposer,
      $$PetsTableOrderingComposer,
      $$PetsTableAnnotationComposer,
      $$PetsTableCreateCompanionBuilder,
      $$PetsTableUpdateCompanionBuilder,
      (PetRow, $$PetsTableReferences),
      PetRow,
      PrefetchHooks Function({
        bool hospitalHistoriesRefs,
        bool medicineHistoriesRefs,
        bool vaccineHistoriesRefs,
        bool petDiariesRefs,
      })
    >;
typedef $$MedicineTableCreateCompanionBuilder =
    MedicineCompanion Function({
      required String localId,
      required String name,
      Value<String?> effect,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });
typedef $$MedicineTableUpdateCompanionBuilder =
    MedicineCompanion Function({
      Value<String> localId,
      Value<String> name,
      Value<String?> effect,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });

final class $$MedicineTableReferences
    extends BaseReferences<_$AppDatabase, $MedicineTable, MedicineRow> {
  $$MedicineTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MedicineHistoriesTable, List<MedicineHistoryRow>>
  _medicineHistoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.medicineHistories,
        aliasName: $_aliasNameGenerator(
          db.medicine.localId,
          db.medicineHistories.medicineId,
        ),
      );

  $$MedicineHistoriesTableProcessedTableManager get medicineHistoriesRefs {
    final manager = $$MedicineHistoriesTableTableManager(
      $_db,
      $_db.medicineHistories,
    ).filter(
      (f) => f.medicineId.localId.sqlEquals($_itemColumn<String>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _medicineHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MedicineTableFilterComposer
    extends Composer<_$AppDatabase, $MedicineTable> {
  $$MedicineTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get effect => $composableBuilder(
    column: $table.effect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> medicineHistoriesRefs(
    Expression<bool> Function($$MedicineHistoriesTableFilterComposer f) f,
  ) {
    final $$MedicineHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.medicineHistories,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.medicineHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicineTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicineTable> {
  $$MedicineTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get effect => $composableBuilder(
    column: $table.effect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicineTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicineTable> {
  $$MedicineTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get effect =>
      $composableBuilder(column: $table.effect, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  Expression<T> medicineHistoriesRefs<T extends Object>(
    Expression<T> Function($$MedicineHistoriesTableAnnotationComposer a) f,
  ) {
    final $$MedicineHistoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.medicineHistories,
          getReferencedColumn: (t) => t.medicineId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MedicineHistoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.medicineHistories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MedicineTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicineTable,
          MedicineRow,
          $$MedicineTableFilterComposer,
          $$MedicineTableOrderingComposer,
          $$MedicineTableAnnotationComposer,
          $$MedicineTableCreateCompanionBuilder,
          $$MedicineTableUpdateCompanionBuilder,
          (MedicineRow, $$MedicineTableReferences),
          MedicineRow,
          PrefetchHooks Function({bool medicineHistoriesRefs})
        > {
  $$MedicineTableTableManager(_$AppDatabase db, $MedicineTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MedicineTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$MedicineTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$MedicineTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> effect = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicineCompanion(
                localId: localId,
                name: name,
                effect: effect,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                required String name,
                Value<String?> effect = const Value.absent(),
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicineCompanion.insert(
                localId: localId,
                name: name,
                effect: effect,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$MedicineTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({medicineHistoriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (medicineHistoriesRefs) db.medicineHistories,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (medicineHistoriesRefs)
                    await $_getPrefetchedData<
                      MedicineRow,
                      $MedicineTable,
                      MedicineHistoryRow
                    >(
                      currentTable: table,
                      referencedTable: $$MedicineTableReferences
                          ._medicineHistoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$MedicineTableReferences(
                                db,
                                table,
                                p0,
                              ).medicineHistoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.medicineId == item.localId,
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

typedef $$MedicineTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicineTable,
      MedicineRow,
      $$MedicineTableFilterComposer,
      $$MedicineTableOrderingComposer,
      $$MedicineTableAnnotationComposer,
      $$MedicineTableCreateCompanionBuilder,
      $$MedicineTableUpdateCompanionBuilder,
      (MedicineRow, $$MedicineTableReferences),
      MedicineRow,
      PrefetchHooks Function({bool medicineHistoriesRefs})
    >;
typedef $$HospitalsTableCreateCompanionBuilder =
    HospitalsCompanion Function({
      required String localId,
      required String name,
      required String address,
      required String tel,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });
typedef $$HospitalsTableUpdateCompanionBuilder =
    HospitalsCompanion Function({
      Value<String> localId,
      Value<String> name,
      Value<String> address,
      Value<String> tel,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });

final class $$HospitalsTableReferences
    extends BaseReferences<_$AppDatabase, $HospitalsTable, HospitalRow> {
  $$HospitalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HospitalHistoriesTable, List<HospitalHistoryRow>>
  _hospitalHistoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.hospitalHistories,
        aliasName: $_aliasNameGenerator(
          db.hospitals.localId,
          db.hospitalHistories.hospitalId,
        ),
      );

  $$HospitalHistoriesTableProcessedTableManager get hospitalHistoriesRefs {
    final manager = $$HospitalHistoriesTableTableManager(
      $_db,
      $_db.hospitalHistories,
    ).filter(
      (f) => f.hospitalId.localId.sqlEquals($_itemColumn<String>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _hospitalHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MedicineHistoriesTable, List<MedicineHistoryRow>>
  _medicineHistoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.medicineHistories,
        aliasName: $_aliasNameGenerator(
          db.hospitals.localId,
          db.medicineHistories.hospitalId,
        ),
      );

  $$MedicineHistoriesTableProcessedTableManager get medicineHistoriesRefs {
    final manager = $$MedicineHistoriesTableTableManager(
      $_db,
      $_db.medicineHistories,
    ).filter(
      (f) => f.hospitalId.localId.sqlEquals($_itemColumn<String>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _medicineHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VaccineHistoriesTable, List<VaccineHistoryRow>>
  _vaccineHistoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vaccineHistories,
    aliasName: $_aliasNameGenerator(
      db.hospitals.localId,
      db.vaccineHistories.hospitalId,
    ),
  );

  $$VaccineHistoriesTableProcessedTableManager get vaccineHistoriesRefs {
    final manager = $$VaccineHistoriesTableTableManager(
      $_db,
      $_db.vaccineHistories,
    ).filter(
      (f) => f.hospitalId.localId.sqlEquals($_itemColumn<String>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _vaccineHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HospitalsTableFilterComposer
    extends Composer<_$AppDatabase, $HospitalsTable> {
  $$HospitalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tel => $composableBuilder(
    column: $table.tel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> hospitalHistoriesRefs(
    Expression<bool> Function($$HospitalHistoriesTableFilterComposer f) f,
  ) {
    final $$HospitalHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.hospitalHistories,
      getReferencedColumn: (t) => t.hospitalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.hospitalHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicineHistoriesRefs(
    Expression<bool> Function($$MedicineHistoriesTableFilterComposer f) f,
  ) {
    final $$MedicineHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.medicineHistories,
      getReferencedColumn: (t) => t.hospitalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.medicineHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> vaccineHistoriesRefs(
    Expression<bool> Function($$VaccineHistoriesTableFilterComposer f) f,
  ) {
    final $$VaccineHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.vaccineHistories,
      getReferencedColumn: (t) => t.hospitalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VaccineHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.vaccineHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HospitalsTableOrderingComposer
    extends Composer<_$AppDatabase, $HospitalsTable> {
  $$HospitalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tel => $composableBuilder(
    column: $table.tel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HospitalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HospitalsTable> {
  $$HospitalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get tel =>
      $composableBuilder(column: $table.tel, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  Expression<T> hospitalHistoriesRefs<T extends Object>(
    Expression<T> Function($$HospitalHistoriesTableAnnotationComposer a) f,
  ) {
    final $$HospitalHistoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.hospitalHistories,
          getReferencedColumn: (t) => t.hospitalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HospitalHistoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.hospitalHistories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> medicineHistoriesRefs<T extends Object>(
    Expression<T> Function($$MedicineHistoriesTableAnnotationComposer a) f,
  ) {
    final $$MedicineHistoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.medicineHistories,
          getReferencedColumn: (t) => t.hospitalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MedicineHistoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.medicineHistories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> vaccineHistoriesRefs<T extends Object>(
    Expression<T> Function($$VaccineHistoriesTableAnnotationComposer a) f,
  ) {
    final $$VaccineHistoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.vaccineHistories,
      getReferencedColumn: (t) => t.hospitalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VaccineHistoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.vaccineHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HospitalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HospitalsTable,
          HospitalRow,
          $$HospitalsTableFilterComposer,
          $$HospitalsTableOrderingComposer,
          $$HospitalsTableAnnotationComposer,
          $$HospitalsTableCreateCompanionBuilder,
          $$HospitalsTableUpdateCompanionBuilder,
          (HospitalRow, $$HospitalsTableReferences),
          HospitalRow,
          PrefetchHooks Function({
            bool hospitalHistoriesRefs,
            bool medicineHistoriesRefs,
            bool vaccineHistoriesRefs,
          })
        > {
  $$HospitalsTableTableManager(_$AppDatabase db, $HospitalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$HospitalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$HospitalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$HospitalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> tel = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HospitalsCompanion(
                localId: localId,
                name: name,
                address: address,
                tel: tel,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                required String name,
                required String address,
                required String tel,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HospitalsCompanion.insert(
                localId: localId,
                name: name,
                address: address,
                tel: tel,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$HospitalsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            hospitalHistoriesRefs = false,
            medicineHistoriesRefs = false,
            vaccineHistoriesRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (hospitalHistoriesRefs) db.hospitalHistories,
                if (medicineHistoriesRefs) db.medicineHistories,
                if (vaccineHistoriesRefs) db.vaccineHistories,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (hospitalHistoriesRefs)
                    await $_getPrefetchedData<
                      HospitalRow,
                      $HospitalsTable,
                      HospitalHistoryRow
                    >(
                      currentTable: table,
                      referencedTable: $$HospitalsTableReferences
                          ._hospitalHistoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$HospitalsTableReferences(
                                db,
                                table,
                                p0,
                              ).hospitalHistoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.hospitalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (medicineHistoriesRefs)
                    await $_getPrefetchedData<
                      HospitalRow,
                      $HospitalsTable,
                      MedicineHistoryRow
                    >(
                      currentTable: table,
                      referencedTable: $$HospitalsTableReferences
                          ._medicineHistoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$HospitalsTableReferences(
                                db,
                                table,
                                p0,
                              ).medicineHistoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.hospitalId == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (vaccineHistoriesRefs)
                    await $_getPrefetchedData<
                      HospitalRow,
                      $HospitalsTable,
                      VaccineHistoryRow
                    >(
                      currentTable: table,
                      referencedTable: $$HospitalsTableReferences
                          ._vaccineHistoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$HospitalsTableReferences(
                                db,
                                table,
                                p0,
                              ).vaccineHistoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.hospitalId == item.localId,
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

typedef $$HospitalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HospitalsTable,
      HospitalRow,
      $$HospitalsTableFilterComposer,
      $$HospitalsTableOrderingComposer,
      $$HospitalsTableAnnotationComposer,
      $$HospitalsTableCreateCompanionBuilder,
      $$HospitalsTableUpdateCompanionBuilder,
      (HospitalRow, $$HospitalsTableReferences),
      HospitalRow,
      PrefetchHooks Function({
        bool hospitalHistoriesRefs,
        bool medicineHistoriesRefs,
        bool vaccineHistoriesRefs,
      })
    >;
typedef $$HospitalHistoriesTableCreateCompanionBuilder =
    HospitalHistoriesCompanion Function({
      required String localId,
      Value<String?> petId,
      Value<String?> hospitalId,
      required DateTime date,
      Value<String?> symptom,
      Value<int?> fee,
      Value<String?> memo,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });
typedef $$HospitalHistoriesTableUpdateCompanionBuilder =
    HospitalHistoriesCompanion Function({
      Value<String> localId,
      Value<String?> petId,
      Value<String?> hospitalId,
      Value<DateTime> date,
      Value<String?> symptom,
      Value<int?> fee,
      Value<String?> memo,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });

final class $$HospitalHistoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HospitalHistoriesTable,
          HospitalHistoryRow
        > {
  $$HospitalHistoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets.createAlias(
    $_aliasNameGenerator(db.hospitalHistories.petId, db.pets.localId),
  );

  $$PetsTableProcessedTableManager? get petId {
    final $_column = $_itemColumn<String>('pet_id');
    if ($_column == null) return null;
    final manager = $$PetsTableTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $HospitalsTable _hospitalIdTable(_$AppDatabase db) =>
      db.hospitals.createAlias(
        $_aliasNameGenerator(
          db.hospitalHistories.hospitalId,
          db.hospitals.localId,
        ),
      );

  $$HospitalsTableProcessedTableManager? get hospitalId {
    final $_column = $_itemColumn<String>('hospital_id');
    if ($_column == null) return null;
    final manager = $$HospitalsTableTableManager(
      $_db,
      $_db.hospitals,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_hospitalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HospitalHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $HospitalHistoriesTable> {
  $$HospitalHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symptom => $composableBuilder(
    column: $table.symptom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HospitalsTableFilterComposer get hospitalId {
    final $$HospitalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hospitalId,
      referencedTable: $db.hospitals,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalsTableFilterComposer(
            $db: $db,
            $table: $db.hospitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HospitalHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $HospitalHistoriesTable> {
  $$HospitalHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symptom => $composableBuilder(
    column: $table.symptom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HospitalsTableOrderingComposer get hospitalId {
    final $$HospitalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hospitalId,
      referencedTable: $db.hospitals,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalsTableOrderingComposer(
            $db: $db,
            $table: $db.hospitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HospitalHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HospitalHistoriesTable> {
  $$HospitalHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get symptom =>
      $composableBuilder(column: $table.symptom, builder: (column) => column);

  GeneratedColumn<int> get fee =>
      $composableBuilder(column: $table.fee, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HospitalsTableAnnotationComposer get hospitalId {
    final $$HospitalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hospitalId,
      referencedTable: $db.hospitals,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalsTableAnnotationComposer(
            $db: $db,
            $table: $db.hospitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HospitalHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HospitalHistoriesTable,
          HospitalHistoryRow,
          $$HospitalHistoriesTableFilterComposer,
          $$HospitalHistoriesTableOrderingComposer,
          $$HospitalHistoriesTableAnnotationComposer,
          $$HospitalHistoriesTableCreateCompanionBuilder,
          $$HospitalHistoriesTableUpdateCompanionBuilder,
          (HospitalHistoryRow, $$HospitalHistoriesTableReferences),
          HospitalHistoryRow,
          PrefetchHooks Function({bool petId, bool hospitalId})
        > {
  $$HospitalHistoriesTableTableManager(
    _$AppDatabase db,
    $HospitalHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$HospitalHistoriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$HospitalHistoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$HospitalHistoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String?> petId = const Value.absent(),
                Value<String?> hospitalId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> symptom = const Value.absent(),
                Value<int?> fee = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HospitalHistoriesCompanion(
                localId: localId,
                petId: petId,
                hospitalId: hospitalId,
                date: date,
                symptom: symptom,
                fee: fee,
                memo: memo,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                Value<String?> petId = const Value.absent(),
                Value<String?> hospitalId = const Value.absent(),
                required DateTime date,
                Value<String?> symptom = const Value.absent(),
                Value<int?> fee = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HospitalHistoriesCompanion.insert(
                localId: localId,
                petId: petId,
                hospitalId: hospitalId,
                date: date,
                symptom: symptom,
                fee: fee,
                memo: memo,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$HospitalHistoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({petId = false, hospitalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (petId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.petId,
                            referencedTable: $$HospitalHistoriesTableReferences
                                ._petIdTable(db),
                            referencedColumn:
                                $$HospitalHistoriesTableReferences
                                    ._petIdTable(db)
                                    .localId,
                          )
                          as T;
                }
                if (hospitalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.hospitalId,
                            referencedTable: $$HospitalHistoriesTableReferences
                                ._hospitalIdTable(db),
                            referencedColumn:
                                $$HospitalHistoriesTableReferences
                                    ._hospitalIdTable(db)
                                    .localId,
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

typedef $$HospitalHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HospitalHistoriesTable,
      HospitalHistoryRow,
      $$HospitalHistoriesTableFilterComposer,
      $$HospitalHistoriesTableOrderingComposer,
      $$HospitalHistoriesTableAnnotationComposer,
      $$HospitalHistoriesTableCreateCompanionBuilder,
      $$HospitalHistoriesTableUpdateCompanionBuilder,
      (HospitalHistoryRow, $$HospitalHistoriesTableReferences),
      HospitalHistoryRow,
      PrefetchHooks Function({bool petId, bool hospitalId})
    >;
typedef $$MedicineHistoriesTableCreateCompanionBuilder =
    MedicineHistoriesCompanion Function({
      required String localId,
      Value<String?> petId,
      Value<String?> hospitalId,
      Value<String?> medicineId,
      required DateTime date,
      Value<String?> memo,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });
typedef $$MedicineHistoriesTableUpdateCompanionBuilder =
    MedicineHistoriesCompanion Function({
      Value<String> localId,
      Value<String?> petId,
      Value<String?> hospitalId,
      Value<String?> medicineId,
      Value<DateTime> date,
      Value<String?> memo,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });

final class $$MedicineHistoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MedicineHistoriesTable,
          MedicineHistoryRow
        > {
  $$MedicineHistoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets.createAlias(
    $_aliasNameGenerator(db.medicineHistories.petId, db.pets.localId),
  );

  $$PetsTableProcessedTableManager? get petId {
    final $_column = $_itemColumn<String>('pet_id');
    if ($_column == null) return null;
    final manager = $$PetsTableTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $HospitalsTable _hospitalIdTable(_$AppDatabase db) =>
      db.hospitals.createAlias(
        $_aliasNameGenerator(
          db.medicineHistories.hospitalId,
          db.hospitals.localId,
        ),
      );

  $$HospitalsTableProcessedTableManager? get hospitalId {
    final $_column = $_itemColumn<String>('hospital_id');
    if ($_column == null) return null;
    final manager = $$HospitalsTableTableManager(
      $_db,
      $_db.hospitals,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_hospitalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MedicineTable _medicineIdTable(_$AppDatabase db) =>
      db.medicine.createAlias(
        $_aliasNameGenerator(
          db.medicineHistories.medicineId,
          db.medicine.localId,
        ),
      );

  $$MedicineTableProcessedTableManager? get medicineId {
    final $_column = $_itemColumn<String>('medicine_id');
    if ($_column == null) return null;
    final manager = $$MedicineTableTableManager(
      $_db,
      $_db.medicine,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MedicineHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $MedicineHistoriesTable> {
  $$MedicineHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HospitalsTableFilterComposer get hospitalId {
    final $$HospitalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hospitalId,
      referencedTable: $db.hospitals,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalsTableFilterComposer(
            $db: $db,
            $table: $db.hospitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicineTableFilterComposer get medicineId {
    final $$MedicineTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicine,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineTableFilterComposer(
            $db: $db,
            $table: $db.medicine,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicineHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicineHistoriesTable> {
  $$MedicineHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HospitalsTableOrderingComposer get hospitalId {
    final $$HospitalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hospitalId,
      referencedTable: $db.hospitals,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalsTableOrderingComposer(
            $db: $db,
            $table: $db.hospitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicineTableOrderingComposer get medicineId {
    final $$MedicineTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicine,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineTableOrderingComposer(
            $db: $db,
            $table: $db.medicine,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicineHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicineHistoriesTable> {
  $$MedicineHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HospitalsTableAnnotationComposer get hospitalId {
    final $$HospitalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hospitalId,
      referencedTable: $db.hospitals,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalsTableAnnotationComposer(
            $db: $db,
            $table: $db.hospitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicineTableAnnotationComposer get medicineId {
    final $$MedicineTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicine,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineTableAnnotationComposer(
            $db: $db,
            $table: $db.medicine,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicineHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicineHistoriesTable,
          MedicineHistoryRow,
          $$MedicineHistoriesTableFilterComposer,
          $$MedicineHistoriesTableOrderingComposer,
          $$MedicineHistoriesTableAnnotationComposer,
          $$MedicineHistoriesTableCreateCompanionBuilder,
          $$MedicineHistoriesTableUpdateCompanionBuilder,
          (MedicineHistoryRow, $$MedicineHistoriesTableReferences),
          MedicineHistoryRow,
          PrefetchHooks Function({bool petId, bool hospitalId, bool medicineId})
        > {
  $$MedicineHistoriesTableTableManager(
    _$AppDatabase db,
    $MedicineHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MedicineHistoriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$MedicineHistoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$MedicineHistoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String?> petId = const Value.absent(),
                Value<String?> hospitalId = const Value.absent(),
                Value<String?> medicineId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicineHistoriesCompanion(
                localId: localId,
                petId: petId,
                hospitalId: hospitalId,
                medicineId: medicineId,
                date: date,
                memo: memo,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                Value<String?> petId = const Value.absent(),
                Value<String?> hospitalId = const Value.absent(),
                Value<String?> medicineId = const Value.absent(),
                required DateTime date,
                Value<String?> memo = const Value.absent(),
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicineHistoriesCompanion.insert(
                localId: localId,
                petId: petId,
                hospitalId: hospitalId,
                medicineId: medicineId,
                date: date,
                memo: memo,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$MedicineHistoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            petId = false,
            hospitalId = false,
            medicineId = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (petId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.petId,
                            referencedTable: $$MedicineHistoriesTableReferences
                                ._petIdTable(db),
                            referencedColumn:
                                $$MedicineHistoriesTableReferences
                                    ._petIdTable(db)
                                    .localId,
                          )
                          as T;
                }
                if (hospitalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.hospitalId,
                            referencedTable: $$MedicineHistoriesTableReferences
                                ._hospitalIdTable(db),
                            referencedColumn:
                                $$MedicineHistoriesTableReferences
                                    ._hospitalIdTable(db)
                                    .localId,
                          )
                          as T;
                }
                if (medicineId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.medicineId,
                            referencedTable: $$MedicineHistoriesTableReferences
                                ._medicineIdTable(db),
                            referencedColumn:
                                $$MedicineHistoriesTableReferences
                                    ._medicineIdTable(db)
                                    .localId,
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

typedef $$MedicineHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicineHistoriesTable,
      MedicineHistoryRow,
      $$MedicineHistoriesTableFilterComposer,
      $$MedicineHistoriesTableOrderingComposer,
      $$MedicineHistoriesTableAnnotationComposer,
      $$MedicineHistoriesTableCreateCompanionBuilder,
      $$MedicineHistoriesTableUpdateCompanionBuilder,
      (MedicineHistoryRow, $$MedicineHistoriesTableReferences),
      MedicineHistoryRow,
      PrefetchHooks Function({bool petId, bool hospitalId, bool medicineId})
    >;
typedef $$VaccinesTableCreateCompanionBuilder =
    VaccinesCompanion Function({
      required String localId,
      required String name,
      Value<String?> memo,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });
typedef $$VaccinesTableUpdateCompanionBuilder =
    VaccinesCompanion Function({
      Value<String> localId,
      Value<String> name,
      Value<String?> memo,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });

final class $$VaccinesTableReferences
    extends BaseReferences<_$AppDatabase, $VaccinesTable, VaccineRow> {
  $$VaccinesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VaccineHistoriesTable, List<VaccineHistoryRow>>
  _vaccineHistoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vaccineHistories,
    aliasName: $_aliasNameGenerator(
      db.vaccines.localId,
      db.vaccineHistories.vaccineId,
    ),
  );

  $$VaccineHistoriesTableProcessedTableManager get vaccineHistoriesRefs {
    final manager = $$VaccineHistoriesTableTableManager(
      $_db,
      $_db.vaccineHistories,
    ).filter(
      (f) => f.vaccineId.localId.sqlEquals($_itemColumn<String>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _vaccineHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VaccinesTableFilterComposer
    extends Composer<_$AppDatabase, $VaccinesTable> {
  $$VaccinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> vaccineHistoriesRefs(
    Expression<bool> Function($$VaccineHistoriesTableFilterComposer f) f,
  ) {
    final $$VaccineHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.vaccineHistories,
      getReferencedColumn: (t) => t.vaccineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VaccineHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.vaccineHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VaccinesTableOrderingComposer
    extends Composer<_$AppDatabase, $VaccinesTable> {
  $$VaccinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VaccinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VaccinesTable> {
  $$VaccinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  Expression<T> vaccineHistoriesRefs<T extends Object>(
    Expression<T> Function($$VaccineHistoriesTableAnnotationComposer a) f,
  ) {
    final $$VaccineHistoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.vaccineHistories,
      getReferencedColumn: (t) => t.vaccineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VaccineHistoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.vaccineHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VaccinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VaccinesTable,
          VaccineRow,
          $$VaccinesTableFilterComposer,
          $$VaccinesTableOrderingComposer,
          $$VaccinesTableAnnotationComposer,
          $$VaccinesTableCreateCompanionBuilder,
          $$VaccinesTableUpdateCompanionBuilder,
          (VaccineRow, $$VaccinesTableReferences),
          VaccineRow,
          PrefetchHooks Function({bool vaccineHistoriesRefs})
        > {
  $$VaccinesTableTableManager(_$AppDatabase db, $VaccinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$VaccinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$VaccinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$VaccinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VaccinesCompanion(
                localId: localId,
                name: name,
                memo: memo,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                required String name,
                Value<String?> memo = const Value.absent(),
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VaccinesCompanion.insert(
                localId: localId,
                name: name,
                memo: memo,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$VaccinesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({vaccineHistoriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (vaccineHistoriesRefs) db.vaccineHistories,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vaccineHistoriesRefs)
                    await $_getPrefetchedData<
                      VaccineRow,
                      $VaccinesTable,
                      VaccineHistoryRow
                    >(
                      currentTable: table,
                      referencedTable: $$VaccinesTableReferences
                          ._vaccineHistoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$VaccinesTableReferences(
                                db,
                                table,
                                p0,
                              ).vaccineHistoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.vaccineId == item.localId,
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

typedef $$VaccinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VaccinesTable,
      VaccineRow,
      $$VaccinesTableFilterComposer,
      $$VaccinesTableOrderingComposer,
      $$VaccinesTableAnnotationComposer,
      $$VaccinesTableCreateCompanionBuilder,
      $$VaccinesTableUpdateCompanionBuilder,
      (VaccineRow, $$VaccinesTableReferences),
      VaccineRow,
      PrefetchHooks Function({bool vaccineHistoriesRefs})
    >;
typedef $$VaccineHistoriesTableCreateCompanionBuilder =
    VaccineHistoriesCompanion Function({
      required String localId,
      Value<String?> petId,
      Value<String?> hospitalId,
      Value<String?> vaccineId,
      required DateTime date,
      Value<String?> memo,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });
typedef $$VaccineHistoriesTableUpdateCompanionBuilder =
    VaccineHistoriesCompanion Function({
      Value<String> localId,
      Value<String?> petId,
      Value<String?> hospitalId,
      Value<String?> vaccineId,
      Value<DateTime> date,
      Value<String?> memo,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });

final class $$VaccineHistoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $VaccineHistoriesTable,
          VaccineHistoryRow
        > {
  $$VaccineHistoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets.createAlias(
    $_aliasNameGenerator(db.vaccineHistories.petId, db.pets.localId),
  );

  $$PetsTableProcessedTableManager? get petId {
    final $_column = $_itemColumn<String>('pet_id');
    if ($_column == null) return null;
    final manager = $$PetsTableTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $HospitalsTable _hospitalIdTable(_$AppDatabase db) =>
      db.hospitals.createAlias(
        $_aliasNameGenerator(
          db.vaccineHistories.hospitalId,
          db.hospitals.localId,
        ),
      );

  $$HospitalsTableProcessedTableManager? get hospitalId {
    final $_column = $_itemColumn<String>('hospital_id');
    if ($_column == null) return null;
    final manager = $$HospitalsTableTableManager(
      $_db,
      $_db.hospitals,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_hospitalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VaccinesTable _vaccineIdTable(_$AppDatabase db) =>
      db.vaccines.createAlias(
        $_aliasNameGenerator(
          db.vaccineHistories.vaccineId,
          db.vaccines.localId,
        ),
      );

  $$VaccinesTableProcessedTableManager? get vaccineId {
    final $_column = $_itemColumn<String>('vaccine_id');
    if ($_column == null) return null;
    final manager = $$VaccinesTableTableManager(
      $_db,
      $_db.vaccines,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vaccineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VaccineHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $VaccineHistoriesTable> {
  $$VaccineHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HospitalsTableFilterComposer get hospitalId {
    final $$HospitalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hospitalId,
      referencedTable: $db.hospitals,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalsTableFilterComposer(
            $db: $db,
            $table: $db.hospitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VaccinesTableFilterComposer get vaccineId {
    final $$VaccinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vaccineId,
      referencedTable: $db.vaccines,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VaccinesTableFilterComposer(
            $db: $db,
            $table: $db.vaccines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VaccineHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $VaccineHistoriesTable> {
  $$VaccineHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HospitalsTableOrderingComposer get hospitalId {
    final $$HospitalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hospitalId,
      referencedTable: $db.hospitals,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalsTableOrderingComposer(
            $db: $db,
            $table: $db.hospitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VaccinesTableOrderingComposer get vaccineId {
    final $$VaccinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vaccineId,
      referencedTable: $db.vaccines,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VaccinesTableOrderingComposer(
            $db: $db,
            $table: $db.vaccines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VaccineHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VaccineHistoriesTable> {
  $$VaccineHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HospitalsTableAnnotationComposer get hospitalId {
    final $$HospitalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hospitalId,
      referencedTable: $db.hospitals,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HospitalsTableAnnotationComposer(
            $db: $db,
            $table: $db.hospitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VaccinesTableAnnotationComposer get vaccineId {
    final $$VaccinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vaccineId,
      referencedTable: $db.vaccines,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VaccinesTableAnnotationComposer(
            $db: $db,
            $table: $db.vaccines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VaccineHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VaccineHistoriesTable,
          VaccineHistoryRow,
          $$VaccineHistoriesTableFilterComposer,
          $$VaccineHistoriesTableOrderingComposer,
          $$VaccineHistoriesTableAnnotationComposer,
          $$VaccineHistoriesTableCreateCompanionBuilder,
          $$VaccineHistoriesTableUpdateCompanionBuilder,
          (VaccineHistoryRow, $$VaccineHistoriesTableReferences),
          VaccineHistoryRow,
          PrefetchHooks Function({bool petId, bool hospitalId, bool vaccineId})
        > {
  $$VaccineHistoriesTableTableManager(
    _$AppDatabase db,
    $VaccineHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$VaccineHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$VaccineHistoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$VaccineHistoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String?> petId = const Value.absent(),
                Value<String?> hospitalId = const Value.absent(),
                Value<String?> vaccineId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VaccineHistoriesCompanion(
                localId: localId,
                petId: petId,
                hospitalId: hospitalId,
                vaccineId: vaccineId,
                date: date,
                memo: memo,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                Value<String?> petId = const Value.absent(),
                Value<String?> hospitalId = const Value.absent(),
                Value<String?> vaccineId = const Value.absent(),
                required DateTime date,
                Value<String?> memo = const Value.absent(),
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VaccineHistoriesCompanion.insert(
                localId: localId,
                petId: petId,
                hospitalId: hospitalId,
                vaccineId: vaccineId,
                date: date,
                memo: memo,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$VaccineHistoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            petId = false,
            hospitalId = false,
            vaccineId = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (petId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.petId,
                            referencedTable: $$VaccineHistoriesTableReferences
                                ._petIdTable(db),
                            referencedColumn:
                                $$VaccineHistoriesTableReferences
                                    ._petIdTable(db)
                                    .localId,
                          )
                          as T;
                }
                if (hospitalId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.hospitalId,
                            referencedTable: $$VaccineHistoriesTableReferences
                                ._hospitalIdTable(db),
                            referencedColumn:
                                $$VaccineHistoriesTableReferences
                                    ._hospitalIdTable(db)
                                    .localId,
                          )
                          as T;
                }
                if (vaccineId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.vaccineId,
                            referencedTable: $$VaccineHistoriesTableReferences
                                ._vaccineIdTable(db),
                            referencedColumn:
                                $$VaccineHistoriesTableReferences
                                    ._vaccineIdTable(db)
                                    .localId,
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

typedef $$VaccineHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VaccineHistoriesTable,
      VaccineHistoryRow,
      $$VaccineHistoriesTableFilterComposer,
      $$VaccineHistoriesTableOrderingComposer,
      $$VaccineHistoriesTableAnnotationComposer,
      $$VaccineHistoriesTableCreateCompanionBuilder,
      $$VaccineHistoriesTableUpdateCompanionBuilder,
      (VaccineHistoryRow, $$VaccineHistoriesTableReferences),
      VaccineHistoryRow,
      PrefetchHooks Function({bool petId, bool hospitalId, bool vaccineId})
    >;
typedef $$PetDiariesTableCreateCompanionBuilder =
    PetDiariesCompanion Function({
      required String localId,
      Value<String?> petId,
      required DateTime date,
      required String title,
      required String content,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });
typedef $$PetDiariesTableUpdateCompanionBuilder =
    PetDiariesCompanion Function({
      Value<String> localId,
      Value<String?> petId,
      Value<DateTime> date,
      Value<String> title,
      Value<String> content,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> syncState,
      Value<int> rowid,
    });

final class $$PetDiariesTableReferences
    extends BaseReferences<_$AppDatabase, $PetDiariesTable, PetDiaryRow> {
  $$PetDiariesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets.createAlias(
    $_aliasNameGenerator(db.petDiaries.petId, db.pets.localId),
  );

  $$PetsTableProcessedTableManager? get petId {
    final $_column = $_itemColumn<String>('pet_id');
    if ($_column == null) return null;
    final manager = $$PetsTableTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PetDiariesTableFilterComposer
    extends Composer<_$AppDatabase, $PetDiariesTable> {
  $$PetDiariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PetDiariesTableOrderingComposer
    extends Composer<_$AppDatabase, $PetDiariesTable> {
  $$PetDiariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PetDiariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PetDiariesTable> {
  $$PetDiariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PetDiariesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PetDiariesTable,
          PetDiaryRow,
          $$PetDiariesTableFilterComposer,
          $$PetDiariesTableOrderingComposer,
          $$PetDiariesTableAnnotationComposer,
          $$PetDiariesTableCreateCompanionBuilder,
          $$PetDiariesTableUpdateCompanionBuilder,
          (PetDiaryRow, $$PetDiariesTableReferences),
          PetDiaryRow,
          PrefetchHooks Function({bool petId})
        > {
  $$PetDiariesTableTableManager(_$AppDatabase db, $PetDiariesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PetDiariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PetDiariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PetDiariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String?> petId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetDiariesCompanion(
                localId: localId,
                petId: petId,
                date: date,
                title: title,
                content: content,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                Value<String?> petId = const Value.absent(),
                required DateTime date,
                required String title,
                required String content,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetDiariesCompanion.insert(
                localId: localId,
                petId: petId,
                date: date,
                title: title,
                content: content,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$PetDiariesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({petId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (petId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.petId,
                            referencedTable: $$PetDiariesTableReferences
                                ._petIdTable(db),
                            referencedColumn:
                                $$PetDiariesTableReferences
                                    ._petIdTable(db)
                                    .localId,
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

typedef $$PetDiariesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PetDiariesTable,
      PetDiaryRow,
      $$PetDiariesTableFilterComposer,
      $$PetDiariesTableOrderingComposer,
      $$PetDiariesTableAnnotationComposer,
      $$PetDiariesTableCreateCompanionBuilder,
      $$PetDiariesTableUpdateCompanionBuilder,
      (PetDiaryRow, $$PetDiariesTableReferences),
      PetDiaryRow,
      PrefetchHooks Function({bool petId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PetsTableTableManager get pets => $$PetsTableTableManager(_db, _db.pets);
  $$MedicineTableTableManager get medicine =>
      $$MedicineTableTableManager(_db, _db.medicine);
  $$HospitalsTableTableManager get hospitals =>
      $$HospitalsTableTableManager(_db, _db.hospitals);
  $$HospitalHistoriesTableTableManager get hospitalHistories =>
      $$HospitalHistoriesTableTableManager(_db, _db.hospitalHistories);
  $$MedicineHistoriesTableTableManager get medicineHistories =>
      $$MedicineHistoriesTableTableManager(_db, _db.medicineHistories);
  $$VaccinesTableTableManager get vaccines =>
      $$VaccinesTableTableManager(_db, _db.vaccines);
  $$VaccineHistoriesTableTableManager get vaccineHistories =>
      $$VaccineHistoriesTableTableManager(_db, _db.vaccineHistories);
  $$PetDiariesTableTableManager get petDiaries =>
      $$PetDiariesTableTableManager(_db, _db.petDiaries);
}
