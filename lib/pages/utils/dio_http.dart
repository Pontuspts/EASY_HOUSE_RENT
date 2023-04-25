import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/config.dart';
import 'package:EASY_HOUSE_FINDER/pages/utils/common_toast.dart';

//Use dio for authentication interception worning

class DioHttp {
  Dio? _client;
  late BuildContext context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    if (_client == null || context != this.context) {
      this.context = context;
      var options = BaseOptions(
          baseUrl: Config.baseUrl,
          connectTimeout: 1000 * 10,
          receiveTimeout: 1000 * 3,
          extra: {'context': context});
      var client = Dio(options);
      client.interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) {
        return handler.next(options); //continue
        // If you want to complete the request and return some custom data,
        //you can resolve a Response object `handler.resolve(response)`.
        // In this way, the request will be terminated,
        //the upper layer then will be called, and the data returned in then will be your custom response.
        // If you want to terminate the request and trigger an error,
        //you can return a `DioError` object, such as `handler.reject(error)`,
        // This request will be aborted and an exception will be triggered, and the upper catchError will be called.
      }, onResponse: (response, handler) {
        var resp = response.data;

        // An error was intercepted, and a pop-up prompt
        if (resp['data']['code'] != 0) {
          CommonToast.showToast(resp['data']['message'] ?? 'error');
          return; // Do not continue the process
        }
        return handler.next(response); // continue
      }, onError: (DioError e, handler) {
        return handler.next(e); //continue
        // If you want to complete the request and return some custom data,
        //you can resolve a `Response`, such as `handler.resolve(response)`.
        // In this way, the request will be terminated,
        //the upper layer then will be called, and the data returned in then will be your custom response.
      }));

      _client = client;
    }
  }

  // Encapsulating a Get request
  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client!.get(path, queryParameters: params, options: options);
  }

  // Encapsulate Post request
  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client!.post(path, data: params, options: options);
  }
}
