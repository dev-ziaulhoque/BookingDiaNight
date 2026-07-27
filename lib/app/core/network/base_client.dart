import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_error_handler.dart';
import 'api_expection.dart';

class BaseClient {
  static final BaseClient _instance = BaseClient._internal();
  factory BaseClient() => _instance;
  BaseClient._internal();

  late Dio _dio;

  void init({
    String? baseUrl,
    Map<String, dynamic>? headers,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '',
        connectTimeout: connectTimeout ?? const Duration(seconds: 60),
        receiveTimeout: receiveTimeout ?? const Duration(seconds: 60),
        sendTimeout: sendTimeout ?? const Duration(seconds: 60),
        headers: headers ?? {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) => true,
      ),
    );

    _dio.interceptors.add(_createInterceptor());
  }

  InterceptorsWrapper _createInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint("┌─────────────────── 🚀 API REQUEST ───────────────────");
        debugPrint("│ Method: ${options.method}");
        debugPrint("│ URL: ${options.baseUrl}${options.path}");

        if (options.queryParameters.isNotEmpty) {
          debugPrint("│ Query Params: ${options.queryParameters}");
        }

        if (options.data != null) {
          if (options.data is FormData) {
            final formData = options.data as FormData;
            debugPrint("│ Body (FormData):");
            for (var element in formData.fields) {
              debugPrint("│   ${element.key}: ${element.value}");
            }
            for (var element in formData.files) {
              debugPrint("│   File -> ${element.key}: ${element.value.filename}");
            }
          } else {
            debugPrint("│ Body: ${options.data}");
          }
        } else {
          debugPrint("│ Body: No data");
        }
        debugPrint("└──────────────────────────────────────────────────────");
        handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint("┌─────────────────── ✅ API RESPONSE ──────────────────");
        debugPrint("│ Status: ${response.statusCode}");
        debugPrint("│ URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}");
        debugPrint("│ Data: ${response.data}");
        debugPrint("└──────────────────────────────────────────────────────");
        handler.next(response);
      },
      onError: (error, handler) {
        debugPrint("┌─────────────────── ❌ API ERROR ────────────────────");
        debugPrint("│ Status: ${error.response?.statusCode}");
        debugPrint("│ Method: ${error.requestOptions.method}");
        debugPrint("│ URL: ${error.requestOptions.baseUrl}${error.requestOptions.path}");
        debugPrint("│ Error Type: ${error.type}");
        debugPrint("│ Message: ${error.message}");
        debugPrint("│ Error Data: ${error.response?.data}");
        debugPrint("└──────────────────────────────────────────────────────");
        handler.next(error);
      },
    );
  }

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }

  Future<Response> post({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: body,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }

  Future<Response> postMultipart({
    required String endpoint,
    required FormData formData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            ...?headers,
            'Content-Type': 'multipart/form-data',
          },
        ),
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }

  Future<Response> put({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: body,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }

  Future<Response> putMultipart({
    required String endpoint,
    required FormData formData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            ...?headers,
            'Content-Type': 'multipart/form-data',
          },
        ),
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }

  Future<Response> patch({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: body,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }

  Future<Response> patchMultipart({
    required String endpoint,
    required FormData formData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            ...?headers,
            'Content-Type': 'multipart/form-data',
          },
        ),
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }

  Future<Response> delete({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: body,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }

  Future<Response> downloadFile({
    required String url,
    required String savePath,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    Function(int received, int total)? onReceiveProgress,
    CancelToken? cancelToken,
    bool deleteOnError = true,
  }) async {
    try {
      final response = await _dio.download(
        url,
        savePath,
        queryParameters: params,
        options: Options(headers: headers),
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
      );
      return response;
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }

  Future<Response> uploadFile({
    required String endpoint,
    required File file,
    String fileKey = 'file',
    String? filename,
    Map<String, dynamic>? additionalData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    FormData formData = FormData.fromMap({
      fileKey: await MultipartFile.fromFile(
        file.path,
        filename: filename ?? file.path.split('/').last,
      ),
      ...?additionalData,
    });

    return await postMultipart(
      endpoint: endpoint,
      formData: formData,
      headers: headers,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );
  }

  Future<Response> uploadMultipleFiles({
    required String endpoint,
    required List<File> files,
    String filesKey = 'files',
    List<String>? filenames,
    Map<String, dynamic>? additionalData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
    bool usePatch = false,
  }) async {
    List<MultipartFile> multipartFiles =[];

    for (int i = 0; i < files.length; i++) {
      multipartFiles.add(
        await MultipartFile.fromFile(
          files[i].path,
          filename: filenames != null && filenames.length > i
              ? filenames[i]
              : files[i].path.split('/').last,
        ),
      );
    }

    FormData formData = FormData.fromMap({
      filesKey: multipartFiles,
      ...?additionalData,
    });

    if (usePatch) {
      return await patchMultipart(
        endpoint: endpoint,
        formData: formData,
        headers: headers,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
    } else {
      return await postMultipart(
        endpoint: endpoint,
        formData: formData,
        headers: headers,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
    }
  }

  Future<Response> uploadFromBytes({
    required String endpoint,
    required Uint8List bytes,
    required String filename,
    String fileKey = 'file',
    Map<String, dynamic>? additionalData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    FormData formData = FormData.fromMap({
      fileKey: MultipartFile.fromBytes(bytes, filename: filename),
      ...?additionalData,
    });

    return await postMultipart(
      endpoint: endpoint,
      formData: formData,
      headers: headers,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );
  }

  Response _handleResponse(Response response) {
    final statusCode = response.statusCode ?? 0;

    // Success Responses
    if (statusCode >= 200 && statusCode < 300) {
      return response;
    }

    // Error Responses
    final message = ApiErrorHandler.extractErrorMessage(response.data);

    if (statusCode == 401) {
      _handleUnauthorized();
      throw UnauthorizedException(message);
    } else if (statusCode == 404) {
      throw NotFoundException(message);
    } else if (statusCode >= 400 && statusCode < 500) {
      throw ValidationException(message, statusCode);
    } else if (statusCode >= 500) {
      throw ServerException();
    } else {
      throw ApiException(message, statusCode);
    }
  }

  void _handleUnauthorized() {
    debugPrint("⚠️ Unauthorized - Token Expired or Invalid. Redirecting logic goes here.");
    // e.g. LocalStorage.removeData(key: 'token');
    // LocalStorage.removeData(key: 'token');
    // Get.offAllNamed('/loginView');
  }

  CancelToken createCancelToken() => CancelToken();

  Dio get dio => _dio;
}