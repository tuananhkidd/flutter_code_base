import 'package:flutter/material.dart';
import 'package:flutter_code_base/config/config.dart';
import 'package:flutter_code_base/presentation/pages/detail_page.dart';
import 'package:flutter_code_base/presentation/pages/tab/search_page.dart';

class SearchContainer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // return TopSearchPage();
    return MaterialApp(
      initialRoute: '/search_page',
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        routes: {
          '/search_page': (context) => TopSearchPage(),
          '/detail_page': (context) => DetailPage(),
        }
    );
  }
}