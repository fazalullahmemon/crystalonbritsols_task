import 'package:crystalonbritsols_task/navigation_path.dart';
import 'package:crystalonbritsols_task/services/controller_bindings.dart';
import 'package:crystalonbritsols_task/services/storage_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();

  runApp(const CrystalonBritsolsTaskApp());
}

_initServices() async {
  await StorageHelper.initializePreferences();
}

class CrystalonBritsolsTaskApp extends StatelessWidget {
  const CrystalonBritsolsTaskApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      title: "CrystalonBristols Task",
      debugShowCheckedModeBanner: false,

      initialRoute: NavigationPath.loginScreen,
      getPages: NavigationPath.pages,
      transitionDuration: NavigationPath.defaultDuration,
      defaultTransition: NavigationPath.defaultTransition,
      initialBinding: ControllerBindings(),

      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
