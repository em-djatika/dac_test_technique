import 'package:sqflite/sqflite.dart';
import 'package:test_technique/layers/presentation/shared/others/export.dart';

import 'layers/presentation/app_root.dart';

// ignore_for_file: prefer_const_constructors
Database? database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = '${databasesPath}demo.db';

  // var prefs = await SharedPreferences.getInstance();
  // prefs.remove("local_available");
  // await deleteDatabase(path);

// open the database
  database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    LocalStorageImpl().createUserTable(db);
  });

  runApp(const AppRoot());
}
