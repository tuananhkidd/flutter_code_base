import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_base/constants/constants.dart';
import 'package:flutter_code_base/core/core.dart';
import 'package:flutter_code_base/data/models/address.dart';
import 'package:flutter_code_base/data/models/job_category.dart';
import 'package:flutter_code_base/data/models/setting_search.dart';
import 'package:flutter_code_base/presentation/blocs/search/search_bloc.dart';
import 'package:flutter_code_base/presentation/blocs/search/search_event.dart';
import 'package:flutter_code_base/presentation/blocs/search/search_state.dart';
import 'package:flutter_code_base/presentation/widgets/item_title_search.dart';
import 'package:flutter_code_base/core/extensions/string_extensions.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class MyInheritedWidget extends InheritedWidget {
  // 1
  MyInheritedWidget(
      {required Widget child,
      required this.address,
      required this.salaries,
      required this.rewards,
      required this.jobCategories})
      : super(child: child);

  // 2
  final List<Address> address;
  List<SalaryBean> salaries = [];
  List<RewardBean> rewards = [];
  List<JobCategory> jobCategories = [];

  // 3
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return true;
  }

  // 4
  static MyInheritedWidget? of(BuildContext context) {
    // 5
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}

class TopSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaford<SearchBloc>(
      body: SearchPage(),
      isBack: false,
      padding: 0,
      backgroundColor: Colors.greenAccent,
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Address> addresses = [];
  List<JobCategory> jobCategories = [];
  List<SalaryBean> salaries = [];
  List<RewardBean> rewards = [];

  @override
  void initState() {
    super.initState();
    // context.read<SearchBloc>().add(LoadJobCategoryEvent());
    context.read<SearchBloc>().add(LoadSettingSearchEvent());
    // context.read<SearchBloc>().add(ChangeStatusEvent("1"));
    // context.read<SearchBloc>().add(LoadAddressEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      builder: (context, state) {
        print('current state $state');
        if (state is SettingSearchSuccessState) {
          addresses = state.address;
          jobCategories = state.jobCategory;
          salaries = state.salaries;
          rewards = state.rewards;
        }
        return MyInheritedWidget(
          child: _SearchPageWidgetState(),
          address: addresses,
          salaries: salaries,
          rewards: rewards,
          jobCategories: jobCategories,
        );
      },
      listener: (context, state) {
        print('current listener state $state');
        if (state is SettingSearchLoadingState) {
          // EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }
      },
    );
  }
}

// class SearchPageWidget extends StatefulWidget {
//   @override
//   _SearchPageWidgetState createState() => _SearchPageWidgetState();
// }

class _SearchPageWidgetState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    "検索条件",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: "#666666".toColor(),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "クリア",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Row(children: [
                ItemTitleSearch(Icon(CupertinoIcons.location), "地域"),
                UIConstants.horizontalBox24,
                DropDownWidget(),
              ]),
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Row(children: [
                ItemTitleSearch(Icon(CupertinoIcons.clock), "日程"),
                UIConstants.horizontalBox24,
              ]),
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ItemTitleSearch(Icon(CupertinoIcons.money_dollar), "報酬"),
                UIConstants.horizontalBox24,
                Expanded(
                  child: CustomChipLayout<SalaryBean>(),
                ),
              ]),
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ItemTitleSearch(Icon(CupertinoIcons.star), "待遇"),
                UIConstants.horizontalBox24,
                Expanded(
                  child: CustomChipLayout<RewardBean>(),
                ),
              ]),
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ItemTitleSearch(Icon(CupertinoIcons.person), "職種"),
                UIConstants.horizontalBox24,
                Expanded(
                  child: CustomChipLayout<JobCategory>(),
                ),
              ]),
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Flexible(
                    child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.blue
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search),
                            Text('検索',style: TextStyle(color: Colors.white),)
                          ],
                      ),
                    )
                ),
                SizedBox(width: 10,),
                Flexible(
                    child: InkWell(
                      onTap: (){
                        // context.read<SearchBloc>().add();
                        Navigator.pushNamed(context,'/detail_page');
                      },
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.blue
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_city_sharp),
                              Text('地図から検索',style: TextStyle(color: Colors.white),)
                            ],
                        ),
                      ),
                    )
                ),

              ],
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropDown();
  }
}

class DropDown extends StatefulWidget {
  late Widget icon;

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<Address> addresses = [];

  String selected = "東京都";

  @override
  Widget build(BuildContext context) {
    addresses = MyInheritedWidget.of(context)?.address ?? [];
    return DropdownButton<String>(
      value: selected,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: "#222222".toColor(), fontSize: 12),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (data) {
        setState(() {
          selected = data ?? "";
        });
      },
      items: addresses.map<DropdownMenuItem<String>>((address) {
        return DropdownMenuItem<String>(
          value: address.address,
          child: Text(address.address),
        );
      }).toList(),
    );
  }
}

class CustomChipLayout<T> extends StatefulWidget {
  @override
  _CustomChipLayoutState createState() {
    if (T == SalaryBean) {
      return SalaryWidget();
    } else if (T == RewardBean) {
      return ReWardWidget();
    } else {
      return JobCategoryWidget();
    }
  }
}

abstract class _CustomChipLayoutState<T> extends State<CustomChipLayout> {
  List<T> data = [];

  @override
  Widget build(BuildContext context) {
    print('base chip');
    initData(context);
    return  Wrap(
            alignment: WrapAlignment.start,
            spacing: 6,
            runSpacing: 6,
            children: (data.map((e) => _buildItemChip(context, e))).toList());

  }

  void initData(BuildContext context);
}

class SalaryWidget extends _CustomChipLayoutState<SalaryBean> {
  @override
  void initData(BuildContext context) {
    data = MyInheritedWidget.of(context)?.salaries ?? [];
  }
}

class ReWardWidget extends _CustomChipLayoutState<RewardBean> {
  @override
  void initData(BuildContext context) {
    data = MyInheritedWidget.of(context)?.rewards ?? [];
  }
}

class JobCategoryWidget extends _CustomChipLayoutState<JobCategory> {
  @override
  void initData(BuildContext context) {
    data = MyInheritedWidget.of(context)?.jobCategories ?? [];
  }
}

Widget _buildItemChip<T>(BuildContext context, T data) {
  String? title = "";
  bool isSelect = false;
  if (data is SalaryBean) {
    title = data.value;
    isSelect = data.isSelect;
  } else if (data is RewardBean) {
    title = data.value;
    isSelect = data.isSelect;
  } else if (data is JobCategory) {
    title = data.name;
    isSelect = data.isSelect;
  }
  Color color = Color(0xff666666);
  Color textColor = Color(0xff666666);
  BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      border: Border.all(color: color));
  if (isSelect) {
    color = Color(0xff33C7F7);
    textColor = Colors.white;
    decoration =  BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color),
        color: color);
  }
  return InkWell(
    onTap: () {
      context.read<SearchBloc>().add(ChangeStatusEvent<T>(data));
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: decoration,
      child: Text(
        '${title}',
        style: TextStyle(fontSize: 12,color: textColor),
      ),
    ),
  );
}
