import 'apis.dart';

abstract class ApiService {
  Future<APIs> getRetrofitService();
}