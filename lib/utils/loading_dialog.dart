// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:e_commerce_mvvm/utils/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> loadingDialogs(BuildContext context) async {
  Get.dialog(
      WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: ColorResources.transparentColor,
              elevation: 0,
              children: const <Widget>[
                Center(child: CupertinoActivityIndicator(radius: 16),)
              ]
          )
      )
  );
}