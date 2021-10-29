import 'package:equatable/equatable.dart';

import 'bottom_bar_bloc.dart';

class BottomBarState extends Equatable{
  BottomBarIndex bottomBarIndex;

  BottomBarState(this.bottomBarIndex);

  @override
  List<Object?> get props => [bottomBarIndex];

  @override
  String toString() {
    return bottomBarIndex.toString();
  }
}