import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_code_base/constants/constants.dart';
import 'package:flutter_code_base/core/core.dart';

import '../blocs/blocs.dart';
import '../widgets/widgets.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaford<UserBloc>(
      title: TitlesConstants.apiTitle,
      body: const ApiMainWidget(),
    );
  }
}

class ApiMainWidget extends StatelessWidget {
  const ApiMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              context.read<UserBloc>().add(UserApiFetchEvent());
            },
            child: const Text(ButtonConstatns.api)),
        const Expanded(child: UserResultWidget()),
      ]),
    );
  }
}
