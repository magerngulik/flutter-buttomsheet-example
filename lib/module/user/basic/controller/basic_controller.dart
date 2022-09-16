import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example_buttomsheet/riverpod_util.dart';
import '../view/basic_view.dart';

class BasicController extends ChangeNotifier implements HyperController {
  BasicView? view;
}

final basicController =
    ChangeNotifierProvider<BasicController>((ref) {
  return BasicController();
});