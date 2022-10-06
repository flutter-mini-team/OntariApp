import 'package:ontari_app/models/user.dart';

import '../providers/api_provider.dart';

abstract class SettingRepo<T> {
  final _apiProvider = ApiProvider();
  String get url;
  User? user;

  Future<User?> getUserDetailRepos() async {
    try {
      final response = await _apiProvider.get("/profile");

      if (response.statusCode != 200) {
        return null;
      }

      Map<String, dynamic> data = response.data['data'];
      return User.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  T parseJSON(Map<String, dynamic> json);

  // void refresh() {
  //   user = null;
  // }
}
