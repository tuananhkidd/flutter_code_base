import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_code_base/core/resources/data_state.dart';
import 'package:flutter_code_base/core/services/base_service.dart';
import 'package:flutter_code_base/data/apis/apis.dart';
import 'package:flutter_code_base/data/apis/search_api.dart';
import 'package:flutter_code_base/data/models/address.dart';
import 'package:flutter_code_base/data/models/base_obj_response.dart';
import 'package:flutter_code_base/data/models/job_category.dart';
import 'package:flutter_code_base/data/models/setting_search.dart';
import 'package:flutter_code_base/helper/utils.dart';
import 'package:dio/dio.dart';

class SearchService with DataStateConvertable{

  final SearchApi _api;
  final HomePageApi _homePageApi;

  SearchService(this._api,this._homePageApi);

  Future<List<Address>> getAddresses() async {
    try {
      String data = await rootBundle.loadString("assets/address.json");
      final jsonResult = jsonDecode(data);
      final dataList = List.from(jsonResult);
      return  Utils.listFromJson(dataList,  (e) => Address.fromJson(e));
    } catch (e) {
      return [];
    }
  }

  Future<DataState<List<JobCategory>>> getCategories() async {
    try {
      final _response = await _homePageApi.getJobCategory();
      return convertToListDataState(_response);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState<BaseObjectResponse<SettingSearch>>> getSettingSearch()  async{
    try {
      final _response = await _api.getSettingSearch();
      return convertToDataState(_response);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}