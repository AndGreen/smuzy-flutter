import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smuzy_flutter/modules/main/main_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}) {
    Get.put(MainController());
  }

  @override
  Widget build(BuildContext context) {
    MainController c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${c.title} ${c.count}')),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            c.increment();
          },
          child: const Icon(Icons.add)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Hello ${c.count}',
                )),
          ],
        ),
      ),
    );
  }
}
