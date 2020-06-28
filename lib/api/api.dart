import 'dart:async';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:cavewall/config/index.dart';
import 'package:cavewall/models/index.dart';

class Api {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  Api([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext context;
  Options _options;
  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'https://www.chinacytology.com/',
    headers: {
      HttpHeaders.acceptHeader: "application/json, text/plain, */*",
    },
  ));

  static void init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY 192.168.0.101:8888";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  //获取token
  Future<ProfileModel> token(String login, String pwd) async {
    // final value = encryptAESCryptoJS(pwd);
    var queryData = {
      "username": login,
      "password": pwd,
      "grant_type": "password",
      "scope": "server",
      "noEncrypt": true,
    };
    //获取token
    var r = await dio.post(
      "ccn/auth/oauth/token",
      queryParameters: queryData,
      options: _options.merge(headers: {
        HttpHeaders.authorizationHeader: 'Basic YXBwOmFwcA=='
      }),
    );
    var ressult = ProfileModel.fromJson(r.data);
    var basic = "Bearer";
    //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    //清空所有缓存
    Global.netCache.cache.clear();
    //更新profile中的token信息
    Global.profile.token = basic;

    return ressult;
  }
  
}
