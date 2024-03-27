import 'package:test_technique/layers/domain/entities/user_entity.dart';

abstract class UserRepository{
   Future<List<User>?> getOnlineUsers();
  Future<List<User>> getLocalUsers();

}