import 'package:flutter/material.dart';
import 'package:flutter_code_base/constants/route_constants.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_code_base/presentation/pages/pages.dart';

class PageDI {
  PageDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerFactory<Widget>(() => HomePage(),
        instanceName: RouteConstants.home);

    injector.registerFactory<Widget>(() => ApiPage(),
        instanceName: RouteConstants.api);

    injector.registerFactory<Widget>(() => CachedPage(),
        instanceName: RouteConstants.cached);
    
    injector.registerFactory<Widget>(() => DetailPage(),
        instanceName: RouteConstants.detail);
  }
}
