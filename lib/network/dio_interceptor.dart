import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioLoggingInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
          "Web Error: ${err.requestOptions.uri.toString()} ${err.error is Map ? json.encode(err.error) : err.error}");
    }

    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final qp = options.queryParameters;
      final h = options.headers;
      final d = options.data;
      final curl =
          'curl -X ${options.method} \'${options.baseUrl}${options.path}${qp.isNotEmpty ? qp.keys.fold('', (value, key) => '$value${value.isNotEmpty ? '?' : '&'}$key=${qp[key]}\'') : '\''}${h.keys.fold('', (value, key) => '$value -H \'$key: ${h[key]}\'')}${d?.length != 0 ? ' --data-binary \'$d\'' : ''} --insecure';
      if (kDebugMode) {
        log('server_curl: $curl');
      }
    } catch (e) {
      if (kDebugMode) {
        log('CurlInterceptor error: $e');
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log("Response: ${response.requestOptions.uri.toString()} ${jsonEncode(response.data)}");
    }

    return handler.next(response);
  }
}
