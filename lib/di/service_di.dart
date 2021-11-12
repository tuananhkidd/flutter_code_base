import 'package:flutter_code_base/data/services/home_page_service.dart';
import 'package:flutter_code_base/data/services/search_service.dart';
import 'package:flutter_code_base/data/services/services.dart';
import 'package:get_it/get_it.dart';


class ServiceDI {
  ServiceDI._();

  static Future<void> init(GetIt injector) async{
    injector.registerSingleton<UserSevice>(UserSevice(injector()));
    injector.registerSingleton<HomePageService>(HomePageService(injector()));
    injector.registerSingleton<SearchService>(SearchService(injector(),injector()));
  }
}
