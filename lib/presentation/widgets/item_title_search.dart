
import 'package:flutter/material.dart';
import 'package:flutter_code_base/core/extensions/string_extensions.dart';

class ItemTitleSearch extends StatelessWidget{

  Widget icon;
  String title;


  ItemTitleSearch(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(title,style: TextStyle(fontSize: 10,color: "#666666".toColor()),)
      ],
    );
  }
}