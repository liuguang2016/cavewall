import 'package:cavewall/pages/splash/splash_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cavewall/config/index.dart';
import 'package:cavewall/states/index.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //挂载路由
  _MyAppState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  // 应用的根wiget.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserStates()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, Widget child) {
          return MaterialApp(
            //全局样式
            theme: ThemeData(
              primaryColor: Colors.white,
              accentColor: Colors.red[900],
              fontFamily: 'PingFang',
            ),
            //去掉调试
            debugShowCheckedModeBanner: false,
            //生成路由
            onGenerateRoute: Application.router.generator,
          );
        },
      ),
    );
  }
}
