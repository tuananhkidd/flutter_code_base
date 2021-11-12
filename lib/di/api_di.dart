import 'package:flutter_code_base/data/apis/search_api.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_code_base/data/apis/apis.dart';

class ApiDI {
  ApiDI._();

  static Future<void> init(GetIt injector) async{
    injector.registerSingleton<UserApi>(UserApi(injector()));
    injector.registerSingleton<HomePageApi>(HomePageApi(injector()));
    injector.registerSingleton<SearchApi>(SearchApi(injector()));
  }
}
