import 'dart:async';

import 'package:ontari_app/models/user.dart';
import 'package:rxdart/rxdart.dart';

import '../../../providers/bloc_provider.dart';
import '../repos/user_detail_repo.dart';

class UserDetailBloc extends BlocBase {
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

  @override
  void dispose() {
    _userController.close();
  }
}
