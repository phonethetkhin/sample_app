import 'package:dio/dio.dart';
import 'package:sample_app/data/remote/api_service.dart';

import 'apis.dart';

class ApiServiceImpl extends ApiService {

  Future<APIs> getRetrofitService() async {
    var dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return APIs(dio);
  }
}