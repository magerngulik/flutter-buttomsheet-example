import 'package:example_buttomsheet/core.dart';
import 'package:flutter/material.dart';
import 'package:example_buttomsheet/setup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './riverpod_util.dart';

void main() async {
  await initialize();

  Widget mainView = const DashboardView();

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.navigatorKey,
        home: mainView,
      ),
    ),
  );
}
