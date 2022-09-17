import 'package:ontari_app/models/user.dart';

import '../../../providers/api_provider.dart';

class UserDetailRepo {
  final apiProvider = ApiProvider();

  Future<User?> getUserDetailRepos() async {
    try {
      final response = await apiProvider.get("/profile");

      if (response.statusCode != 200) {
        return null;
      }

      Map<String, dynamic> data = response.data['data'];
      return User.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
