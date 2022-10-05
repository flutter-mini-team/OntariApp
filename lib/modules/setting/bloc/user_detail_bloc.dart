import 'package:rxdart/rxdart.dart';

import '../../../models/user.dart';
import '../../../providers/bloc_provider.dart';
import '../repos/user_detail_repo.dart';

class AppUserBloc extends BlocBase {
  final _userController = BehaviorSubject<User>();
  Stream<User> get userStream => _userController.stream;
  User get userDetail => _userController.stream.value;

  Future<void> getUserDeTail() async {
    try {
      final res = await UserDetailRepo().getUserDetailRepos();
      if (res != null) {
        _userController.sink.add(res);
      }
    } catch (e) {
      _userController.sink.addError('Cannot fetch user !');
    }
  }

  Future<bool> updateUserDetail(
    String firstName,
    String lastName,
    String email,
  ) async {
    try {
      final data = {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
      };

      final res = await UserDetailRepo().putUserDetailRepos(data);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    _userController.close();
  }
}
