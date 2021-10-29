import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_code_base/constants/constants.dart';
import 'package:flutter_code_base/core/core.dart';
import 'package:flutter_code_base/presentation/blocs/blocs.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaford<DetailBloc>(
      onReveiveArguments: (arguments, bloc) {
        // Call back to receive the arguments passed from privious page.
        if (arguments is String) {
          bloc.add(InitDetailEvent(name: arguments));
        }
      },
      title: TitlesConstants.detailTitle,
      body: const DetailListener(),
    );
  }
}

// Listener to listen the change of the states
class DetailListener extends StatelessWidget {
  const DetailListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailBloc, DetailState>(
      listenWhen: (oldState, currentState) {
        // Some validate for listener.
        return true;
      },
      listener: (context, state) {
        if (state is DetailInitial && state.name != null) {
          print("Name is: ${state.name}");
        }
      },
      child: DetailWidget(),
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        return Center(
          child: Text(state.name ?? ''),
        );
      },
    );
  }
}
