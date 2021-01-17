class ResponseModel<T> {
  T data;
  int statusCode;
  String errorMessage;
  
  ResponseModel({
    this.data,
    this.statusCode,
    this.errorMessage,
  });
}