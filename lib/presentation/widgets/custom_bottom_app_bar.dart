import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_base/presentation/blocs/bottom_bar/bottom_bar_bloc.dart';
import 'package:flutter_code_base/presentation/blocs/bottom_bar/bottom_bar_event.dart';
import 'package:flutter_code_base/presentation/blocs/bottom_bar/bottom_bar_state.dart';
import 'package:flutter_code_base/presentation/pages/home/home_page.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  PageController _controller = PageController(initialPage: 0, keepPage: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = context.watch<BottomBarBloc>().state;

    print("refresh " + (currentIndex.bottomBarIndex).toString());

    return BlocBuilder<BottomBarBloc, BottomBarState>(
      builder: (context, state) {
        return Stack(
          children: [
            Image.asset(
              'assets/images/bg_social_background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            PageView(
              controller: _controller,
              children: [
                TopHomePage(),
                TopHomePage(),
                TopHomePage(),
                TopHomePage(),
                TopHomePage()
              ],
              onPageChanged: (page) {
                context
                    .read<BottomBarBloc>()
                    .add(BottomBarEvent(BottomBarIndex.values[page]));
              },
            ),
            Positioned(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:  Radius.circular(10))
                ),
                child: Container(
                  height: 56,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomAppBarItem(
                        onPressed: () {
                          _controller.jumpToPage(TAB_HOME);
                          context
                              .read<BottomBarBloc>()
                              .add(BottomBarEvent(BottomBarIndex.home));
                        },
                        isActive:
                            currentIndex.bottomBarIndex == BottomBarIndex.home,
                        label: "Home",
                        icon: Icon(CupertinoIcons.home),
                      ),
                      BottomAppBarItem(
                        onPressed: () {
                          _controller.jumpToPage(TAB_SEARCH);
                          context
                              .read<BottomBarBloc>()
                              .add(BottomBarEvent(BottomBarIndex.search));
                        },
                        isActive: currentIndex.bottomBarIndex ==
                            BottomBarIndex.search,
                        label: "Search",
                        icon: Icon(CupertinoIcons.search),
                      ),
                      BottomAppBarItem(
                        isActive:
                            currentIndex.bottomBarIndex == BottomBarIndex.chat,
                        onPressed: (){
                          _controller.jumpToPage(TAB_CHAT);
                          context
                              .read<BottomBarBloc>()
                              .add(BottomBarEvent(BottomBarIndex.chat));
                        },
                        label: "Chat",
                        icon: Icon(CupertinoIcons.chat_bubble),
                      ),
                      BottomAppBarItem(
                        onPressed: (){
                          _controller.jumpToPage(TAB_QRCODE);
                          context
                              .read<BottomBarBloc>()
                              .add(BottomBarEvent(BottomBarIndex.qrcode));
                        },
                        isActive: currentIndex.bottomBarIndex ==
                            BottomBarIndex.qrcode,
                        label: "QR Code",
                        icon: Icon(CupertinoIcons.qrcode),
                      ),
                      BottomAppBarItem(
                        onPressed: (){
                          _controller.jumpToPage(TAB_MYPAGE);
                          context
                              .read<BottomBarBloc>()
                              .add(BottomBarEvent(BottomBarIndex.user));
                        },
                        isActive:
                            currentIndex.bottomBarIndex == BottomBarIndex.user,
                        label: "My Page",
                        icon: Icon(CupertinoIcons.person),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        );
      },

    );
  }
}

class BottomAppBarItem extends StatelessWidget {
  static const iconSizeCenter = 45.0;

  const BottomAppBarItem({
    Key? key,
    required this.isActive,
    required this.icon,
    required this.onPressed,
    this.label,
    this.iconSize = 25,
    this.marginBottom = 6,
  }) : super(key: key);

  final Function() onPressed;
  final Widget icon;
  final String? label;
  final double iconSize;

  final double marginBottom;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final selectedLabelStyle = TextStyle(color: Colors.black);
    final unselectedLabelStyle = TextStyle(color: Colors.white);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          icon: Column(children: [
            Container(
              width: iconSize,
              height: iconSize,
              margin: EdgeInsets.only(bottom: marginBottom),
              child: ColorFiltered(
                child: icon,
                colorFilter: ColorFilter.mode(
                    isActive ? Colors.black : Colors.white, BlendMode.srcIn),
              ),
            ),
          ]),
        ),
        if (label != null)
          Text(label!,
              style: isActive ? selectedLabelStyle : unselectedLabelStyle)
      ],
    );
  }
}
