import 'package:example_buttomsheet/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example_buttomsheet/riverpod_util.dart';
import '../view/dashboard_view.dart';
import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier implements HyperController {
  DashboardView? view;
  String? value;

  List sheet = [
    {"name": "Basic Navigation 1", "onclik": BasicView()},
    {"name": "Navigation Radio Buttom", "onclik": BtsradioView()},
  ];
  List menu = [];
}

final dashboardController = ChangeNotifierProvider<DashboardController>((ref) {
  return DashboardController();
});
