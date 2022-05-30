import 'package:sample_app/data/remote/api_service.dart';
import 'package:sample_app/data/remote/api_service_impl.dart';
import 'package:sample_app/repository/user_repository.dart';
import '../model/response/post_response_model.dart';
import '../model/response/user_response_model.dart';
import '../util/constants.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiService _apiService = ApiServiceImpl();

  @override
  Future<List<User>> getUsers() async {
    logger.wtf("Hello from repo");
    try {
      return (await _apiService.getRetrofitService()).getUsers();
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future<List<Post>> getPosts() async {
    logger.wtf("Hello from repo");
    try {
      return (await _apiService.getRetrofitService()).getPosts();
    } catch (e) {
      rethrow;
    }
  }
}