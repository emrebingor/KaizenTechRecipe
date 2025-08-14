import 'package:dio/dio.dart';

class NetworkManager {
  NetworkManager._internal()
      : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://case-backend.vercel.app',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  static final NetworkManager _instance = NetworkManager._internal();
  final Dio _dio;

  factory NetworkManager() => _instance;

  String? _authToken;

  void setAuthToken(String token) => _authToken = token;

  Map<String, dynamic> _buildHeaders([Map<String, dynamic>? extra]) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (_authToken != null) 'Authorization': 'Bearer $_authToken',
      ...?extra,
    };
  }

  Future<Response<T>> get<T>(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    return _request<T>(
      endpoint,
      method: 'GET',
      queryParameters: queryParameters,
      headers: headers,
    );
  }

  Future<Response<T>> post<T>(
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? headers,
      }) async {
    return _request<T>(
      endpoint,
      method: 'POST',
      data: data,
      headers: headers,
    );
  }

  Future<Response<T>> _request<T>(
      String endpoint, {
        required String method,
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.request<T>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: _buildHeaders(headers),
        ),
      );
      return response;
    } on DioException catch (e) {
      throw Exception(_mapDioError(e));
    }
  }

  String _mapDioError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return 'Connection time out';
    }

    if (error.type == DioExceptionType.badResponse &&
        error.response != null) {
      final status = error.response!.statusCode;
      final data = error.response!.data;
      return 'HTTP $status: $data';
    }

    if (error.type == DioExceptionType.connectionError) {
      return 'Connection error. Please check your network.';
    }

    return 'Unknown error: ${error.message}';
  }
}
