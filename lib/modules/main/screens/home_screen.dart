import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smuzy_flutter/common/utils/dates.dart';
import 'package:smuzy_flutter/modules/main/main_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}) {
    Get.put(MainController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getCurrentFormattedDay(),
            style: const TextStyle(fontSize: 18)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('hello'),
          ],
        ),
      ),
    );
  }
}
