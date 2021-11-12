import 'package:flutter/material.dart';

import 'package:flutter_code_base/constants/constants.dart';
import 'package:flutter_code_base/core/views/app_scaford.dart';
import 'package:flutter_code_base/presentation/blocs/bottom_bar/bottom_bar_bloc.dart';
import 'package:flutter_code_base/presentation/widgets/custom_bottom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaford<BottomBarBloc>(
      body: const HomeWidget(),
      isBack: false,
      padding: 0,

    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {



  @override
  Widget build(BuildContext context) {

    return CustomBottomAppBar();
  }
}
