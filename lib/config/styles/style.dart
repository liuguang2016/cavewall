/*
 * @Author: 刘广 
 * @Date: 2020-06-18 16:40:36 
 * @Last Modified by: 刘广
 * @Last Modified time: 2020-06-18 18:01:55
 */
import 'package:flutter/widgets.dart';

import 'colors.dart';
import 'dimens.dart';

class MyTextStyles {
  static TextStyle itemTitle = TextStyle(
    fontSize: Dimens.font_sp15,
    color: MyColours.text_gray,
  );
  
  static TextStyle listTitle = TextStyle(
    fontSize: Dimens.font_sp16,
    color: MyColours.text_dark,
    fontWeight: FontWeight.bold,
  );

  static TextStyle listContent = TextStyle(
    fontSize: Dimens.font_sp14,
    color: MyColours.text_normal,
  );
  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp12,
    color: MyColours.text_gray,
  );
}

//装饰分割线
class MyDecorations {
  static Decoration bottom = BoxDecoration(
    border: Border(
      bottom: BorderSide(width: 0.33, color: MyColours.divider),
    ),
  );
}

/// 间隔
class MyGaps {
  /// 水平间隔
  static Widget hGap5 = new SizedBox(width: Dimens.gap_dp5);
  static Widget hGap10 = new SizedBox(width: Dimens.gap_dp10);
  static Widget hGap15 = new SizedBox(width: Dimens.gap_dp15);

  /// 垂直间隔
  static Widget vGap5 = new SizedBox(height: Dimens.gap_dp5);
  static Widget vGap10 = new SizedBox(height: Dimens.gap_dp10);
  static Widget vGap15 = new SizedBox(height: Dimens.gap_dp15);
}
