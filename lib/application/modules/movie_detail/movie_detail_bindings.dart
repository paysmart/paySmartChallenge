import 'package:get/get.dart';
import 'movie_detail_vm.dart';

class MovieDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      MovieDetailControllerVM(
        moviesServices: Get.find(),
      ),
    );
  }
}
