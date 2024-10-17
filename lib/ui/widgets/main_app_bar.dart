import 'package:flutter/material.dart';
import 'package:islami/utils/extensions/extensions.dart';

AppBar buildAppBar(BuildContext context, {bool addBackButton = false}) {
  return AppBar(
    automaticallyImplyLeading: addBackButton,
    title: Text(
      context.localization.islami,
    ),
  );
}
