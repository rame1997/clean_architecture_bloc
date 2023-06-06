import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../utils/app_strings.dart';
//هادا الكلاس علشان اتحكم في الريكويست لو صار اي خطا خلال عملية الارجاع وممكن استخدمه لارسال الاشياء المتكرروه في الهيدر مثلا الللغة والتوكن من خلال ثلاث ميثود معمول الهم اوفر ريت
class AppIntercepters extends Interceptor {
  //قبل عملية الارسال
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers[AppStrings.contentType] = AppStrings.applicationJson;
    super.onRequest(options, handler);
  }
//بعد عملية الارسال
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}