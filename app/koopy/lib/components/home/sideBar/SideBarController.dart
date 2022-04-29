import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SideBarController extends GetxController {
  @override
  void onReady() {
    final storage = GetStorage();
    print(storage.read('userData'));
    super.onReady();
  }
}