import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/btsradio_controller.dart';

class BtsradioView extends ConsumerWidget {
  const BtsradioView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    BtsradioController controller = ref.watch(btsradioController);
    controller.view = this;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ),
          Text(
            "Sort data by",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Divider(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 60.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Most recent first",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
            child: Center(
              child: Text(
                "Try It Now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
