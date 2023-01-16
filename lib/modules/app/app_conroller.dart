import 'package:get/get.dart';
import 'package:smuzy_flutter/common/models/routine.dart';

class AppController extends GetxController {
  var routines = defaultRoutines.obs;
  var activeRoutine = Rxn<Routine>();

  toggleActiveRoutine(Routine newRoutine) {
    activeRoutine.value = activeRoutine.value == newRoutine ? null : newRoutine;
  }
}
