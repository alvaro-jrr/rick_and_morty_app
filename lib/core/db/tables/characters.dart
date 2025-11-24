import 'package:drift/drift.dart';

class Characters extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get status => text()();
  TextColumn get species => text()();
  TextColumn get gender => text()();
  TextColumn get image => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
