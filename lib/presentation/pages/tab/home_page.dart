import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_base/constants/app_constants.dart';
import 'package:flutter_code_base/constants/ui_constants.dart';
import 'package:flutter_code_base/core/core.dart';
import 'package:flutter_code_base/core/extensions/string_extensions.dart';
import 'package:flutter_code_base/data/models/job.dart';
import 'package:flutter_code_base/data/models/job_category.dart';
import 'package:flutter_code_base/helper/ui_helper.dart';
import 'package:flutter_code_base/presentation/blocs/home_page/home_page_bloc.dart';
import 'package:flutter_code_base/presentation/blocs/home_page/home_page_event.dart';
import 'package:flutter_code_base/presentation/blocs/home_page/home_page_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class TopHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaford<HomePageBloc>(
      body: TopHomePageWidget(),
      isBack: false,
      backgroundColor: Colors.transparent,
    );
  }
}

class TopHomePageWidget extends StatefulWidget {
  @override
  _TopHomePageState createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePageWidget>
    with AutomaticKeepAliveClientMixin {
  List<JobCategory>? jobcategory = [];
  List<Job> jobs = [];

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(LoadJobCategoryEvent());
    context.read<HomePageBloc>().add(LoadJobEvent());
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Container(
      child: BlocConsumer<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is JobCategorySuccess) {
            jobcategory = state.jobCategory;
          } else if (state is JobSuccess) {
            jobs = state.job ?? [];
          }

          return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Image.asset(
                    "assets/images/ic_joyku_app.png",
                    width: 100,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  UIConstants.verticalBox16,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: new Container(
                              child: Divider(
                            color: Colors.black,
                            height: 6,
                          )),
                        ),
                        Text("お引き出し可能な給与額"),
                        Expanded(
                          child: new Container(
                              child: Divider(
                            color: Colors.black,
                            height: 6,
                          )),
                        ),
                      ],
                    ),
                  ),
                  UIConstants.verticalBox16,
                  Text(
                    "¥48,000",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Container(
                    margin: UIConstants.edgeInsetAll8,
                    padding: UIConstants.edgeInsetAll8,
                    decoration: BoxDecoration(
                        color: '#33C7F7'.toColor(),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/ic_event.png",
                                width: 50,
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                              UIConstants.verticalBox4,
                              Text(
                                'イベント',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/ic_gift.png",
                                width: 60,
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                              UIConstants.verticalBox4,
                              Text(
                                'プレゼント',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/ic_campaing.png",
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                              UIConstants.verticalBox4,
                              Text(
                                'キャンペーン',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildListJobCategory(),
                  UIConstants.verticalBox20,
                  Text("あなたにおすすめの求人",
                      style: TextStyle(
                          color: "#222222".toColor(), fontSize: 16,fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  UIConstants.verticalBox20,
                  _buildListJob(),
                  SizedBox(
                    height: 70,
                  )
                ],
              ));
        },
        listener: (context, state) {
          if (state is JobCategoryLoading) {
            // EasyLoading.show();
          } else {
            EasyLoading.dismiss();
            if (state is JobCategoryFailure) {
              UiHelper.showMyDialog(
                context: context,
                content: state.message ?? "This is something wrong",
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildListJob() {
    return Container (
      height: 240,
      child:
            ListView(
              shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: jobs
                    .map((e) => Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 160,
                  color: Colors.white,
                  padding: EdgeInsets.all(2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        AppConstants.imageUrl + (e.thumbnail ?? ""),
                        width: 160,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      UIConstants.verticalBox8,
                      Text(
                        "${e.title}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      UIConstants.verticalBox4,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("${e.user_name}",
                            style: TextStyle(
                                color: "#222222".toColor(), fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      UIConstants.verticalBox4,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          Flexible(
                            flex: 2,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "${e.date}\n${e.time_start}-${e.time_end}",
                                style: TextStyle(
                                    color: "#222222".toColor(),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Column(
                                children: [
                                  Text(
                                    "¥${e.salary}",
                                    style: TextStyle(
                                        color: "#222222".toColor(),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
                    .toList())
      ,
    );
  }

  Widget _buildListJobCategory(){
    return  Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,top: 16,right: 10,bottom: 6),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          shrinkWrap: true,
          children: jobcategory
              ?.map((e) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                child: Image.network(
                  (e.image_url ?? ""),
                  height: 40,
                  width: 40,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    e.name ?? "",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ))
              .toList() ??
              [
                Container(
                  padding: UIConstants.edgeInsetAll8,
                  color: Colors.white,
                )
              ],
        ),
      ),
    );
  }
}
