import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sample_app/data/remote/api_endpoints.dart';
import 'package:sample_app/model/response/post_response_model.dart';
import 'package:sample_app/util/constants.dart';

import '../../model/response/user_response_model.dart';
part 'apis.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class APIs {
  factory APIs(Dio dio) = _APIs;

  //user
  @GET(ApiEndPoints.users)
  Future<List<User>> getUsers();

  //user
  @GET(ApiEndPoints.posts)
  Future<List<Post>> getPosts();

}