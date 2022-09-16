import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example_buttomsheet/riverpod_util.dart';
import '../view/btsradio_view.dart';

class BtsradioController extends ChangeNotifier implements HyperController {
  BtsradioView? view;
}

final btsradioController =
    ChangeNotifierProvider<BtsradioController>((ref) {
  return BtsradioController();
});