import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    DashboardController controller = ref.watch(dashboardController);
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: controller.sheet.length,
                  itemBuilder: (context, index) {
                    var item = controller.sheet[index];
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => item['onclik']);
                      },
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            backgroundImage: const NetworkImage(
                              "https://i.ibb.co/QrTHd59/woman.jpg",
                            ),
                          ),
                          title: Text("${item['name']}"),
                          subtitle: const Text("BottomSheet"),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.red[200],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        margin: const EdgeInsets.only(),
                                        child: TextFormField(
                                          maxLength: 20,
                                          decoration: const InputDecoration(
                                            labelText: 'Name',
                                            labelStyle: TextStyle(
                                              color: Colors.blueGrey,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            helperText: "What's your name?",
                                          ),
                                          onChanged: (value) {
                                            controller.value = value;
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                        ),
                                        onPressed: () async {
                                          controller.menu.add(controller.value);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Simpan"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.add))),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: controller.menu.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var item = controller.menu[index];
                          return Container(
                            width: 100.0,
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${item}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
