import 'dart:convert';
import 'package:crystalonbritsols_task/network/dio_interceptor.dart';
import 'package:crystalonbritsols_task/services/storage_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  static final DioClient _dioClient = DioClient();

  static DioClient get dioClient => _dioClient;

  final Dio _dio = Dio()..interceptors.add(DioLoggingInterceptor());

  Future<dynamic> getRequest(String url, {bool shouldParse = true}) async {
    dynamic responseJson;
    try {
      String? token =
          StorageHelper.mInstance.getString(StorageHelper.storageAccessToken);
      if (token != "") {
        _dio.options.headers['Authorization'] =
            StorageHelper.mInstance.getString(StorageHelper.storageAccessToken);
      }
      final response = await _dio.get(url);
      if (shouldParse) {
        final result = json.decode(response.toString());
        responseJson = result;
      }

      return response;
    } on DioException catch (err) {
      final result = json.decode(err.response!.toString());
      responseJson = result;

      debugPrint('ERROR  ${err.error}\n${err.response!.data}');
    }
    return responseJson;
  }

  Future<dynamic> postRequest(String url,
      {dynamic body, Map<String, dynamic>? customHeaders}) async {
    dynamic responseJson;
    try {
      _dio.options.headers['Content-Type'] = 'application/json';
      String? token =
          StorageHelper.mInstance.getString(StorageHelper.storageAccessToken);
      if (token != "") {
        _dio.options.headers['Authorization'] =
            StorageHelper.mInstance.getString(StorageHelper.storageAccessToken);
      }
      if (customHeaders != null) {
        customHeaders.forEach((key, value) {
          _dio.options.headers[key] = value;
        });
      }

      final response = await _dio.post(url, data: body);

      final result = json.decode(response.toString());
      responseJson = result;
    } on DioException catch (err) {
      responseJson = json.decode(err.response!.toString());
      debugPrint('ERROR  ${err.error}\n${err.response!.data}');
    }

    return responseJson;
  }

  Future<dynamic> patchRequest(String url,
      {dynamic body, Map<String, dynamic>? customHeaders}) async {
    dynamic responseJson;
    try {
      _dio.options.headers['Content-Type'] = 'application/json';
      String? token =
          StorageHelper.mInstance.getString(StorageHelper.storageAccessToken);
      if (token != "") {
        _dio.options.headers['Authorization'] =
            StorageHelper.mInstance.getString(StorageHelper.storageAccessToken);
      }
      if (customHeaders != null) {
        customHeaders.forEach((key, value) {
          _dio.options.headers[key] = value;
        });
      }

      final response = await _dio.patch(url, data: body);
      final result = json.decode(response.toString());

      responseJson = result;
    } on DioException catch (err) {
      debugPrint('ERROR  ${err.error}\n${err.response!.data}');
    }
    return responseJson;
  }

  Future<dynamic> uploadImage(String url, FormData formData) async {
    dynamic responseJson;
    try {
      _dio.options.headers['Content-Type'] = 'application/json';
      String? token =
          StorageHelper.mInstance.getString(StorageHelper.storageAccessToken);
      if (token != "") {
        _dio.options.headers['Authorization'] =
            StorageHelper.mInstance.getString(StorageHelper.storageAccessToken);
      }

      final response = await _dio.post(url, data: formData);

      final result = json.decode(response.toString());

      responseJson = result;
    } on DioException catch (err) {
      debugPrint('ERROR  ${err.error}\n${err.response!.data}');
    }
    return responseJson;
  }

  Future<dynamic> deleteRequest(String url) async {
    dynamic responseJson;
    try {
      String? token =
          StorageHelper.mInstance.getString(StorageHelper.storageAccessToken);
      if (token != "") {
        _dio.options.headers['Authorization'] =
            StorageHelper.mInstance.getString(StorageHelper.storageAccessToken);
      }
      final response = await _dio.delete(url);
      final result = json.decode(response.toString());

      responseJson = result;
    } on DioException catch (err) {
      debugPrint('ERROR  ${err.error}\n${err.response!.data}');
    }
    return responseJson;
  }
}
