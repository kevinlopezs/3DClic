import 'package:hive/hive.dart';
import 'package:teka_3dclic/models/user_model.dart';

// ignore: library_private_types_in_public_api
final _HiveManager hiveManager = _HiveManager();

class _HiveManager {
  final Box _userBox = Hive.box<UserModel>("user");
  final Box _authBox = Hive.box("auth");

  UserModel? get user => _userBox.get("user");
  set user(UserModel? current) => _userBox.put("user", current);

  String? get token => _authBox.get("token");
  set token(String? current) => _authBox.put("token", current);

  signOut() {
    _authBox.clear();
    _userBox.clear();
  }
}
