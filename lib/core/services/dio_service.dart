import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../utils/config.dart';

abstract class DioHttpService {
  String get baseUrl;

  Map<String, String> get headers;

  Future<dynamic> appPost(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> appGet(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> appPut(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> appPatch(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> appDelete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  });
}

class DioHttpServiceImpl implements DioHttpService {
  late final Dio dio;

  DioHttpServiceImpl() {
    dio = Dio(baseOptions);
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        request: false,
        requestBody: true,
      ));
    }
  }
  @override
  String get baseUrl => Config.baseUrl;

  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  Map<String, String> get headers => {
        HttpHeaders.connectionHeader: 'keep-alive',
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };

  @override
  Future appGet(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.get(
        path,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioError {
      rethrow;
    }
  }

  @override
  Future appDelete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioError {
      rethrow;
    }
  }

  @override
  Future appPatch(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioError {
      rethrow;
    }
  }

  @override
  Future appPost(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioError {
      rethrow;
    }
  }

  @override
  Future appPut(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioError {
      rethrow;
    }
  }
}
