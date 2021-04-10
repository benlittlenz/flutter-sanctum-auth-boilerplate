import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sanctum_boilerplate/providers/auth.dart';

Dio dio() {
  var dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/api/',
      responseType: ResponseType.plain,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      }
    )
  );

  dio..interceptors.add(InterceptorsWrapper(
    onRequest: (options) => requestInterceptor(options)
  ));

  return dio;
}


dynamic requestInterceptor(RequestOptions options) async {
  //debugPrint(options.headers.toString());
  if(options.headers.containsKey('auth')) {
    var token = await Auth().fetchtoken();
    //debugPrint(token);
    options.headers.addAll({ 'Authorization': 'Bearer $token' });
  }
}
