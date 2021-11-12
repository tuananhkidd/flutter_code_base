import 'dart:convert';

import 'package:flutter_code_base/data/models/base_response.dart';
import 'package:flutter_code_base/data/models/job_category.dart';
import 'package:flutter_code_base/helper/utils.dart';
import 'package:json_annotation/json_annotation.dart';
// part 'base_list_response.g.dart';
class BaseListResponse<T> extends BaseResponse{
  BaseListResponse(int code, String msg ,this.data) : super(code, msg);
  List<T> data = [];

  factory BaseListResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) factoryFunction,
      ) {
    final dataList = List.from(json["data"]);
    final listResponse = Utils.listFromJson(dataList, factoryFunction);
    return BaseListResponse(
      json['code'] as int,
      json['msg'] as String,
      listResponse,
    );
  }

  @override
  String toString() {
    return 'code $code message $msg  BaseListResponse{data: $data}';
  }
}