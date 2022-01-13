import 'dart:ui';

import 'package:flutter/material.dart';

class MeetingTool {
  // 每4个一屏，得到一个二维数组
  static int screenLen = 2;
  static getScreenList(list) {
    int len = screenLen; //4个一屏
    List<List> result = [];
    int index = 1;
    while (true) {
      if (index * len < list.length) {
        List temp = list.skip((index - 1) * len).take(len).toList();
        result.add(temp);
        index++;
        continue;
      }
      List temp = list.skip((index - 1) * len).toList();
      result.add(temp);
      break;
    }
    return result;
  }

  /// 获得视图宽高
  static Size getViewSize(
      Size screenSize, int listLength, int index, int total) {
    if (listLength < 5) {
      // 只有一个显示全屏
      if (total == 1) {
        return screenSize;
      }
      // 两个显示半屏
      if (total == 2) {
        return Size(screenSize.width, screenSize.height / 2);
      }
    }
    return Size(screenSize.width / 2, screenSize.height / 2);
  }
}
