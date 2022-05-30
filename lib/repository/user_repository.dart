import 'package:sample_app/model/response/post_response_model.dart';

import '../model/response/user_response_model.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<List<Post>> getPosts();
}