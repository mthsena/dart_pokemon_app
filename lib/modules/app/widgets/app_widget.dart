import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../theme/configs/theme_config.dart';
import '../configs/app_config.dart';
import '../modules/app_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: MaterialApp.router(
        title: AppConfig.title,
        theme: ThemeConfig.theme,
        debugShowCheckedModeBanner: AppConfig.showDebugBanner,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
