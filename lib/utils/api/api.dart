import 'dart:developer';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_template/provider/auth/auth_provider.dart';
import 'package:flutter_template/provider/auth/token_provider.dart';

import 'package:flutter_template/utils/tokens.dart';

part 'api.g.dart';

@Riverpod(keepAlive: true)
Api api(ApiRef ref) => Api(ref: ref);

class Api {
  Api({required this.ref});
  final Ref ref;
  get dio => _createDio();

  Dio _createDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: Tokens.apiBaseUrl,
        receiveTimeout: const Duration(seconds: 15), // 15 seconds
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    if (kDebugMode) {
      dio.interceptors.addAll(
        [
          CurlLoggerDioInterceptor(printOnSuccess: true),
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        ],
      );
    }
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? accessToken =
              await ref.read(tokenProviderProvider).fetchToken();
          if (accessToken == null) {
            log('Token not available.');
            return handler.next(options);
          }

          options.headers['Authorization'] = 'Bearer $accessToken';

          return handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (DioException err, handler) async {
          if (err.response?.statusCode == 401) {
            ref.read(authProvider.notifier).signOut();
            return handler.reject(err);
          } //continue
          else {
            return handler.next(err);
          }
        },
      ),
    );

    return dio;
  }

  Future get(String url, [Options? options]) async {
    return await _createDio().get(url, options: options);
  }

  Future post(String url, var data, [Options? options]) async {
    return await _createDio().post(url, data: data, options: options);
  }

  Future put(String url, var data, [Options? options]) async {
    return await _createDio().put(url, data: data, options: options);
  }

  Future delete(String url, [var data, Options? options]) async {
    return await _createDio().delete(url, data: data, options: options);
  }

  Future patch(String url, [var data, Options? options]) async {
    return await _createDio().patch(url, data: data, options: options);
  }

  void clearHeader() async {
    _createDio().options.headers.clear();
  }
}
