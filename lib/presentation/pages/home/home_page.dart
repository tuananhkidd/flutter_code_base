import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_code_base/constants/ui_constants.dart';
import 'package:flutter_code_base/core/extensions/string_extensions.dart';

class TopHomePage extends StatefulWidget {
  @override
  _TopHomePageState createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePage> {
  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');

    return CustomScrollView(
      key: centerKey,
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Image.asset("assets/images/ic_joyku_app.png",width: 100,height: 60,fit: BoxFit.cover,),
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
              Text("¥48,000", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
              Container(
                margin: UIConstants.edgeInsetAll8,
                padding: UIConstants.edgeInsetAll8,
                decoration: BoxDecoration(
                  color: '#33C7F7'.toColor(),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset("assets/images/ic_event.png",width : 50,height: 50,fit: BoxFit.fill,),
                          UIConstants.verticalBox4,
                          Text(
                            'イベント',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset("assets/images/ic_gift.png",width : 60 ,height: 50,fit: BoxFit.fill,),
                          UIConstants.verticalBox4,
                          Text(
                            'プレゼント',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset("assets/images/ic_campaing.png",height: 50,fit: BoxFit.fill,),
                          UIConstants.verticalBox4,
                          Text(
                            'キャンペーン',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
