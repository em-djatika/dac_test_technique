
import 'package:test_technique/layers/presentation/shared/others/export.dart';

abstract class LocalStorage {
  Future<void> addUser(User user);
  Future<void> updateUser(User user);
  Future<void> createUserTable(db);
}

class LocalStorageImpl implements LocalStorage {
  @override
  Future<int?> addUser(User user) async {
    return await database?.insert(User.userTable, user.toMap());
  }

  @override
  Future<void> updateUser(User user) async {
    await database?.update(User.userTable, user.toMap(),
        where: "id=?", whereArgs: [user.id!]);
  }
  @override
  Future<void> createUserTable(db) async {
    await db.execute('''CREATE TABLE Users
        (id INTEGER  PRIMARY KEY AUTOINCREMENT,
         gender TEXT,
         name TEXT,
         dob TEXT,
         location TEXT,
         phone TEXT,
         picture TEXT
        )''');
  }

   Future<bool> get localAvailable async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getBool('local_available') ?? false;
  }
}
