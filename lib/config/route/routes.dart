/*
 * @Author: 刘广 
 * @Date: 2020-05-12 10:25:53 
 * @Last Modified by: 刘广
 * @Last Modified time: 2020-06-18 14:32:02
 */

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String homeNavigater = "/homeNavigater";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return SizedBox(
          child: Text('页面不存在'),
        );
      },
    );

    /**
     * @string 第一个参数是路由地址
     * @Hander 第二个参数是页面跳转和传参
     * @TransitionType 第三个参数是默认的转场动画
     */
    router.define(root, handler: rootHandler);
    router.define(homeNavigater, handler: navigaterHandler);
  }
}
