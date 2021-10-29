import 'package:equatable/equatable.dart';
import 'package:flutter_code_base/presentation/blocs/bottom_bar/bottom_bar_bloc.dart';

class BottomBarEvent extends Equatable{
  BottomBarIndex bottomBarIndex;

  BottomBarEvent(this.bottomBarIndex);

  @override
  List<Object?> get props => [];
}