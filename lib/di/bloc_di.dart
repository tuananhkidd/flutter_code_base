import 'package:flutter_code_base/presentation/blocs/bottom_bar/bottom_bar_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_code_base/presentation/blocs/blocs.dart';

class BlocDI {
  BlocDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerSingleton<AppBloc>(AppBloc());
    injector.registerFactory(() => UserBloc(injector(), injector()));
    injector.registerFactory(() => DetailBloc());
    injector.registerFactory(() => BottomBarBloc());
  }
}
