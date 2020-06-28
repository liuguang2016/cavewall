/*
 * @Author: 刘广 
 * @Date: 2020-05-11 17:59:32 
 * @Last Modified by: 刘广
 * @Last Modified time: 2020-06-18 14:36:16
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cavewall/config/index.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //计时跳转
  jumpPage() {
    return Timer(
      Duration(milliseconds: 1000),
      () {
        Application.router.navigateTo(
          context,
          Routes.homeNavigater,
          replace: true,
          clearStack: true,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    jumpPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 背景色
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.png"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Text(
            '',
          ),
        ),
      ),
    );
  }
}
