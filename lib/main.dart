import 'package:flutter/material.dart';

import 'package:cavewall/pages/app/my_app.dart';
import 'config/global/index.dart';

void main() async {
  Global.init().then((e) => runApp(MyApp()));
}