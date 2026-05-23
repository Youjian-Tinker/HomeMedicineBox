// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FamilyMembersTable extends FamilyMembers
    with TableInfo<$FamilyMembersTable, FamilyMemberRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FamilyMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relationMeta =
      const VerificationMeta('relation');
  @override
  late final GeneratedColumn<String> relation = GeneratedColumn<String>(
      'relation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSystemDefaultMeta =
      const VerificationMeta('isSystemDefault');
  @override
  late final GeneratedColumn<bool> isSystemDefault = GeneratedColumn<bool>(
      'is_system_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_system_default" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, relation, isSystemDefault, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'family_members';
  @override
  VerificationContext validateIntegrity(Insertable<FamilyMemberRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('relation')) {
      context.handle(_relationMeta,
          relation.isAcceptableOrUnknown(data['relation']!, _relationMeta));
    } else if (isInserting) {
      context.missing(_relationMeta);
    }
    if (data.containsKey('is_system_default')) {
      context.handle(
          _isSystemDefaultMeta,
          isSystemDefault.isAcceptableOrUnknown(
              data['is_system_default']!, _isSystemDefaultMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FamilyMemberRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FamilyMemberRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      relation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}relation'])!,
      isSystemDefault: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_system_default'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $FamilyMembersTable createAlias(String alias) {
    return $FamilyMembersTable(attachedDatabase, alias);
  }
}

class FamilyMemberRow extends DataClass implements Insertable<FamilyMemberRow> {
  final String id;
  final String name;
  final String relation;
  final bool isSystemDefault;
  final DateTime createdAt;
  final DateTime updatedAt;
  const FamilyMemberRow(
      {required this.id,
      required this.name,
      required this.relation,
      required this.isSystemDefault,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['relation'] = Variable<String>(relation);
    map['is_system_default'] = Variable<bool>(isSystemDefault);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FamilyMembersCompanion toCompanion(bool nullToAbsent) {
    return FamilyMembersCompanion(
      id: Value(id),
      name: Value(name),
      relation: Value(relation),
      isSystemDefault: Value(isSystemDefault),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory FamilyMemberRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FamilyMemberRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      relation: serializer.fromJson<String>(json['relation']),
      isSystemDefault: serializer.fromJson<bool>(json['isSystemDefault']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'relation': serializer.toJson<String>(relation),
      'isSystemDefault': serializer.toJson<bool>(isSystemDefault),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  FamilyMemberRow copyWith(
          {String? id,
          String? name,
          String? relation,
          bool? isSystemDefault,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      FamilyMemberRow(
        id: id ?? this.id,
        name: name ?? this.name,
        relation: relation ?? this.relation,
        isSystemDefault: isSystemDefault ?? this.isSystemDefault,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  FamilyMemberRow copyWithCompanion(FamilyMembersCompanion data) {
    return FamilyMemberRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      relation: data.relation.present ? data.relation.value : this.relation,
      isSystemDefault: data.isSystemDefault.present
          ? data.isSystemDefault.value
          : this.isSystemDefault,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FamilyMemberRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('relation: $relation, ')
          ..write('isSystemDefault: $isSystemDefault, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, relation, isSystemDefault, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FamilyMemberRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.relation == this.relation &&
          other.isSystemDefault == this.isSystemDefault &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FamilyMembersCompanion extends UpdateCompanion<FamilyMemberRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> relation;
  final Value<bool> isSystemDefault;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const FamilyMembersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.relation = const Value.absent(),
    this.isSystemDefault = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FamilyMembersCompanion.insert({
    required String id,
    required String name,
    required String relation,
    this.isSystemDefault = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        relation = Value(relation),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<FamilyMemberRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? relation,
    Expression<bool>? isSystemDefault,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (relation != null) 'relation': relation,
      if (isSystemDefault != null) 'is_system_default': isSystemDefault,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FamilyMembersCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? relation,
      Value<bool>? isSystemDefault,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return FamilyMembersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      relation: relation ?? this.relation,
      isSystemDefault: isSystemDefault ?? this.isSystemDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (relation.present) {
      map['relation'] = Variable<String>(relation.value);
    }
    if (isSystemDefault.present) {
      map['is_system_default'] = Variable<bool>(isSystemDefault.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FamilyMembersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('relation: $relation, ')
          ..write('isSystemDefault: $isSystemDefault, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicineItemsTable extends MedicineItems
    with TableInfo<$MedicineItemsTable, MedicineItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicineItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
      'member_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genericNameMeta =
      const VerificationMeta('genericName');
  @override
  late final GeneratedColumn<String> genericName = GeneratedColumn<String>(
      'generic_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _specificationMeta =
      const VerificationMeta('specification');
  @override
  late final GeneratedColumn<String> specification = GeneratedColumn<String>(
      'specification', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dosageFormMeta =
      const VerificationMeta('dosageForm');
  @override
  late final GeneratedColumn<String> dosageForm = GeneratedColumn<String>(
      'dosage_form', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _indicationMeta =
      const VerificationMeta('indication');
  @override
  late final GeneratedColumn<String> indication = GeneratedColumn<String>(
      'indication', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _storageNotesMeta =
      const VerificationMeta('storageNotes');
  @override
  late final GeneratedColumn<String> storageNotes = GeneratedColumn<String>(
      'storage_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        memberId,
        name,
        genericName,
        specification,
        dosageForm,
        indication,
        storageNotes,
        source,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicine_items';
  @override
  VerificationContext validateIntegrity(Insertable<MedicineItemRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('generic_name')) {
      context.handle(
          _genericNameMeta,
          genericName.isAcceptableOrUnknown(
              data['generic_name']!, _genericNameMeta));
    }
    if (data.containsKey('specification')) {
      context.handle(
          _specificationMeta,
          specification.isAcceptableOrUnknown(
              data['specification']!, _specificationMeta));
    } else if (isInserting) {
      context.missing(_specificationMeta);
    }
    if (data.containsKey('dosage_form')) {
      context.handle(
          _dosageFormMeta,
          dosageForm.isAcceptableOrUnknown(
              data['dosage_form']!, _dosageFormMeta));
    } else if (isInserting) {
      context.missing(_dosageFormMeta);
    }
    if (data.containsKey('indication')) {
      context.handle(
          _indicationMeta,
          indication.isAcceptableOrUnknown(
              data['indication']!, _indicationMeta));
    }
    if (data.containsKey('storage_notes')) {
      context.handle(
          _storageNotesMeta,
          storageNotes.isAcceptableOrUnknown(
              data['storage_notes']!, _storageNotesMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicineItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicineItemRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      genericName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}generic_name']),
      specification: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}specification'])!,
      dosageForm: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dosage_form'])!,
      indication: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}indication']),
      storageNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}storage_notes']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MedicineItemsTable createAlias(String alias) {
    return $MedicineItemsTable(attachedDatabase, alias);
  }
}

class MedicineItemRow extends DataClass implements Insertable<MedicineItemRow> {
  final String id;
  final String memberId;
  final String name;
  final String? genericName;
  final String specification;
  final String dosageForm;
  final String? indication;
  final String? storageNotes;
  final String source;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MedicineItemRow(
      {required this.id,
      required this.memberId,
      required this.name,
      this.genericName,
      required this.specification,
      required this.dosageForm,
      this.indication,
      this.storageNotes,
      required this.source,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['member_id'] = Variable<String>(memberId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || genericName != null) {
      map['generic_name'] = Variable<String>(genericName);
    }
    map['specification'] = Variable<String>(specification);
    map['dosage_form'] = Variable<String>(dosageForm);
    if (!nullToAbsent || indication != null) {
      map['indication'] = Variable<String>(indication);
    }
    if (!nullToAbsent || storageNotes != null) {
      map['storage_notes'] = Variable<String>(storageNotes);
    }
    map['source'] = Variable<String>(source);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MedicineItemsCompanion toCompanion(bool nullToAbsent) {
    return MedicineItemsCompanion(
      id: Value(id),
      memberId: Value(memberId),
      name: Value(name),
      genericName: genericName == null && nullToAbsent
          ? const Value.absent()
          : Value(genericName),
      specification: Value(specification),
      dosageForm: Value(dosageForm),
      indication: indication == null && nullToAbsent
          ? const Value.absent()
          : Value(indication),
      storageNotes: storageNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(storageNotes),
      source: Value(source),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MedicineItemRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicineItemRow(
      id: serializer.fromJson<String>(json['id']),
      memberId: serializer.fromJson<String>(json['memberId']),
      name: serializer.fromJson<String>(json['name']),
      genericName: serializer.fromJson<String?>(json['genericName']),
      specification: serializer.fromJson<String>(json['specification']),
      dosageForm: serializer.fromJson<String>(json['dosageForm']),
      indication: serializer.fromJson<String?>(json['indication']),
      storageNotes: serializer.fromJson<String?>(json['storageNotes']),
      source: serializer.fromJson<String>(json['source']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'memberId': serializer.toJson<String>(memberId),
      'name': serializer.toJson<String>(name),
      'genericName': serializer.toJson<String?>(genericName),
      'specification': serializer.toJson<String>(specification),
      'dosageForm': serializer.toJson<String>(dosageForm),
      'indication': serializer.toJson<String?>(indication),
      'storageNotes': serializer.toJson<String?>(storageNotes),
      'source': serializer.toJson<String>(source),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MedicineItemRow copyWith(
          {String? id,
          String? memberId,
          String? name,
          Value<String?> genericName = const Value.absent(),
          String? specification,
          String? dosageForm,
          Value<String?> indication = const Value.absent(),
          Value<String?> storageNotes = const Value.absent(),
          String? source,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MedicineItemRow(
        id: id ?? this.id,
        memberId: memberId ?? this.memberId,
        name: name ?? this.name,
        genericName: genericName.present ? genericName.value : this.genericName,
        specification: specification ?? this.specification,
        dosageForm: dosageForm ?? this.dosageForm,
        indication: indication.present ? indication.value : this.indication,
        storageNotes:
            storageNotes.present ? storageNotes.value : this.storageNotes,
        source: source ?? this.source,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MedicineItemRow copyWithCompanion(MedicineItemsCompanion data) {
    return MedicineItemRow(
      id: data.id.present ? data.id.value : this.id,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      name: data.name.present ? data.name.value : this.name,
      genericName:
          data.genericName.present ? data.genericName.value : this.genericName,
      specification: data.specification.present
          ? data.specification.value
          : this.specification,
      dosageForm:
          data.dosageForm.present ? data.dosageForm.value : this.dosageForm,
      indication:
          data.indication.present ? data.indication.value : this.indication,
      storageNotes: data.storageNotes.present
          ? data.storageNotes.value
          : this.storageNotes,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicineItemRow(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('name: $name, ')
          ..write('genericName: $genericName, ')
          ..write('specification: $specification, ')
          ..write('dosageForm: $dosageForm, ')
          ..write('indication: $indication, ')
          ..write('storageNotes: $storageNotes, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      memberId,
      name,
      genericName,
      specification,
      dosageForm,
      indication,
      storageNotes,
      source,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicineItemRow &&
          other.id == this.id &&
          other.memberId == this.memberId &&
          other.name == this.name &&
          other.genericName == this.genericName &&
          other.specification == this.specification &&
          other.dosageForm == this.dosageForm &&
          other.indication == this.indication &&
          other.storageNotes == this.storageNotes &&
          other.source == this.source &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MedicineItemsCompanion extends UpdateCompanion<MedicineItemRow> {
  final Value<String> id;
  final Value<String> memberId;
  final Value<String> name;
  final Value<String?> genericName;
  final Value<String> specification;
  final Value<String> dosageForm;
  final Value<String?> indication;
  final Value<String?> storageNotes;
  final Value<String> source;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MedicineItemsCompanion({
    this.id = const Value.absent(),
    this.memberId = const Value.absent(),
    this.name = const Value.absent(),
    this.genericName = const Value.absent(),
    this.specification = const Value.absent(),
    this.dosageForm = const Value.absent(),
    this.indication = const Value.absent(),
    this.storageNotes = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicineItemsCompanion.insert({
    required String id,
    required String memberId,
    required String name,
    this.genericName = const Value.absent(),
    required String specification,
    required String dosageForm,
    this.indication = const Value.absent(),
    this.storageNotes = const Value.absent(),
    required String source,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        memberId = Value(memberId),
        name = Value(name),
        specification = Value(specification),
        dosageForm = Value(dosageForm),
        source = Value(source),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<MedicineItemRow> custom({
    Expression<String>? id,
    Expression<String>? memberId,
    Expression<String>? name,
    Expression<String>? genericName,
    Expression<String>? specification,
    Expression<String>? dosageForm,
    Expression<String>? indication,
    Expression<String>? storageNotes,
    Expression<String>? source,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memberId != null) 'member_id': memberId,
      if (name != null) 'name': name,
      if (genericName != null) 'generic_name': genericName,
      if (specification != null) 'specification': specification,
      if (dosageForm != null) 'dosage_form': dosageForm,
      if (indication != null) 'indication': indication,
      if (storageNotes != null) 'storage_notes': storageNotes,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicineItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? memberId,
      Value<String>? name,
      Value<String?>? genericName,
      Value<String>? specification,
      Value<String>? dosageForm,
      Value<String?>? indication,
      Value<String?>? storageNotes,
      Value<String>? source,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return MedicineItemsCompanion(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      name: name ?? this.name,
      genericName: genericName ?? this.genericName,
      specification: specification ?? this.specification,
      dosageForm: dosageForm ?? this.dosageForm,
      indication: indication ?? this.indication,
      storageNotes: storageNotes ?? this.storageNotes,
      source: source ?? this.source,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (genericName.present) {
      map['generic_name'] = Variable<String>(genericName.value);
    }
    if (specification.present) {
      map['specification'] = Variable<String>(specification.value);
    }
    if (dosageForm.present) {
      map['dosage_form'] = Variable<String>(dosageForm.value);
    }
    if (indication.present) {
      map['indication'] = Variable<String>(indication.value);
    }
    if (storageNotes.present) {
      map['storage_notes'] = Variable<String>(storageNotes.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicineItemsCompanion(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('name: $name, ')
          ..write('genericName: $genericName, ')
          ..write('specification: $specification, ')
          ..write('dosageForm: $dosageForm, ')
          ..write('indication: $indication, ')
          ..write('storageNotes: $storageNotes, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicineBatchesTable extends MedicineBatches
    with TableInfo<$MedicineBatchesTable, MedicineBatchRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicineBatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _medicineItemIdMeta =
      const VerificationMeta('medicineItemId');
  @override
  late final GeneratedColumn<String> medicineItemId = GeneratedColumn<String>(
      'medicine_item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expiryDateMeta =
      const VerificationMeta('expiryDate');
  @override
  late final GeneratedColumn<DateTime> expiryDate = GeneratedColumn<DateTime>(
      'expiry_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lowStockThresholdMeta =
      const VerificationMeta('lowStockThreshold');
  @override
  late final GeneratedColumn<double> lowStockThreshold =
      GeneratedColumn<double>('low_stock_threshold', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(1));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        medicineItemId,
        quantity,
        unit,
        expiryDate,
        lowStockThreshold,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicine_batches';
  @override
  VerificationContext validateIntegrity(Insertable<MedicineBatchRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('medicine_item_id')) {
      context.handle(
          _medicineItemIdMeta,
          medicineItemId.isAcceptableOrUnknown(
              data['medicine_item_id']!, _medicineItemIdMeta));
    } else if (isInserting) {
      context.missing(_medicineItemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
          _expiryDateMeta,
          expiryDate.isAcceptableOrUnknown(
              data['expiry_date']!, _expiryDateMeta));
    } else if (isInserting) {
      context.missing(_expiryDateMeta);
    }
    if (data.containsKey('low_stock_threshold')) {
      context.handle(
          _lowStockThresholdMeta,
          lowStockThreshold.isAcceptableOrUnknown(
              data['low_stock_threshold']!, _lowStockThresholdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicineBatchRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicineBatchRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      medicineItemId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}medicine_item_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      expiryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expiry_date'])!,
      lowStockThreshold: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}low_stock_threshold'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MedicineBatchesTable createAlias(String alias) {
    return $MedicineBatchesTable(attachedDatabase, alias);
  }
}

class MedicineBatchRow extends DataClass
    implements Insertable<MedicineBatchRow> {
  final String id;
  final String medicineItemId;
  final double quantity;
  final String unit;
  final DateTime expiryDate;
  final double lowStockThreshold;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MedicineBatchRow(
      {required this.id,
      required this.medicineItemId,
      required this.quantity,
      required this.unit,
      required this.expiryDate,
      required this.lowStockThreshold,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medicine_item_id'] = Variable<String>(medicineItemId);
    map['quantity'] = Variable<double>(quantity);
    map['unit'] = Variable<String>(unit);
    map['expiry_date'] = Variable<DateTime>(expiryDate);
    map['low_stock_threshold'] = Variable<double>(lowStockThreshold);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MedicineBatchesCompanion toCompanion(bool nullToAbsent) {
    return MedicineBatchesCompanion(
      id: Value(id),
      medicineItemId: Value(medicineItemId),
      quantity: Value(quantity),
      unit: Value(unit),
      expiryDate: Value(expiryDate),
      lowStockThreshold: Value(lowStockThreshold),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MedicineBatchRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicineBatchRow(
      id: serializer.fromJson<String>(json['id']),
      medicineItemId: serializer.fromJson<String>(json['medicineItemId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unit: serializer.fromJson<String>(json['unit']),
      expiryDate: serializer.fromJson<DateTime>(json['expiryDate']),
      lowStockThreshold: serializer.fromJson<double>(json['lowStockThreshold']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medicineItemId': serializer.toJson<String>(medicineItemId),
      'quantity': serializer.toJson<double>(quantity),
      'unit': serializer.toJson<String>(unit),
      'expiryDate': serializer.toJson<DateTime>(expiryDate),
      'lowStockThreshold': serializer.toJson<double>(lowStockThreshold),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MedicineBatchRow copyWith(
          {String? id,
          String? medicineItemId,
          double? quantity,
          String? unit,
          DateTime? expiryDate,
          double? lowStockThreshold,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MedicineBatchRow(
        id: id ?? this.id,
        medicineItemId: medicineItemId ?? this.medicineItemId,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
        expiryDate: expiryDate ?? this.expiryDate,
        lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MedicineBatchRow copyWithCompanion(MedicineBatchesCompanion data) {
    return MedicineBatchRow(
      id: data.id.present ? data.id.value : this.id,
      medicineItemId: data.medicineItemId.present
          ? data.medicineItemId.value
          : this.medicineItemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unit: data.unit.present ? data.unit.value : this.unit,
      expiryDate:
          data.expiryDate.present ? data.expiryDate.value : this.expiryDate,
      lowStockThreshold: data.lowStockThreshold.present
          ? data.lowStockThreshold.value
          : this.lowStockThreshold,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicineBatchRow(')
          ..write('id: $id, ')
          ..write('medicineItemId: $medicineItemId, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('lowStockThreshold: $lowStockThreshold, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medicineItemId, quantity, unit,
      expiryDate, lowStockThreshold, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicineBatchRow &&
          other.id == this.id &&
          other.medicineItemId == this.medicineItemId &&
          other.quantity == this.quantity &&
          other.unit == this.unit &&
          other.expiryDate == this.expiryDate &&
          other.lowStockThreshold == this.lowStockThreshold &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MedicineBatchesCompanion extends UpdateCompanion<MedicineBatchRow> {
  final Value<String> id;
  final Value<String> medicineItemId;
  final Value<double> quantity;
  final Value<String> unit;
  final Value<DateTime> expiryDate;
  final Value<double> lowStockThreshold;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MedicineBatchesCompanion({
    this.id = const Value.absent(),
    this.medicineItemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.lowStockThreshold = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicineBatchesCompanion.insert({
    required String id,
    required String medicineItemId,
    required double quantity,
    required String unit,
    required DateTime expiryDate,
    this.lowStockThreshold = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        medicineItemId = Value(medicineItemId),
        quantity = Value(quantity),
        unit = Value(unit),
        expiryDate = Value(expiryDate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<MedicineBatchRow> custom({
    Expression<String>? id,
    Expression<String>? medicineItemId,
    Expression<double>? quantity,
    Expression<String>? unit,
    Expression<DateTime>? expiryDate,
    Expression<double>? lowStockThreshold,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicineItemId != null) 'medicine_item_id': medicineItemId,
      if (quantity != null) 'quantity': quantity,
      if (unit != null) 'unit': unit,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (lowStockThreshold != null) 'low_stock_threshold': lowStockThreshold,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicineBatchesCompanion copyWith(
      {Value<String>? id,
      Value<String>? medicineItemId,
      Value<double>? quantity,
      Value<String>? unit,
      Value<DateTime>? expiryDate,
      Value<double>? lowStockThreshold,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return MedicineBatchesCompanion(
      id: id ?? this.id,
      medicineItemId: medicineItemId ?? this.medicineItemId,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      expiryDate: expiryDate ?? this.expiryDate,
      lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicineItemId.present) {
      map['medicine_item_id'] = Variable<String>(medicineItemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<DateTime>(expiryDate.value);
    }
    if (lowStockThreshold.present) {
      map['low_stock_threshold'] = Variable<double>(lowStockThreshold.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicineBatchesCompanion(')
          ..write('id: $id, ')
          ..write('medicineItemId: $medicineItemId, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('lowStockThreshold: $lowStockThreshold, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VisitRecordsTable extends VisitRecords
    with TableInfo<$VisitRecordsTable, VisitRecordRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisitRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
      'member_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _visitDateMeta =
      const VerificationMeta('visitDate');
  @override
  late final GeneratedColumn<DateTime> visitDate = GeneratedColumn<DateTime>(
      'visit_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _hospitalNameMeta =
      const VerificationMeta('hospitalName');
  @override
  late final GeneratedColumn<String> hospitalName = GeneratedColumn<String>(
      'hospital_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _departmentMeta =
      const VerificationMeta('department');
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
      'department', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _diagnosisSummaryMeta =
      const VerificationMeta('diagnosisSummary');
  @override
  late final GeneratedColumn<String> diagnosisSummary = GeneratedColumn<String>(
      'diagnosis_summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doctorNameMeta =
      const VerificationMeta('doctorName');
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
      'doctor_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        memberId,
        visitDate,
        hospitalName,
        department,
        diagnosisSummary,
        doctorName,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visit_records';
  @override
  VerificationContext validateIntegrity(Insertable<VisitRecordRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('visit_date')) {
      context.handle(_visitDateMeta,
          visitDate.isAcceptableOrUnknown(data['visit_date']!, _visitDateMeta));
    } else if (isInserting) {
      context.missing(_visitDateMeta);
    }
    if (data.containsKey('hospital_name')) {
      context.handle(
          _hospitalNameMeta,
          hospitalName.isAcceptableOrUnknown(
              data['hospital_name']!, _hospitalNameMeta));
    }
    if (data.containsKey('department')) {
      context.handle(
          _departmentMeta,
          department.isAcceptableOrUnknown(
              data['department']!, _departmentMeta));
    }
    if (data.containsKey('diagnosis_summary')) {
      context.handle(
          _diagnosisSummaryMeta,
          diagnosisSummary.isAcceptableOrUnknown(
              data['diagnosis_summary']!, _diagnosisSummaryMeta));
    } else if (isInserting) {
      context.missing(_diagnosisSummaryMeta);
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
          _doctorNameMeta,
          doctorName.isAcceptableOrUnknown(
              data['doctor_name']!, _doctorNameMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VisitRecordRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VisitRecordRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_id'])!,
      visitDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}visit_date'])!,
      hospitalName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hospital_name']),
      department: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}department']),
      diagnosisSummary: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}diagnosis_summary'])!,
      doctorName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_name']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $VisitRecordsTable createAlias(String alias) {
    return $VisitRecordsTable(attachedDatabase, alias);
  }
}

class VisitRecordRow extends DataClass implements Insertable<VisitRecordRow> {
  final String id;
  final String memberId;
  final DateTime visitDate;
  final String? hospitalName;
  final String? department;
  final String diagnosisSummary;
  final String? doctorName;
  final DateTime createdAt;
  final DateTime updatedAt;
  const VisitRecordRow(
      {required this.id,
      required this.memberId,
      required this.visitDate,
      this.hospitalName,
      this.department,
      required this.diagnosisSummary,
      this.doctorName,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['member_id'] = Variable<String>(memberId);
    map['visit_date'] = Variable<DateTime>(visitDate);
    if (!nullToAbsent || hospitalName != null) {
      map['hospital_name'] = Variable<String>(hospitalName);
    }
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    map['diagnosis_summary'] = Variable<String>(diagnosisSummary);
    if (!nullToAbsent || doctorName != null) {
      map['doctor_name'] = Variable<String>(doctorName);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VisitRecordsCompanion toCompanion(bool nullToAbsent) {
    return VisitRecordsCompanion(
      id: Value(id),
      memberId: Value(memberId),
      visitDate: Value(visitDate),
      hospitalName: hospitalName == null && nullToAbsent
          ? const Value.absent()
          : Value(hospitalName),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
      diagnosisSummary: Value(diagnosisSummary),
      doctorName: doctorName == null && nullToAbsent
          ? const Value.absent()
          : Value(doctorName),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory VisitRecordRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VisitRecordRow(
      id: serializer.fromJson<String>(json['id']),
      memberId: serializer.fromJson<String>(json['memberId']),
      visitDate: serializer.fromJson<DateTime>(json['visitDate']),
      hospitalName: serializer.fromJson<String?>(json['hospitalName']),
      department: serializer.fromJson<String?>(json['department']),
      diagnosisSummary: serializer.fromJson<String>(json['diagnosisSummary']),
      doctorName: serializer.fromJson<String?>(json['doctorName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'memberId': serializer.toJson<String>(memberId),
      'visitDate': serializer.toJson<DateTime>(visitDate),
      'hospitalName': serializer.toJson<String?>(hospitalName),
      'department': serializer.toJson<String?>(department),
      'diagnosisSummary': serializer.toJson<String>(diagnosisSummary),
      'doctorName': serializer.toJson<String?>(doctorName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  VisitRecordRow copyWith(
          {String? id,
          String? memberId,
          DateTime? visitDate,
          Value<String?> hospitalName = const Value.absent(),
          Value<String?> department = const Value.absent(),
          String? diagnosisSummary,
          Value<String?> doctorName = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      VisitRecordRow(
        id: id ?? this.id,
        memberId: memberId ?? this.memberId,
        visitDate: visitDate ?? this.visitDate,
        hospitalName:
            hospitalName.present ? hospitalName.value : this.hospitalName,
        department: department.present ? department.value : this.department,
        diagnosisSummary: diagnosisSummary ?? this.diagnosisSummary,
        doctorName: doctorName.present ? doctorName.value : this.doctorName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  VisitRecordRow copyWithCompanion(VisitRecordsCompanion data) {
    return VisitRecordRow(
      id: data.id.present ? data.id.value : this.id,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      visitDate: data.visitDate.present ? data.visitDate.value : this.visitDate,
      hospitalName: data.hospitalName.present
          ? data.hospitalName.value
          : this.hospitalName,
      department:
          data.department.present ? data.department.value : this.department,
      diagnosisSummary: data.diagnosisSummary.present
          ? data.diagnosisSummary.value
          : this.diagnosisSummary,
      doctorName:
          data.doctorName.present ? data.doctorName.value : this.doctorName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VisitRecordRow(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('visitDate: $visitDate, ')
          ..write('hospitalName: $hospitalName, ')
          ..write('department: $department, ')
          ..write('diagnosisSummary: $diagnosisSummary, ')
          ..write('doctorName: $doctorName, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, memberId, visitDate, hospitalName,
      department, diagnosisSummary, doctorName, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VisitRecordRow &&
          other.id == this.id &&
          other.memberId == this.memberId &&
          other.visitDate == this.visitDate &&
          other.hospitalName == this.hospitalName &&
          other.department == this.department &&
          other.diagnosisSummary == this.diagnosisSummary &&
          other.doctorName == this.doctorName &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VisitRecordsCompanion extends UpdateCompanion<VisitRecordRow> {
  final Value<String> id;
  final Value<String> memberId;
  final Value<DateTime> visitDate;
  final Value<String?> hospitalName;
  final Value<String?> department;
  final Value<String> diagnosisSummary;
  final Value<String?> doctorName;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const VisitRecordsCompanion({
    this.id = const Value.absent(),
    this.memberId = const Value.absent(),
    this.visitDate = const Value.absent(),
    this.hospitalName = const Value.absent(),
    this.department = const Value.absent(),
    this.diagnosisSummary = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VisitRecordsCompanion.insert({
    required String id,
    required String memberId,
    required DateTime visitDate,
    this.hospitalName = const Value.absent(),
    this.department = const Value.absent(),
    required String diagnosisSummary,
    this.doctorName = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        memberId = Value(memberId),
        visitDate = Value(visitDate),
        diagnosisSummary = Value(diagnosisSummary),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<VisitRecordRow> custom({
    Expression<String>? id,
    Expression<String>? memberId,
    Expression<DateTime>? visitDate,
    Expression<String>? hospitalName,
    Expression<String>? department,
    Expression<String>? diagnosisSummary,
    Expression<String>? doctorName,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memberId != null) 'member_id': memberId,
      if (visitDate != null) 'visit_date': visitDate,
      if (hospitalName != null) 'hospital_name': hospitalName,
      if (department != null) 'department': department,
      if (diagnosisSummary != null) 'diagnosis_summary': diagnosisSummary,
      if (doctorName != null) 'doctor_name': doctorName,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VisitRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? memberId,
      Value<DateTime>? visitDate,
      Value<String?>? hospitalName,
      Value<String?>? department,
      Value<String>? diagnosisSummary,
      Value<String?>? doctorName,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return VisitRecordsCompanion(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      visitDate: visitDate ?? this.visitDate,
      hospitalName: hospitalName ?? this.hospitalName,
      department: department ?? this.department,
      diagnosisSummary: diagnosisSummary ?? this.diagnosisSummary,
      doctorName: doctorName ?? this.doctorName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (visitDate.present) {
      map['visit_date'] = Variable<DateTime>(visitDate.value);
    }
    if (hospitalName.present) {
      map['hospital_name'] = Variable<String>(hospitalName.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (diagnosisSummary.present) {
      map['diagnosis_summary'] = Variable<String>(diagnosisSummary.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitRecordsCompanion(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('visitDate: $visitDate, ')
          ..write('hospitalName: $hospitalName, ')
          ..write('department: $department, ')
          ..write('diagnosisSummary: $diagnosisSummary, ')
          ..write('doctorName: $doctorName, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicalDocumentRecordsTable extends MedicalDocumentRecords
    with TableInfo<$MedicalDocumentRecordsTable, MedicalDocumentRecordRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicalDocumentRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _visitRecordIdMeta =
      const VerificationMeta('visitRecordId');
  @override
  late final GeneratedColumn<String> visitRecordId = GeneratedColumn<String>(
      'visit_record_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _documentTypeMeta =
      const VerificationMeta('documentType');
  @override
  late final GeneratedColumn<String> documentType = GeneratedColumn<String>(
      'document_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _extractedTextMeta =
      const VerificationMeta('extractedText');
  @override
  late final GeneratedColumn<String> extractedText = GeneratedColumn<String>(
      'extracted_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _keyIndicatorsMeta =
      const VerificationMeta('keyIndicators');
  @override
  late final GeneratedColumn<String> keyIndicators = GeneratedColumn<String>(
      'key_indicators', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageAssetIdsJsonMeta =
      const VerificationMeta('imageAssetIdsJson');
  @override
  late final GeneratedColumn<String> imageAssetIdsJson =
      GeneratedColumn<String>('image_asset_ids_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        visitRecordId,
        documentType,
        summary,
        extractedText,
        keyIndicators,
        imageAssetIdsJson,
        source,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medical_document_records';
  @override
  VerificationContext validateIntegrity(
      Insertable<MedicalDocumentRecordRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('visit_record_id')) {
      context.handle(
          _visitRecordIdMeta,
          visitRecordId.isAcceptableOrUnknown(
              data['visit_record_id']!, _visitRecordIdMeta));
    } else if (isInserting) {
      context.missing(_visitRecordIdMeta);
    }
    if (data.containsKey('document_type')) {
      context.handle(
          _documentTypeMeta,
          documentType.isAcceptableOrUnknown(
              data['document_type']!, _documentTypeMeta));
    } else if (isInserting) {
      context.missing(_documentTypeMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('extracted_text')) {
      context.handle(
          _extractedTextMeta,
          extractedText.isAcceptableOrUnknown(
              data['extracted_text']!, _extractedTextMeta));
    }
    if (data.containsKey('key_indicators')) {
      context.handle(
          _keyIndicatorsMeta,
          keyIndicators.isAcceptableOrUnknown(
              data['key_indicators']!, _keyIndicatorsMeta));
    }
    if (data.containsKey('image_asset_ids_json')) {
      context.handle(
          _imageAssetIdsJsonMeta,
          imageAssetIdsJson.isAcceptableOrUnknown(
              data['image_asset_ids_json']!, _imageAssetIdsJsonMeta));
    } else if (isInserting) {
      context.missing(_imageAssetIdsJsonMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicalDocumentRecordRow map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicalDocumentRecordRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      visitRecordId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}visit_record_id'])!,
      documentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}document_type'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary'])!,
      extractedText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}extracted_text']),
      keyIndicators: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key_indicators']),
      imageAssetIdsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}image_asset_ids_json'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MedicalDocumentRecordsTable createAlias(String alias) {
    return $MedicalDocumentRecordsTable(attachedDatabase, alias);
  }
}

class MedicalDocumentRecordRow extends DataClass
    implements Insertable<MedicalDocumentRecordRow> {
  final String id;
  final String visitRecordId;
  final String documentType;
  final String summary;
  final String? extractedText;
  final String? keyIndicators;
  final String imageAssetIdsJson;
  final String source;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MedicalDocumentRecordRow(
      {required this.id,
      required this.visitRecordId,
      required this.documentType,
      required this.summary,
      this.extractedText,
      this.keyIndicators,
      required this.imageAssetIdsJson,
      required this.source,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['visit_record_id'] = Variable<String>(visitRecordId);
    map['document_type'] = Variable<String>(documentType);
    map['summary'] = Variable<String>(summary);
    if (!nullToAbsent || extractedText != null) {
      map['extracted_text'] = Variable<String>(extractedText);
    }
    if (!nullToAbsent || keyIndicators != null) {
      map['key_indicators'] = Variable<String>(keyIndicators);
    }
    map['image_asset_ids_json'] = Variable<String>(imageAssetIdsJson);
    map['source'] = Variable<String>(source);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MedicalDocumentRecordsCompanion toCompanion(bool nullToAbsent) {
    return MedicalDocumentRecordsCompanion(
      id: Value(id),
      visitRecordId: Value(visitRecordId),
      documentType: Value(documentType),
      summary: Value(summary),
      extractedText: extractedText == null && nullToAbsent
          ? const Value.absent()
          : Value(extractedText),
      keyIndicators: keyIndicators == null && nullToAbsent
          ? const Value.absent()
          : Value(keyIndicators),
      imageAssetIdsJson: Value(imageAssetIdsJson),
      source: Value(source),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MedicalDocumentRecordRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicalDocumentRecordRow(
      id: serializer.fromJson<String>(json['id']),
      visitRecordId: serializer.fromJson<String>(json['visitRecordId']),
      documentType: serializer.fromJson<String>(json['documentType']),
      summary: serializer.fromJson<String>(json['summary']),
      extractedText: serializer.fromJson<String?>(json['extractedText']),
      keyIndicators: serializer.fromJson<String?>(json['keyIndicators']),
      imageAssetIdsJson: serializer.fromJson<String>(json['imageAssetIdsJson']),
      source: serializer.fromJson<String>(json['source']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'visitRecordId': serializer.toJson<String>(visitRecordId),
      'documentType': serializer.toJson<String>(documentType),
      'summary': serializer.toJson<String>(summary),
      'extractedText': serializer.toJson<String?>(extractedText),
      'keyIndicators': serializer.toJson<String?>(keyIndicators),
      'imageAssetIdsJson': serializer.toJson<String>(imageAssetIdsJson),
      'source': serializer.toJson<String>(source),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MedicalDocumentRecordRow copyWith(
          {String? id,
          String? visitRecordId,
          String? documentType,
          String? summary,
          Value<String?> extractedText = const Value.absent(),
          Value<String?> keyIndicators = const Value.absent(),
          String? imageAssetIdsJson,
          String? source,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MedicalDocumentRecordRow(
        id: id ?? this.id,
        visitRecordId: visitRecordId ?? this.visitRecordId,
        documentType: documentType ?? this.documentType,
        summary: summary ?? this.summary,
        extractedText:
            extractedText.present ? extractedText.value : this.extractedText,
        keyIndicators:
            keyIndicators.present ? keyIndicators.value : this.keyIndicators,
        imageAssetIdsJson: imageAssetIdsJson ?? this.imageAssetIdsJson,
        source: source ?? this.source,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MedicalDocumentRecordRow copyWithCompanion(
      MedicalDocumentRecordsCompanion data) {
    return MedicalDocumentRecordRow(
      id: data.id.present ? data.id.value : this.id,
      visitRecordId: data.visitRecordId.present
          ? data.visitRecordId.value
          : this.visitRecordId,
      documentType: data.documentType.present
          ? data.documentType.value
          : this.documentType,
      summary: data.summary.present ? data.summary.value : this.summary,
      extractedText: data.extractedText.present
          ? data.extractedText.value
          : this.extractedText,
      keyIndicators: data.keyIndicators.present
          ? data.keyIndicators.value
          : this.keyIndicators,
      imageAssetIdsJson: data.imageAssetIdsJson.present
          ? data.imageAssetIdsJson.value
          : this.imageAssetIdsJson,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicalDocumentRecordRow(')
          ..write('id: $id, ')
          ..write('visitRecordId: $visitRecordId, ')
          ..write('documentType: $documentType, ')
          ..write('summary: $summary, ')
          ..write('extractedText: $extractedText, ')
          ..write('keyIndicators: $keyIndicators, ')
          ..write('imageAssetIdsJson: $imageAssetIdsJson, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      visitRecordId,
      documentType,
      summary,
      extractedText,
      keyIndicators,
      imageAssetIdsJson,
      source,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicalDocumentRecordRow &&
          other.id == this.id &&
          other.visitRecordId == this.visitRecordId &&
          other.documentType == this.documentType &&
          other.summary == this.summary &&
          other.extractedText == this.extractedText &&
          other.keyIndicators == this.keyIndicators &&
          other.imageAssetIdsJson == this.imageAssetIdsJson &&
          other.source == this.source &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MedicalDocumentRecordsCompanion
    extends UpdateCompanion<MedicalDocumentRecordRow> {
  final Value<String> id;
  final Value<String> visitRecordId;
  final Value<String> documentType;
  final Value<String> summary;
  final Value<String?> extractedText;
  final Value<String?> keyIndicators;
  final Value<String> imageAssetIdsJson;
  final Value<String> source;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MedicalDocumentRecordsCompanion({
    this.id = const Value.absent(),
    this.visitRecordId = const Value.absent(),
    this.documentType = const Value.absent(),
    this.summary = const Value.absent(),
    this.extractedText = const Value.absent(),
    this.keyIndicators = const Value.absent(),
    this.imageAssetIdsJson = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicalDocumentRecordsCompanion.insert({
    required String id,
    required String visitRecordId,
    required String documentType,
    required String summary,
    this.extractedText = const Value.absent(),
    this.keyIndicators = const Value.absent(),
    required String imageAssetIdsJson,
    required String source,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        visitRecordId = Value(visitRecordId),
        documentType = Value(documentType),
        summary = Value(summary),
        imageAssetIdsJson = Value(imageAssetIdsJson),
        source = Value(source),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<MedicalDocumentRecordRow> custom({
    Expression<String>? id,
    Expression<String>? visitRecordId,
    Expression<String>? documentType,
    Expression<String>? summary,
    Expression<String>? extractedText,
    Expression<String>? keyIndicators,
    Expression<String>? imageAssetIdsJson,
    Expression<String>? source,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (visitRecordId != null) 'visit_record_id': visitRecordId,
      if (documentType != null) 'document_type': documentType,
      if (summary != null) 'summary': summary,
      if (extractedText != null) 'extracted_text': extractedText,
      if (keyIndicators != null) 'key_indicators': keyIndicators,
      if (imageAssetIdsJson != null) 'image_asset_ids_json': imageAssetIdsJson,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicalDocumentRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? visitRecordId,
      Value<String>? documentType,
      Value<String>? summary,
      Value<String?>? extractedText,
      Value<String?>? keyIndicators,
      Value<String>? imageAssetIdsJson,
      Value<String>? source,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return MedicalDocumentRecordsCompanion(
      id: id ?? this.id,
      visitRecordId: visitRecordId ?? this.visitRecordId,
      documentType: documentType ?? this.documentType,
      summary: summary ?? this.summary,
      extractedText: extractedText ?? this.extractedText,
      keyIndicators: keyIndicators ?? this.keyIndicators,
      imageAssetIdsJson: imageAssetIdsJson ?? this.imageAssetIdsJson,
      source: source ?? this.source,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (visitRecordId.present) {
      map['visit_record_id'] = Variable<String>(visitRecordId.value);
    }
    if (documentType.present) {
      map['document_type'] = Variable<String>(documentType.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (extractedText.present) {
      map['extracted_text'] = Variable<String>(extractedText.value);
    }
    if (keyIndicators.present) {
      map['key_indicators'] = Variable<String>(keyIndicators.value);
    }
    if (imageAssetIdsJson.present) {
      map['image_asset_ids_json'] = Variable<String>(imageAssetIdsJson.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicalDocumentRecordsCompanion(')
          ..write('id: $id, ')
          ..write('visitRecordId: $visitRecordId, ')
          ..write('documentType: $documentType, ')
          ..write('summary: $summary, ')
          ..write('extractedText: $extractedText, ')
          ..write('keyIndicators: $keyIndicators, ')
          ..write('imageAssetIdsJson: $imageAssetIdsJson, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecognitionDraftsTable extends RecognitionDrafts
    with TableInfo<$RecognitionDraftsTable, RecognitionDraftRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecognitionDraftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _draftTypeMeta =
      const VerificationMeta('draftType');
  @override
  late final GeneratedColumn<String> draftType = GeneratedColumn<String>(
      'draft_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
      'member_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recognizedPayloadJsonMeta =
      const VerificationMeta('recognizedPayloadJson');
  @override
  late final GeneratedColumn<String> recognizedPayloadJson =
      GeneratedColumn<String>('recognized_payload_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _missingFieldsJsonMeta =
      const VerificationMeta('missingFieldsJson');
  @override
  late final GeneratedColumn<String> missingFieldsJson =
      GeneratedColumn<String>('missing_fields_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageAssetIdsJsonMeta =
      const VerificationMeta('imageAssetIdsJson');
  @override
  late final GeneratedColumn<String> imageAssetIdsJson =
      GeneratedColumn<String>('image_asset_ids_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _errorMessageMeta =
      const VerificationMeta('errorMessage');
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
      'error_message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        draftType,
        memberId,
        status,
        recognizedPayloadJson,
        missingFieldsJson,
        imageAssetIdsJson,
        errorMessage,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recognition_drafts';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecognitionDraftRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('draft_type')) {
      context.handle(_draftTypeMeta,
          draftType.isAcceptableOrUnknown(data['draft_type']!, _draftTypeMeta));
    } else if (isInserting) {
      context.missing(_draftTypeMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('recognized_payload_json')) {
      context.handle(
          _recognizedPayloadJsonMeta,
          recognizedPayloadJson.isAcceptableOrUnknown(
              data['recognized_payload_json']!, _recognizedPayloadJsonMeta));
    } else if (isInserting) {
      context.missing(_recognizedPayloadJsonMeta);
    }
    if (data.containsKey('missing_fields_json')) {
      context.handle(
          _missingFieldsJsonMeta,
          missingFieldsJson.isAcceptableOrUnknown(
              data['missing_fields_json']!, _missingFieldsJsonMeta));
    } else if (isInserting) {
      context.missing(_missingFieldsJsonMeta);
    }
    if (data.containsKey('image_asset_ids_json')) {
      context.handle(
          _imageAssetIdsJsonMeta,
          imageAssetIdsJson.isAcceptableOrUnknown(
              data['image_asset_ids_json']!, _imageAssetIdsJsonMeta));
    } else if (isInserting) {
      context.missing(_imageAssetIdsJsonMeta);
    }
    if (data.containsKey('error_message')) {
      context.handle(
          _errorMessageMeta,
          errorMessage.isAcceptableOrUnknown(
              data['error_message']!, _errorMessageMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecognitionDraftRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecognitionDraftRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      draftType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}draft_type'])!,
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      recognizedPayloadJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}recognized_payload_json'])!,
      missingFieldsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}missing_fields_json'])!,
      imageAssetIdsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}image_asset_ids_json'])!,
      errorMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error_message']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $RecognitionDraftsTable createAlias(String alias) {
    return $RecognitionDraftsTable(attachedDatabase, alias);
  }
}

class RecognitionDraftRow extends DataClass
    implements Insertable<RecognitionDraftRow> {
  final String id;
  final String draftType;
  final String memberId;
  final String status;
  final String recognizedPayloadJson;
  final String missingFieldsJson;
  final String imageAssetIdsJson;
  final String? errorMessage;
  final DateTime createdAt;
  final DateTime updatedAt;
  const RecognitionDraftRow(
      {required this.id,
      required this.draftType,
      required this.memberId,
      required this.status,
      required this.recognizedPayloadJson,
      required this.missingFieldsJson,
      required this.imageAssetIdsJson,
      this.errorMessage,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['draft_type'] = Variable<String>(draftType);
    map['member_id'] = Variable<String>(memberId);
    map['status'] = Variable<String>(status);
    map['recognized_payload_json'] = Variable<String>(recognizedPayloadJson);
    map['missing_fields_json'] = Variable<String>(missingFieldsJson);
    map['image_asset_ids_json'] = Variable<String>(imageAssetIdsJson);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RecognitionDraftsCompanion toCompanion(bool nullToAbsent) {
    return RecognitionDraftsCompanion(
      id: Value(id),
      draftType: Value(draftType),
      memberId: Value(memberId),
      status: Value(status),
      recognizedPayloadJson: Value(recognizedPayloadJson),
      missingFieldsJson: Value(missingFieldsJson),
      imageAssetIdsJson: Value(imageAssetIdsJson),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RecognitionDraftRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecognitionDraftRow(
      id: serializer.fromJson<String>(json['id']),
      draftType: serializer.fromJson<String>(json['draftType']),
      memberId: serializer.fromJson<String>(json['memberId']),
      status: serializer.fromJson<String>(json['status']),
      recognizedPayloadJson:
          serializer.fromJson<String>(json['recognizedPayloadJson']),
      missingFieldsJson: serializer.fromJson<String>(json['missingFieldsJson']),
      imageAssetIdsJson: serializer.fromJson<String>(json['imageAssetIdsJson']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'draftType': serializer.toJson<String>(draftType),
      'memberId': serializer.toJson<String>(memberId),
      'status': serializer.toJson<String>(status),
      'recognizedPayloadJson': serializer.toJson<String>(recognizedPayloadJson),
      'missingFieldsJson': serializer.toJson<String>(missingFieldsJson),
      'imageAssetIdsJson': serializer.toJson<String>(imageAssetIdsJson),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RecognitionDraftRow copyWith(
          {String? id,
          String? draftType,
          String? memberId,
          String? status,
          String? recognizedPayloadJson,
          String? missingFieldsJson,
          String? imageAssetIdsJson,
          Value<String?> errorMessage = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      RecognitionDraftRow(
        id: id ?? this.id,
        draftType: draftType ?? this.draftType,
        memberId: memberId ?? this.memberId,
        status: status ?? this.status,
        recognizedPayloadJson:
            recognizedPayloadJson ?? this.recognizedPayloadJson,
        missingFieldsJson: missingFieldsJson ?? this.missingFieldsJson,
        imageAssetIdsJson: imageAssetIdsJson ?? this.imageAssetIdsJson,
        errorMessage:
            errorMessage.present ? errorMessage.value : this.errorMessage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  RecognitionDraftRow copyWithCompanion(RecognitionDraftsCompanion data) {
    return RecognitionDraftRow(
      id: data.id.present ? data.id.value : this.id,
      draftType: data.draftType.present ? data.draftType.value : this.draftType,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      status: data.status.present ? data.status.value : this.status,
      recognizedPayloadJson: data.recognizedPayloadJson.present
          ? data.recognizedPayloadJson.value
          : this.recognizedPayloadJson,
      missingFieldsJson: data.missingFieldsJson.present
          ? data.missingFieldsJson.value
          : this.missingFieldsJson,
      imageAssetIdsJson: data.imageAssetIdsJson.present
          ? data.imageAssetIdsJson.value
          : this.imageAssetIdsJson,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecognitionDraftRow(')
          ..write('id: $id, ')
          ..write('draftType: $draftType, ')
          ..write('memberId: $memberId, ')
          ..write('status: $status, ')
          ..write('recognizedPayloadJson: $recognizedPayloadJson, ')
          ..write('missingFieldsJson: $missingFieldsJson, ')
          ..write('imageAssetIdsJson: $imageAssetIdsJson, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      draftType,
      memberId,
      status,
      recognizedPayloadJson,
      missingFieldsJson,
      imageAssetIdsJson,
      errorMessage,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecognitionDraftRow &&
          other.id == this.id &&
          other.draftType == this.draftType &&
          other.memberId == this.memberId &&
          other.status == this.status &&
          other.recognizedPayloadJson == this.recognizedPayloadJson &&
          other.missingFieldsJson == this.missingFieldsJson &&
          other.imageAssetIdsJson == this.imageAssetIdsJson &&
          other.errorMessage == this.errorMessage &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RecognitionDraftsCompanion extends UpdateCompanion<RecognitionDraftRow> {
  final Value<String> id;
  final Value<String> draftType;
  final Value<String> memberId;
  final Value<String> status;
  final Value<String> recognizedPayloadJson;
  final Value<String> missingFieldsJson;
  final Value<String> imageAssetIdsJson;
  final Value<String?> errorMessage;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const RecognitionDraftsCompanion({
    this.id = const Value.absent(),
    this.draftType = const Value.absent(),
    this.memberId = const Value.absent(),
    this.status = const Value.absent(),
    this.recognizedPayloadJson = const Value.absent(),
    this.missingFieldsJson = const Value.absent(),
    this.imageAssetIdsJson = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecognitionDraftsCompanion.insert({
    required String id,
    required String draftType,
    required String memberId,
    required String status,
    required String recognizedPayloadJson,
    required String missingFieldsJson,
    required String imageAssetIdsJson,
    this.errorMessage = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        draftType = Value(draftType),
        memberId = Value(memberId),
        status = Value(status),
        recognizedPayloadJson = Value(recognizedPayloadJson),
        missingFieldsJson = Value(missingFieldsJson),
        imageAssetIdsJson = Value(imageAssetIdsJson),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<RecognitionDraftRow> custom({
    Expression<String>? id,
    Expression<String>? draftType,
    Expression<String>? memberId,
    Expression<String>? status,
    Expression<String>? recognizedPayloadJson,
    Expression<String>? missingFieldsJson,
    Expression<String>? imageAssetIdsJson,
    Expression<String>? errorMessage,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (draftType != null) 'draft_type': draftType,
      if (memberId != null) 'member_id': memberId,
      if (status != null) 'status': status,
      if (recognizedPayloadJson != null)
        'recognized_payload_json': recognizedPayloadJson,
      if (missingFieldsJson != null) 'missing_fields_json': missingFieldsJson,
      if (imageAssetIdsJson != null) 'image_asset_ids_json': imageAssetIdsJson,
      if (errorMessage != null) 'error_message': errorMessage,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecognitionDraftsCompanion copyWith(
      {Value<String>? id,
      Value<String>? draftType,
      Value<String>? memberId,
      Value<String>? status,
      Value<String>? recognizedPayloadJson,
      Value<String>? missingFieldsJson,
      Value<String>? imageAssetIdsJson,
      Value<String?>? errorMessage,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return RecognitionDraftsCompanion(
      id: id ?? this.id,
      draftType: draftType ?? this.draftType,
      memberId: memberId ?? this.memberId,
      status: status ?? this.status,
      recognizedPayloadJson:
          recognizedPayloadJson ?? this.recognizedPayloadJson,
      missingFieldsJson: missingFieldsJson ?? this.missingFieldsJson,
      imageAssetIdsJson: imageAssetIdsJson ?? this.imageAssetIdsJson,
      errorMessage: errorMessage ?? this.errorMessage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (draftType.present) {
      map['draft_type'] = Variable<String>(draftType.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (recognizedPayloadJson.present) {
      map['recognized_payload_json'] =
          Variable<String>(recognizedPayloadJson.value);
    }
    if (missingFieldsJson.present) {
      map['missing_fields_json'] = Variable<String>(missingFieldsJson.value);
    }
    if (imageAssetIdsJson.present) {
      map['image_asset_ids_json'] = Variable<String>(imageAssetIdsJson.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecognitionDraftsCompanion(')
          ..write('id: $id, ')
          ..write('draftType: $draftType, ')
          ..write('memberId: $memberId, ')
          ..write('status: $status, ')
          ..write('recognizedPayloadJson: $recognizedPayloadJson, ')
          ..write('missingFieldsJson: $missingFieldsJson, ')
          ..write('imageAssetIdsJson: $imageAssetIdsJson, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalImageAssetsTable extends LocalImageAssets
    with TableInfo<$LocalImageAssetsTable, LocalImageAssetRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalImageAssetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localPathMeta =
      const VerificationMeta('localPath');
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
      'local_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mimeTypeMeta =
      const VerificationMeta('mimeType');
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
      'mime_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileSizeMeta =
      const VerificationMeta('fileSize');
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
      'file_size', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
      'width', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, localPath, fileName, mimeType, fileSize, width, height, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_image_assets';
  @override
  VerificationContext validateIntegrity(Insertable<LocalImageAssetRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta));
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(_mimeTypeMeta,
          mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta));
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('file_size')) {
      context.handle(_fileSizeMeta,
          fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta));
    } else if (isInserting) {
      context.missing(_fileSizeMeta);
    }
    if (data.containsKey('width')) {
      context.handle(
          _widthMeta, width.isAcceptableOrUnknown(data['width']!, _widthMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalImageAssetRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalImageAssetRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      localPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_path'])!,
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name'])!,
      mimeType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mime_type'])!,
      fileSize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}file_size'])!,
      width: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}width']),
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}height']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalImageAssetsTable createAlias(String alias) {
    return $LocalImageAssetsTable(attachedDatabase, alias);
  }
}

class LocalImageAssetRow extends DataClass
    implements Insertable<LocalImageAssetRow> {
  final String id;
  final String localPath;
  final String fileName;
  final String mimeType;
  final int fileSize;
  final int? width;
  final int? height;
  final DateTime createdAt;
  const LocalImageAssetRow(
      {required this.id,
      required this.localPath,
      required this.fileName,
      required this.mimeType,
      required this.fileSize,
      this.width,
      this.height,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['local_path'] = Variable<String>(localPath);
    map['file_name'] = Variable<String>(fileName);
    map['mime_type'] = Variable<String>(mimeType);
    map['file_size'] = Variable<int>(fileSize);
    if (!nullToAbsent || width != null) {
      map['width'] = Variable<int>(width);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int>(height);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LocalImageAssetsCompanion toCompanion(bool nullToAbsent) {
    return LocalImageAssetsCompanion(
      id: Value(id),
      localPath: Value(localPath),
      fileName: Value(fileName),
      mimeType: Value(mimeType),
      fileSize: Value(fileSize),
      width:
          width == null && nullToAbsent ? const Value.absent() : Value(width),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      createdAt: Value(createdAt),
    );
  }

  factory LocalImageAssetRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalImageAssetRow(
      id: serializer.fromJson<String>(json['id']),
      localPath: serializer.fromJson<String>(json['localPath']),
      fileName: serializer.fromJson<String>(json['fileName']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      fileSize: serializer.fromJson<int>(json['fileSize']),
      width: serializer.fromJson<int?>(json['width']),
      height: serializer.fromJson<int?>(json['height']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'localPath': serializer.toJson<String>(localPath),
      'fileName': serializer.toJson<String>(fileName),
      'mimeType': serializer.toJson<String>(mimeType),
      'fileSize': serializer.toJson<int>(fileSize),
      'width': serializer.toJson<int?>(width),
      'height': serializer.toJson<int?>(height),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalImageAssetRow copyWith(
          {String? id,
          String? localPath,
          String? fileName,
          String? mimeType,
          int? fileSize,
          Value<int?> width = const Value.absent(),
          Value<int?> height = const Value.absent(),
          DateTime? createdAt}) =>
      LocalImageAssetRow(
        id: id ?? this.id,
        localPath: localPath ?? this.localPath,
        fileName: fileName ?? this.fileName,
        mimeType: mimeType ?? this.mimeType,
        fileSize: fileSize ?? this.fileSize,
        width: width.present ? width.value : this.width,
        height: height.present ? height.value : this.height,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalImageAssetRow copyWithCompanion(LocalImageAssetsCompanion data) {
    return LocalImageAssetRow(
      id: data.id.present ? data.id.value : this.id,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalImageAssetRow(')
          ..write('id: $id, ')
          ..write('localPath: $localPath, ')
          ..write('fileName: $fileName, ')
          ..write('mimeType: $mimeType, ')
          ..write('fileSize: $fileSize, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, localPath, fileName, mimeType, fileSize, width, height, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalImageAssetRow &&
          other.id == this.id &&
          other.localPath == this.localPath &&
          other.fileName == this.fileName &&
          other.mimeType == this.mimeType &&
          other.fileSize == this.fileSize &&
          other.width == this.width &&
          other.height == this.height &&
          other.createdAt == this.createdAt);
}

class LocalImageAssetsCompanion extends UpdateCompanion<LocalImageAssetRow> {
  final Value<String> id;
  final Value<String> localPath;
  final Value<String> fileName;
  final Value<String> mimeType;
  final Value<int> fileSize;
  final Value<int?> width;
  final Value<int?> height;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const LocalImageAssetsCompanion({
    this.id = const Value.absent(),
    this.localPath = const Value.absent(),
    this.fileName = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalImageAssetsCompanion.insert({
    required String id,
    required String localPath,
    required String fileName,
    required String mimeType,
    required int fileSize,
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        localPath = Value(localPath),
        fileName = Value(fileName),
        mimeType = Value(mimeType),
        fileSize = Value(fileSize),
        createdAt = Value(createdAt);
  static Insertable<LocalImageAssetRow> custom({
    Expression<String>? id,
    Expression<String>? localPath,
    Expression<String>? fileName,
    Expression<String>? mimeType,
    Expression<int>? fileSize,
    Expression<int>? width,
    Expression<int>? height,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localPath != null) 'local_path': localPath,
      if (fileName != null) 'file_name': fileName,
      if (mimeType != null) 'mime_type': mimeType,
      if (fileSize != null) 'file_size': fileSize,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalImageAssetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? localPath,
      Value<String>? fileName,
      Value<String>? mimeType,
      Value<int>? fileSize,
      Value<int?>? width,
      Value<int?>? height,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return LocalImageAssetsCompanion(
      id: id ?? this.id,
      localPath: localPath ?? this.localPath,
      fileName: fileName ?? this.fileName,
      mimeType: mimeType ?? this.mimeType,
      fileSize: fileSize ?? this.fileSize,
      width: width ?? this.width,
      height: height ?? this.height,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalImageAssetsCompanion(')
          ..write('id: $id, ')
          ..write('localPath: $localPath, ')
          ..write('fileName: $fileName, ')
          ..write('mimeType: $mimeType, ')
          ..write('fileSize: $fileSize, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FamilyMembersTable familyMembers = $FamilyMembersTable(this);
  late final $MedicineItemsTable medicineItems = $MedicineItemsTable(this);
  late final $MedicineBatchesTable medicineBatches =
      $MedicineBatchesTable(this);
  late final $VisitRecordsTable visitRecords = $VisitRecordsTable(this);
  late final $MedicalDocumentRecordsTable medicalDocumentRecords =
      $MedicalDocumentRecordsTable(this);
  late final $RecognitionDraftsTable recognitionDrafts =
      $RecognitionDraftsTable(this);
  late final $LocalImageAssetsTable localImageAssets =
      $LocalImageAssetsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        familyMembers,
        medicineItems,
        medicineBatches,
        visitRecords,
        medicalDocumentRecords,
        recognitionDrafts,
        localImageAssets
      ];
}

typedef $$FamilyMembersTableCreateCompanionBuilder = FamilyMembersCompanion
    Function({
  required String id,
  required String name,
  required String relation,
  Value<bool> isSystemDefault,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$FamilyMembersTableUpdateCompanionBuilder = FamilyMembersCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> relation,
  Value<bool> isSystemDefault,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$FamilyMembersTableFilterComposer
    extends Composer<_$AppDatabase, $FamilyMembersTable> {
  $$FamilyMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relation => $composableBuilder(
      column: $table.relation, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSystemDefault => $composableBuilder(
      column: $table.isSystemDefault,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$FamilyMembersTableOrderingComposer
    extends Composer<_$AppDatabase, $FamilyMembersTable> {
  $$FamilyMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relation => $composableBuilder(
      column: $table.relation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSystemDefault => $composableBuilder(
      column: $table.isSystemDefault,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$FamilyMembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $FamilyMembersTable> {
  $$FamilyMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get relation =>
      $composableBuilder(column: $table.relation, builder: (column) => column);

  GeneratedColumn<bool> get isSystemDefault => $composableBuilder(
      column: $table.isSystemDefault, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FamilyMembersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FamilyMembersTable,
    FamilyMemberRow,
    $$FamilyMembersTableFilterComposer,
    $$FamilyMembersTableOrderingComposer,
    $$FamilyMembersTableAnnotationComposer,
    $$FamilyMembersTableCreateCompanionBuilder,
    $$FamilyMembersTableUpdateCompanionBuilder,
    (
      FamilyMemberRow,
      BaseReferences<_$AppDatabase, $FamilyMembersTable, FamilyMemberRow>
    ),
    FamilyMemberRow,
    PrefetchHooks Function()> {
  $$FamilyMembersTableTableManager(_$AppDatabase db, $FamilyMembersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FamilyMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FamilyMembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FamilyMembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> relation = const Value.absent(),
            Value<bool> isSystemDefault = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FamilyMembersCompanion(
            id: id,
            name: name,
            relation: relation,
            isSystemDefault: isSystemDefault,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String relation,
            Value<bool> isSystemDefault = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              FamilyMembersCompanion.insert(
            id: id,
            name: name,
            relation: relation,
            isSystemDefault: isSystemDefault,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FamilyMembersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FamilyMembersTable,
    FamilyMemberRow,
    $$FamilyMembersTableFilterComposer,
    $$FamilyMembersTableOrderingComposer,
    $$FamilyMembersTableAnnotationComposer,
    $$FamilyMembersTableCreateCompanionBuilder,
    $$FamilyMembersTableUpdateCompanionBuilder,
    (
      FamilyMemberRow,
      BaseReferences<_$AppDatabase, $FamilyMembersTable, FamilyMemberRow>
    ),
    FamilyMemberRow,
    PrefetchHooks Function()>;
typedef $$MedicineItemsTableCreateCompanionBuilder = MedicineItemsCompanion
    Function({
  required String id,
  required String memberId,
  required String name,
  Value<String?> genericName,
  required String specification,
  required String dosageForm,
  Value<String?> indication,
  Value<String?> storageNotes,
  required String source,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$MedicineItemsTableUpdateCompanionBuilder = MedicineItemsCompanion
    Function({
  Value<String> id,
  Value<String> memberId,
  Value<String> name,
  Value<String?> genericName,
  Value<String> specification,
  Value<String> dosageForm,
  Value<String?> indication,
  Value<String?> storageNotes,
  Value<String> source,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$MedicineItemsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicineItemsTable> {
  $$MedicineItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get genericName => $composableBuilder(
      column: $table.genericName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get specification => $composableBuilder(
      column: $table.specification, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dosageForm => $composableBuilder(
      column: $table.dosageForm, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get indication => $composableBuilder(
      column: $table.indication, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get storageNotes => $composableBuilder(
      column: $table.storageNotes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MedicineItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicineItemsTable> {
  $$MedicineItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genericName => $composableBuilder(
      column: $table.genericName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get specification => $composableBuilder(
      column: $table.specification,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dosageForm => $composableBuilder(
      column: $table.dosageForm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get indication => $composableBuilder(
      column: $table.indication, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get storageNotes => $composableBuilder(
      column: $table.storageNotes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MedicineItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicineItemsTable> {
  $$MedicineItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get memberId =>
      $composableBuilder(column: $table.memberId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get genericName => $composableBuilder(
      column: $table.genericName, builder: (column) => column);

  GeneratedColumn<String> get specification => $composableBuilder(
      column: $table.specification, builder: (column) => column);

  GeneratedColumn<String> get dosageForm => $composableBuilder(
      column: $table.dosageForm, builder: (column) => column);

  GeneratedColumn<String> get indication => $composableBuilder(
      column: $table.indication, builder: (column) => column);

  GeneratedColumn<String> get storageNotes => $composableBuilder(
      column: $table.storageNotes, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MedicineItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicineItemsTable,
    MedicineItemRow,
    $$MedicineItemsTableFilterComposer,
    $$MedicineItemsTableOrderingComposer,
    $$MedicineItemsTableAnnotationComposer,
    $$MedicineItemsTableCreateCompanionBuilder,
    $$MedicineItemsTableUpdateCompanionBuilder,
    (
      MedicineItemRow,
      BaseReferences<_$AppDatabase, $MedicineItemsTable, MedicineItemRow>
    ),
    MedicineItemRow,
    PrefetchHooks Function()> {
  $$MedicineItemsTableTableManager(_$AppDatabase db, $MedicineItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicineItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicineItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicineItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> memberId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> genericName = const Value.absent(),
            Value<String> specification = const Value.absent(),
            Value<String> dosageForm = const Value.absent(),
            Value<String?> indication = const Value.absent(),
            Value<String?> storageNotes = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MedicineItemsCompanion(
            id: id,
            memberId: memberId,
            name: name,
            genericName: genericName,
            specification: specification,
            dosageForm: dosageForm,
            indication: indication,
            storageNotes: storageNotes,
            source: source,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String memberId,
            required String name,
            Value<String?> genericName = const Value.absent(),
            required String specification,
            required String dosageForm,
            Value<String?> indication = const Value.absent(),
            Value<String?> storageNotes = const Value.absent(),
            required String source,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              MedicineItemsCompanion.insert(
            id: id,
            memberId: memberId,
            name: name,
            genericName: genericName,
            specification: specification,
            dosageForm: dosageForm,
            indication: indication,
            storageNotes: storageNotes,
            source: source,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MedicineItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MedicineItemsTable,
    MedicineItemRow,
    $$MedicineItemsTableFilterComposer,
    $$MedicineItemsTableOrderingComposer,
    $$MedicineItemsTableAnnotationComposer,
    $$MedicineItemsTableCreateCompanionBuilder,
    $$MedicineItemsTableUpdateCompanionBuilder,
    (
      MedicineItemRow,
      BaseReferences<_$AppDatabase, $MedicineItemsTable, MedicineItemRow>
    ),
    MedicineItemRow,
    PrefetchHooks Function()>;
typedef $$MedicineBatchesTableCreateCompanionBuilder = MedicineBatchesCompanion
    Function({
  required String id,
  required String medicineItemId,
  required double quantity,
  required String unit,
  required DateTime expiryDate,
  Value<double> lowStockThreshold,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$MedicineBatchesTableUpdateCompanionBuilder = MedicineBatchesCompanion
    Function({
  Value<String> id,
  Value<String> medicineItemId,
  Value<double> quantity,
  Value<String> unit,
  Value<DateTime> expiryDate,
  Value<double> lowStockThreshold,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$MedicineBatchesTableFilterComposer
    extends Composer<_$AppDatabase, $MedicineBatchesTable> {
  $$MedicineBatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get medicineItemId => $composableBuilder(
      column: $table.medicineItemId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lowStockThreshold => $composableBuilder(
      column: $table.lowStockThreshold,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MedicineBatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicineBatchesTable> {
  $$MedicineBatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get medicineItemId => $composableBuilder(
      column: $table.medicineItemId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lowStockThreshold => $composableBuilder(
      column: $table.lowStockThreshold,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MedicineBatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicineBatchesTable> {
  $$MedicineBatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get medicineItemId => $composableBuilder(
      column: $table.medicineItemId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => column);

  GeneratedColumn<double> get lowStockThreshold => $composableBuilder(
      column: $table.lowStockThreshold, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MedicineBatchesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicineBatchesTable,
    MedicineBatchRow,
    $$MedicineBatchesTableFilterComposer,
    $$MedicineBatchesTableOrderingComposer,
    $$MedicineBatchesTableAnnotationComposer,
    $$MedicineBatchesTableCreateCompanionBuilder,
    $$MedicineBatchesTableUpdateCompanionBuilder,
    (
      MedicineBatchRow,
      BaseReferences<_$AppDatabase, $MedicineBatchesTable, MedicineBatchRow>
    ),
    MedicineBatchRow,
    PrefetchHooks Function()> {
  $$MedicineBatchesTableTableManager(
      _$AppDatabase db, $MedicineBatchesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicineBatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicineBatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicineBatchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> medicineItemId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<DateTime> expiryDate = const Value.absent(),
            Value<double> lowStockThreshold = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MedicineBatchesCompanion(
            id: id,
            medicineItemId: medicineItemId,
            quantity: quantity,
            unit: unit,
            expiryDate: expiryDate,
            lowStockThreshold: lowStockThreshold,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String medicineItemId,
            required double quantity,
            required String unit,
            required DateTime expiryDate,
            Value<double> lowStockThreshold = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              MedicineBatchesCompanion.insert(
            id: id,
            medicineItemId: medicineItemId,
            quantity: quantity,
            unit: unit,
            expiryDate: expiryDate,
            lowStockThreshold: lowStockThreshold,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MedicineBatchesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MedicineBatchesTable,
    MedicineBatchRow,
    $$MedicineBatchesTableFilterComposer,
    $$MedicineBatchesTableOrderingComposer,
    $$MedicineBatchesTableAnnotationComposer,
    $$MedicineBatchesTableCreateCompanionBuilder,
    $$MedicineBatchesTableUpdateCompanionBuilder,
    (
      MedicineBatchRow,
      BaseReferences<_$AppDatabase, $MedicineBatchesTable, MedicineBatchRow>
    ),
    MedicineBatchRow,
    PrefetchHooks Function()>;
typedef $$VisitRecordsTableCreateCompanionBuilder = VisitRecordsCompanion
    Function({
  required String id,
  required String memberId,
  required DateTime visitDate,
  Value<String?> hospitalName,
  Value<String?> department,
  required String diagnosisSummary,
  Value<String?> doctorName,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$VisitRecordsTableUpdateCompanionBuilder = VisitRecordsCompanion
    Function({
  Value<String> id,
  Value<String> memberId,
  Value<DateTime> visitDate,
  Value<String?> hospitalName,
  Value<String?> department,
  Value<String> diagnosisSummary,
  Value<String?> doctorName,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$VisitRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $VisitRecordsTable> {
  $$VisitRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get visitDate => $composableBuilder(
      column: $table.visitDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hospitalName => $composableBuilder(
      column: $table.hospitalName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get department => $composableBuilder(
      column: $table.department, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get diagnosisSummary => $composableBuilder(
      column: $table.diagnosisSummary,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get doctorName => $composableBuilder(
      column: $table.doctorName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$VisitRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $VisitRecordsTable> {
  $$VisitRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get visitDate => $composableBuilder(
      column: $table.visitDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hospitalName => $composableBuilder(
      column: $table.hospitalName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get department => $composableBuilder(
      column: $table.department, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get diagnosisSummary => $composableBuilder(
      column: $table.diagnosisSummary,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get doctorName => $composableBuilder(
      column: $table.doctorName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$VisitRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VisitRecordsTable> {
  $$VisitRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get memberId =>
      $composableBuilder(column: $table.memberId, builder: (column) => column);

  GeneratedColumn<DateTime> get visitDate =>
      $composableBuilder(column: $table.visitDate, builder: (column) => column);

  GeneratedColumn<String> get hospitalName => $composableBuilder(
      column: $table.hospitalName, builder: (column) => column);

  GeneratedColumn<String> get department => $composableBuilder(
      column: $table.department, builder: (column) => column);

  GeneratedColumn<String> get diagnosisSummary => $composableBuilder(
      column: $table.diagnosisSummary, builder: (column) => column);

  GeneratedColumn<String> get doctorName => $composableBuilder(
      column: $table.doctorName, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$VisitRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VisitRecordsTable,
    VisitRecordRow,
    $$VisitRecordsTableFilterComposer,
    $$VisitRecordsTableOrderingComposer,
    $$VisitRecordsTableAnnotationComposer,
    $$VisitRecordsTableCreateCompanionBuilder,
    $$VisitRecordsTableUpdateCompanionBuilder,
    (
      VisitRecordRow,
      BaseReferences<_$AppDatabase, $VisitRecordsTable, VisitRecordRow>
    ),
    VisitRecordRow,
    PrefetchHooks Function()> {
  $$VisitRecordsTableTableManager(_$AppDatabase db, $VisitRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VisitRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VisitRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VisitRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> memberId = const Value.absent(),
            Value<DateTime> visitDate = const Value.absent(),
            Value<String?> hospitalName = const Value.absent(),
            Value<String?> department = const Value.absent(),
            Value<String> diagnosisSummary = const Value.absent(),
            Value<String?> doctorName = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VisitRecordsCompanion(
            id: id,
            memberId: memberId,
            visitDate: visitDate,
            hospitalName: hospitalName,
            department: department,
            diagnosisSummary: diagnosisSummary,
            doctorName: doctorName,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String memberId,
            required DateTime visitDate,
            Value<String?> hospitalName = const Value.absent(),
            Value<String?> department = const Value.absent(),
            required String diagnosisSummary,
            Value<String?> doctorName = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              VisitRecordsCompanion.insert(
            id: id,
            memberId: memberId,
            visitDate: visitDate,
            hospitalName: hospitalName,
            department: department,
            diagnosisSummary: diagnosisSummary,
            doctorName: doctorName,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VisitRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VisitRecordsTable,
    VisitRecordRow,
    $$VisitRecordsTableFilterComposer,
    $$VisitRecordsTableOrderingComposer,
    $$VisitRecordsTableAnnotationComposer,
    $$VisitRecordsTableCreateCompanionBuilder,
    $$VisitRecordsTableUpdateCompanionBuilder,
    (
      VisitRecordRow,
      BaseReferences<_$AppDatabase, $VisitRecordsTable, VisitRecordRow>
    ),
    VisitRecordRow,
    PrefetchHooks Function()>;
typedef $$MedicalDocumentRecordsTableCreateCompanionBuilder
    = MedicalDocumentRecordsCompanion Function({
  required String id,
  required String visitRecordId,
  required String documentType,
  required String summary,
  Value<String?> extractedText,
  Value<String?> keyIndicators,
  required String imageAssetIdsJson,
  required String source,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$MedicalDocumentRecordsTableUpdateCompanionBuilder
    = MedicalDocumentRecordsCompanion Function({
  Value<String> id,
  Value<String> visitRecordId,
  Value<String> documentType,
  Value<String> summary,
  Value<String?> extractedText,
  Value<String?> keyIndicators,
  Value<String> imageAssetIdsJson,
  Value<String> source,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$MedicalDocumentRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicalDocumentRecordsTable> {
  $$MedicalDocumentRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get visitRecordId => $composableBuilder(
      column: $table.visitRecordId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get documentType => $composableBuilder(
      column: $table.documentType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get extractedText => $composableBuilder(
      column: $table.extractedText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get keyIndicators => $composableBuilder(
      column: $table.keyIndicators, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageAssetIdsJson => $composableBuilder(
      column: $table.imageAssetIdsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MedicalDocumentRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicalDocumentRecordsTable> {
  $$MedicalDocumentRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get visitRecordId => $composableBuilder(
      column: $table.visitRecordId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get documentType => $composableBuilder(
      column: $table.documentType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get extractedText => $composableBuilder(
      column: $table.extractedText,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keyIndicators => $composableBuilder(
      column: $table.keyIndicators,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageAssetIdsJson => $composableBuilder(
      column: $table.imageAssetIdsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MedicalDocumentRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicalDocumentRecordsTable> {
  $$MedicalDocumentRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get visitRecordId => $composableBuilder(
      column: $table.visitRecordId, builder: (column) => column);

  GeneratedColumn<String> get documentType => $composableBuilder(
      column: $table.documentType, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get extractedText => $composableBuilder(
      column: $table.extractedText, builder: (column) => column);

  GeneratedColumn<String> get keyIndicators => $composableBuilder(
      column: $table.keyIndicators, builder: (column) => column);

  GeneratedColumn<String> get imageAssetIdsJson => $composableBuilder(
      column: $table.imageAssetIdsJson, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MedicalDocumentRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicalDocumentRecordsTable,
    MedicalDocumentRecordRow,
    $$MedicalDocumentRecordsTableFilterComposer,
    $$MedicalDocumentRecordsTableOrderingComposer,
    $$MedicalDocumentRecordsTableAnnotationComposer,
    $$MedicalDocumentRecordsTableCreateCompanionBuilder,
    $$MedicalDocumentRecordsTableUpdateCompanionBuilder,
    (
      MedicalDocumentRecordRow,
      BaseReferences<_$AppDatabase, $MedicalDocumentRecordsTable,
          MedicalDocumentRecordRow>
    ),
    MedicalDocumentRecordRow,
    PrefetchHooks Function()> {
  $$MedicalDocumentRecordsTableTableManager(
      _$AppDatabase db, $MedicalDocumentRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicalDocumentRecordsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicalDocumentRecordsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicalDocumentRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> visitRecordId = const Value.absent(),
            Value<String> documentType = const Value.absent(),
            Value<String> summary = const Value.absent(),
            Value<String?> extractedText = const Value.absent(),
            Value<String?> keyIndicators = const Value.absent(),
            Value<String> imageAssetIdsJson = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MedicalDocumentRecordsCompanion(
            id: id,
            visitRecordId: visitRecordId,
            documentType: documentType,
            summary: summary,
            extractedText: extractedText,
            keyIndicators: keyIndicators,
            imageAssetIdsJson: imageAssetIdsJson,
            source: source,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String visitRecordId,
            required String documentType,
            required String summary,
            Value<String?> extractedText = const Value.absent(),
            Value<String?> keyIndicators = const Value.absent(),
            required String imageAssetIdsJson,
            required String source,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              MedicalDocumentRecordsCompanion.insert(
            id: id,
            visitRecordId: visitRecordId,
            documentType: documentType,
            summary: summary,
            extractedText: extractedText,
            keyIndicators: keyIndicators,
            imageAssetIdsJson: imageAssetIdsJson,
            source: source,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MedicalDocumentRecordsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $MedicalDocumentRecordsTable,
        MedicalDocumentRecordRow,
        $$MedicalDocumentRecordsTableFilterComposer,
        $$MedicalDocumentRecordsTableOrderingComposer,
        $$MedicalDocumentRecordsTableAnnotationComposer,
        $$MedicalDocumentRecordsTableCreateCompanionBuilder,
        $$MedicalDocumentRecordsTableUpdateCompanionBuilder,
        (
          MedicalDocumentRecordRow,
          BaseReferences<_$AppDatabase, $MedicalDocumentRecordsTable,
              MedicalDocumentRecordRow>
        ),
        MedicalDocumentRecordRow,
        PrefetchHooks Function()>;
typedef $$RecognitionDraftsTableCreateCompanionBuilder
    = RecognitionDraftsCompanion Function({
  required String id,
  required String draftType,
  required String memberId,
  required String status,
  required String recognizedPayloadJson,
  required String missingFieldsJson,
  required String imageAssetIdsJson,
  Value<String?> errorMessage,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$RecognitionDraftsTableUpdateCompanionBuilder
    = RecognitionDraftsCompanion Function({
  Value<String> id,
  Value<String> draftType,
  Value<String> memberId,
  Value<String> status,
  Value<String> recognizedPayloadJson,
  Value<String> missingFieldsJson,
  Value<String> imageAssetIdsJson,
  Value<String?> errorMessage,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$RecognitionDraftsTableFilterComposer
    extends Composer<_$AppDatabase, $RecognitionDraftsTable> {
  $$RecognitionDraftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get draftType => $composableBuilder(
      column: $table.draftType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recognizedPayloadJson => $composableBuilder(
      column: $table.recognizedPayloadJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get missingFieldsJson => $composableBuilder(
      column: $table.missingFieldsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageAssetIdsJson => $composableBuilder(
      column: $table.imageAssetIdsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$RecognitionDraftsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecognitionDraftsTable> {
  $$RecognitionDraftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get draftType => $composableBuilder(
      column: $table.draftType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recognizedPayloadJson => $composableBuilder(
      column: $table.recognizedPayloadJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get missingFieldsJson => $composableBuilder(
      column: $table.missingFieldsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageAssetIdsJson => $composableBuilder(
      column: $table.imageAssetIdsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$RecognitionDraftsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecognitionDraftsTable> {
  $$RecognitionDraftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get draftType =>
      $composableBuilder(column: $table.draftType, builder: (column) => column);

  GeneratedColumn<String> get memberId =>
      $composableBuilder(column: $table.memberId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get recognizedPayloadJson => $composableBuilder(
      column: $table.recognizedPayloadJson, builder: (column) => column);

  GeneratedColumn<String> get missingFieldsJson => $composableBuilder(
      column: $table.missingFieldsJson, builder: (column) => column);

  GeneratedColumn<String> get imageAssetIdsJson => $composableBuilder(
      column: $table.imageAssetIdsJson, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RecognitionDraftsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecognitionDraftsTable,
    RecognitionDraftRow,
    $$RecognitionDraftsTableFilterComposer,
    $$RecognitionDraftsTableOrderingComposer,
    $$RecognitionDraftsTableAnnotationComposer,
    $$RecognitionDraftsTableCreateCompanionBuilder,
    $$RecognitionDraftsTableUpdateCompanionBuilder,
    (
      RecognitionDraftRow,
      BaseReferences<_$AppDatabase, $RecognitionDraftsTable,
          RecognitionDraftRow>
    ),
    RecognitionDraftRow,
    PrefetchHooks Function()> {
  $$RecognitionDraftsTableTableManager(
      _$AppDatabase db, $RecognitionDraftsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecognitionDraftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecognitionDraftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecognitionDraftsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> draftType = const Value.absent(),
            Value<String> memberId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> recognizedPayloadJson = const Value.absent(),
            Value<String> missingFieldsJson = const Value.absent(),
            Value<String> imageAssetIdsJson = const Value.absent(),
            Value<String?> errorMessage = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecognitionDraftsCompanion(
            id: id,
            draftType: draftType,
            memberId: memberId,
            status: status,
            recognizedPayloadJson: recognizedPayloadJson,
            missingFieldsJson: missingFieldsJson,
            imageAssetIdsJson: imageAssetIdsJson,
            errorMessage: errorMessage,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String draftType,
            required String memberId,
            required String status,
            required String recognizedPayloadJson,
            required String missingFieldsJson,
            required String imageAssetIdsJson,
            Value<String?> errorMessage = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              RecognitionDraftsCompanion.insert(
            id: id,
            draftType: draftType,
            memberId: memberId,
            status: status,
            recognizedPayloadJson: recognizedPayloadJson,
            missingFieldsJson: missingFieldsJson,
            imageAssetIdsJson: imageAssetIdsJson,
            errorMessage: errorMessage,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecognitionDraftsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecognitionDraftsTable,
    RecognitionDraftRow,
    $$RecognitionDraftsTableFilterComposer,
    $$RecognitionDraftsTableOrderingComposer,
    $$RecognitionDraftsTableAnnotationComposer,
    $$RecognitionDraftsTableCreateCompanionBuilder,
    $$RecognitionDraftsTableUpdateCompanionBuilder,
    (
      RecognitionDraftRow,
      BaseReferences<_$AppDatabase, $RecognitionDraftsTable,
          RecognitionDraftRow>
    ),
    RecognitionDraftRow,
    PrefetchHooks Function()>;
typedef $$LocalImageAssetsTableCreateCompanionBuilder
    = LocalImageAssetsCompanion Function({
  required String id,
  required String localPath,
  required String fileName,
  required String mimeType,
  required int fileSize,
  Value<int?> width,
  Value<int?> height,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$LocalImageAssetsTableUpdateCompanionBuilder
    = LocalImageAssetsCompanion Function({
  Value<String> id,
  Value<String> localPath,
  Value<String> fileName,
  Value<String> mimeType,
  Value<int> fileSize,
  Value<int?> width,
  Value<int?> height,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$LocalImageAssetsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalImageAssetsTable> {
  $$LocalImageAssetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fileSize => $composableBuilder(
      column: $table.fileSize, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$LocalImageAssetsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalImageAssetsTable> {
  $$LocalImageAssetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fileSize => $composableBuilder(
      column: $table.fileSize, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$LocalImageAssetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalImageAssetsTable> {
  $$LocalImageAssetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalImageAssetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalImageAssetsTable,
    LocalImageAssetRow,
    $$LocalImageAssetsTableFilterComposer,
    $$LocalImageAssetsTableOrderingComposer,
    $$LocalImageAssetsTableAnnotationComposer,
    $$LocalImageAssetsTableCreateCompanionBuilder,
    $$LocalImageAssetsTableUpdateCompanionBuilder,
    (
      LocalImageAssetRow,
      BaseReferences<_$AppDatabase, $LocalImageAssetsTable, LocalImageAssetRow>
    ),
    LocalImageAssetRow,
    PrefetchHooks Function()> {
  $$LocalImageAssetsTableTableManager(
      _$AppDatabase db, $LocalImageAssetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalImageAssetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalImageAssetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalImageAssetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> localPath = const Value.absent(),
            Value<String> fileName = const Value.absent(),
            Value<String> mimeType = const Value.absent(),
            Value<int> fileSize = const Value.absent(),
            Value<int?> width = const Value.absent(),
            Value<int?> height = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalImageAssetsCompanion(
            id: id,
            localPath: localPath,
            fileName: fileName,
            mimeType: mimeType,
            fileSize: fileSize,
            width: width,
            height: height,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String localPath,
            required String fileName,
            required String mimeType,
            required int fileSize,
            Value<int?> width = const Value.absent(),
            Value<int?> height = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalImageAssetsCompanion.insert(
            id: id,
            localPath: localPath,
            fileName: fileName,
            mimeType: mimeType,
            fileSize: fileSize,
            width: width,
            height: height,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalImageAssetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocalImageAssetsTable,
    LocalImageAssetRow,
    $$LocalImageAssetsTableFilterComposer,
    $$LocalImageAssetsTableOrderingComposer,
    $$LocalImageAssetsTableAnnotationComposer,
    $$LocalImageAssetsTableCreateCompanionBuilder,
    $$LocalImageAssetsTableUpdateCompanionBuilder,
    (
      LocalImageAssetRow,
      BaseReferences<_$AppDatabase, $LocalImageAssetsTable, LocalImageAssetRow>
    ),
    LocalImageAssetRow,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FamilyMembersTableTableManager get familyMembers =>
      $$FamilyMembersTableTableManager(_db, _db.familyMembers);
  $$MedicineItemsTableTableManager get medicineItems =>
      $$MedicineItemsTableTableManager(_db, _db.medicineItems);
  $$MedicineBatchesTableTableManager get medicineBatches =>
      $$MedicineBatchesTableTableManager(_db, _db.medicineBatches);
  $$VisitRecordsTableTableManager get visitRecords =>
      $$VisitRecordsTableTableManager(_db, _db.visitRecords);
  $$MedicalDocumentRecordsTableTableManager get medicalDocumentRecords =>
      $$MedicalDocumentRecordsTableTableManager(
          _db, _db.medicalDocumentRecords);
  $$RecognitionDraftsTableTableManager get recognitionDrafts =>
      $$RecognitionDraftsTableTableManager(_db, _db.recognitionDrafts);
  $$LocalImageAssetsTableTableManager get localImageAssets =>
      $$LocalImageAssetsTableTableManager(_db, _db.localImageAssets);
}
