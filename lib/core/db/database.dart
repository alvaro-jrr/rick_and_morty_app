import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'package:rick_and_morty_app/core/db/tables/characters.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Characters])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_db', native: const DriftNativeOptions());
  }
}
