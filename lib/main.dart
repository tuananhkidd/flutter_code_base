import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_base/di/injector.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'config/config.dart';
import 'constants/constants.dart';
import 'presentation/blocs/blocs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig().configApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppInjector.injector<AppBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appTitle,
        onGenerateRoute: AppRoutes.getRoute,
        initialRoute: RouteConstants.home,
        theme: AppTheme.light,
        builder: EasyLoading.init(),
      ),
    );
  }
}
