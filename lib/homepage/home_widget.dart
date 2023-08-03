import 'package:flutter/material.dart';

import '../resources/media_query.dart';

Widget userListTile(
    {required String title,
    required String subTitle,
    required int id,
    required VoidCallback removeUser}) {
  return Padding(
    padding: EdgeInsets.all(MediaQueryUse.height * .01),
    child: ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      tileColor: Colors.amber,
      textColor: Colors.black,
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        radius: MediaQueryUse.height * .03,
        child: Text('$id',
            style: TextStyle(
                color: Colors.amber, fontSize: MediaQueryUse.height * .03)),
      ),
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQueryUse.height * .027)),
      subtitle: Text(subTitle,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: MediaQueryUse.height * .022)),
      trailing: IconButton(onPressed: removeUser, icon: const Icon(Icons.delete)),
    ),
  );
}
