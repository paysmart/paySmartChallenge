import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_smart_challenge/application/modules/movie_home/movie_home_module.dart';
import 'package:pay_smart_challenge/application/modules/movie_detail/movie_detail_module.dart';
import 'package:pay_smart_challenge/application/shared/bindings/application_bindings.dart';

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'PaySmart Challenge',
      initialBinding: ApplicationBindings(),
      getPages: [
        ...MovieHomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    );
  }
}
