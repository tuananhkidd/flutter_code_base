import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_base/presentation/blocs/bottom_bar/bottom_bar_event.dart';
import 'package:flutter_code_base/presentation/blocs/bottom_bar/bottom_bar_state.dart';

enum BottomBarIndex {
  home,
  search,
  chat,
  qrcode,
  user,
}

const TAB_HOME = 0;
const TAB_SEARCH = 1;
const TAB_CHAT = 2;
const TAB_QRCODE = 3;
const TAB_MYPAGE = 4;


class BottomBarBloc extends Bloc<BottomBarEvent,BottomBarState>{
  BottomBarBloc() : super(BottomBarState(BottomBarIndex.home));

  @override
  Stream<BottomBarState> mapEventToState(BottomBarEvent event) async*{
    print("state" + event.bottomBarIndex.toString());
    yield BottomBarState(event.bottomBarIndex);
  }

}