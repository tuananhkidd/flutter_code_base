import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_code_base/constants/constants.dart';
import 'package:flutter_code_base/core/core.dart';

import '../blocs/blocs.dart';
import '../widgets/widgets.dart';


class CachedPage extends StatelessWidget {
  const CachedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaford<UserBloc>(
      title: TitlesConstants.cachedTitle,
      body: const CachedMainWidget(),
    );
  }
}

class CachedMainWidget extends StatelessWidget {
  const CachedMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              context.read<UserBloc>().add(UserLocalFetchEvent());
            },
            child: const Text("Get user Cached")),
        const Expanded(child: UserResultWidget()),
      ]),
    );
  }
}
