import 'package:flutter_code_base/core/core.dart';
import 'package:flutter_code_base/core/services/base_service.dart';
import 'package:flutter_code_base/data/apis/apis.dart';
import 'package:flutter_code_base/data/models/job.dart';
import 'package:flutter_code_base/data/models/job_category.dart';
import 'package:dio/dio.dart';

class HomePageService with DataStateConvertable{
  final HomePageApi _api;
  HomePageService(this._api);

  Future<DataState<List<JobCategory>>> getCategories() async {
    try {
      final _response = await _api.getJobCategory();
      return convertToListDataState(_response);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
  Future<DataState<List<Job>>> getJobs() async {
    try {
      final _response = await _api.getJobs(1);
      return convertToListDataState(_response);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}