import 'package:flutter_code_base/data/models/base_response.dart';

class BaseObjectResponse<T> extends BaseResponse{
  BaseObjectResponse(int code, String msg , this.data) : super(code, msg);
  T? data;

  factory BaseObjectResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) factoryFunction,
      ) {
    final data = factoryFunction(json["data"]);
    return BaseObjectResponse(
      json['code'] as int,
      json['msg'] as String,
      data,
    );
  }
}