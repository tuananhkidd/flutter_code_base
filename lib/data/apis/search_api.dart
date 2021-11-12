import 'package:flutter_code_base/data/models/base_obj_response.dart';
import 'package:flutter_code_base/data/models/setting_search.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'search_api.g.dart';

@RestApi()
abstract class SearchApi {
  factory SearchApi(Dio dio) = _SearchApi;

  @GET("/setting-searchs")
  Future<HttpResponse<BaseObjectResponse<SettingSearch>>> getSettingSearch();
}
