
import 'package:flutter/material.dart';

Widget buildLisTile(
    {required String name,
    required IconData iconData,
    void Function()? onTap,
    Widget? trailing}) {
  return ListTile(
    onTap: () {},
    trailing: trailing == null ? null : trailing,
    dense: true,
    leading: Icon(iconData),
    title: Text(name),
  );
}
