import 'package:dio/dio.dart';

import '../constants/apis.dart';

class DioService {
  late Dio dio;

  DioService() {
    dio = Dio();
    dio.options.baseUrl = BASE_PATH;
    dio.options.responseType = ResponseType.json;
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print(options.data.toString());
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print(response.data.toString());
        return handler.next(response);
      },
      onError: (error, handler) {
        print(error.type.toString());
        return handler.next(error);
      },
    ));
  }
}
