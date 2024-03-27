import 'package:test_technique/layers/presentation/shared/others/export.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {
  final _localStorage = LocalStorageImpl();

  @override
  Future<List<User>?> getOnlineUsers() async {
    var response =
        await http.get(Uri.parse("https://randomuser.me/api/?results=100"));
    if (response.statusCode == 200) {
      var users = <User>[];
      for (var element in jsonDecode(response.body)['results']) {
        var user = User.fromMap(element);
        //save to sqflite
        int? id = await _localStorage.addUser(user);

        users.insert(0, user.copyWith(id: id));
      }
      saveLocalAvailable();
      return users;
    }
    return null;
  }

  @override
  Future<List<User>> getLocalUsers() async {
    var q = await database!.query(User.userTable);
    var users = <User>[];
    for (var element in q) {
      users.insert(0, User.sqFromMap(element));
    }
    return users;
  }

  Future<void> saveLocalAvailable() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool("local_available", true);
  }
}
