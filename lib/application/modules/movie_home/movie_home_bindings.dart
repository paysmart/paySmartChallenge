import 'package:get/get.dart';
import 'movie_home_vm.dart';

class MovieHomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      MovieHomeControllerVM(
        moviesServices: Get.find(),
      ),
    );
  }
}
