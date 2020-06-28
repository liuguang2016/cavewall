/*
 * @Author: 刘广 
 * @Date: 2020-05-12 10:25:45 
 * @Last Modified by: 刘广
 * @Last Modified time: 2020-06-18 14:24:10
 */

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../pages/index.dart';

//闪屏页
var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SplashPage();
  },
);

//导航页
var navigaterHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Navigater();
  },
);

