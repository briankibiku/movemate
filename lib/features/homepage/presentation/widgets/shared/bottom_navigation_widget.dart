import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(BuildContext context, String pageTitle) {
  return AppBar(
    title: Text(pageTitle),
    backgroundColor: const Color(0xff493391),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
    ),
  );
}
