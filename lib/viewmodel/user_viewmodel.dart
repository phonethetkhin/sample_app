import 'package:flutter/material.dart';
import 'package:sample_app/repository/user_repository_impl.dart';

import '../model/response/post_response_model.dart';
import '../model/response/user_response_model.dart';
import '../util/constants.dart';

class UserViewModel extends ChangeNotifier {
  final _userRepo = UserRepositoryImpl();

  List<User> _users=[];
  List<User> get users => _users;

  Future<void> getUser() async {
    logger.wtf("Hello from vm");

    _users= await _userRepo.getUsers();
     notifyListeners();
  }

  Future<List<Post>> getPosts() async {
    logger.wtf("Hello from vm");
    return _userRepo.getPosts();
  }
}