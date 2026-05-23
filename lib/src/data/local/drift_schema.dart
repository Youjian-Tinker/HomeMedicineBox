import 'package:drift/drift.dart';

@DataClassName('FamilyMemberRow')
class FamilyMembers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get relation => text()();
  BoolColumn get isSystemDefault =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('MedicineItemRow')
class MedicineItems extends Table {
  TextColumn get id => text()();
  TextColumn get memberId => text().references(FamilyMembers, #id)();
  TextColumn get name => text()();
  TextColumn get genericName => text().nullable()();
  TextColumn get specification => text()();
  TextColumn get dosageForm => text()();
  TextColumn get indication => text().nullable()();
  TextColumn get storageNotes => text().nullable()();
  TextColumn get source => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('MedicineBatchRow')
class MedicineBatches extends Table {
  TextColumn get id => text()();
  TextColumn get medicineItemId => text().references(MedicineItems, #id)();
  RealColumn get quantity => real()();
  TextColumn get unit => text()();
  DateTimeColumn get expiryDate => dateTime()();
  RealColumn get lowStockThreshold => real().withDefault(const Constant(1))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('VisitRecordRow')
class VisitRecords extends Table {
  TextColumn get id => text()();
  TextColumn get memberId => text().references(FamilyMembers, #id)();
  DateTimeColumn get visitDate => dateTime()();
  TextColumn get hospitalName => text().nullable()();
  TextColumn get department => text().nullable()();
  TextColumn get diagnosisSummary => text()();
  TextColumn get doctorName => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('MedicalDocumentRecordRow')
class MedicalDocumentRecords extends Table {
  TextColumn get id => text()();
  TextColumn get visitRecordId => text().references(VisitRecords, #id)();
  TextColumn get documentType => text()();
  TextColumn get summary => text()();
  TextColumn get extractedText => text().nullable()();
  TextColumn get keyIndicators => text().nullable()();
  TextColumn get imageAssetIdsJson => text()();
  TextColumn get source => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('RecognitionDraftRow')
class RecognitionDrafts extends Table {
  TextColumn get id => text()();
  TextColumn get draftType => text()();
  TextColumn get memberId => text().references(FamilyMembers, #id)();
  TextColumn get status => text()();
  TextColumn get recognizedPayloadJson => text()();
  TextColumn get missingFieldsJson => text()();
  TextColumn get imageAssetIdsJson => text()();
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('LocalImageAssetRow')
class LocalImageAssets extends Table {
  TextColumn get id => text()();
  TextColumn get localPath => text()();
  TextColumn get fileName => text()();
  TextColumn get mimeType => text()();
  IntColumn get fileSize => integer()();
  IntColumn get width => integer().nullable()();
  IntColumn get height => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
