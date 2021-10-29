import 'package:flutter/material.dart';
import 'package:flutter_code_base/constants/constants.dart';

import '../../data/models/app_user.dart';

class ListUserWidget extends StatelessWidget {
  const ListUserWidget({
    Key? key,
    required List<AppUser>? users,
  })  : _users = users,
        super(key: key);

  final List<AppUser>? _users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: UIConstants.edgeInsetAll12,
        itemCount: _users?.length ?? 0,
        itemBuilder: (contenxt, index) {
          final _user = _users?[index];
          return UserItemWidget(user: _user);
        });
  }
}

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    Key? key,
    required AppUser? user,
  })  : _user = user,
        super(key: key);

  final AppUser? _user;

  @override
  Widget build(BuildContext context) {
    return (_user != null)
        ? InkWell(
            onTap: () {
              // Goto detail page.
              Navigator.of(context)
                  .pushNamed(RouteConstants.detail, arguments: _user?.name);
            },
            child: Container(
              padding: UIConstants.edgeInsetAll12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user!.id + " - " + (_user!.name),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Tap to go to the detail and send params to it.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  UIConstants.verticalBox8,
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          )
        : Container();
  }
}
