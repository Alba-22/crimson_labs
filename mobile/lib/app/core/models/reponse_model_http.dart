import 'package:dio/dio.dart';

class ResponseModelHttp<T> {
  T data;
  Headers headers;
  int statusCode;
  String statusMessage;
  
  ResponseModelHttp({
    this.data,
    this.headers,
    this.statusCode,
    this.statusMessage,
  });
}