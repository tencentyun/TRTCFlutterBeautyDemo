import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trtc_demo/models/beauty_setting.dart';
import 'package:tencent_trtc_cloud_beauty/trtc_cloud.dart';
import 'package:tencent_trtc_cloud_beauty/tx_beauty_manager.dart';

import '../../models/beauty_setting.dart';

/// 美颜特效
class BeautyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BeautyPageState();
}

class BeautyPageState extends State<BeautyPage> {
  late TRTCCloud trtcCloud;
  late TXBeautyManager txBeautyManager;
  @override
  initState() {
    super.initState();
    initData();
  }

  initData() async {
    // 创建 TRTCCloud 单例
    trtcCloud = (await TRTCCloud.sharedInstance())!;
    // 获取美颜管理对象
    txBeautyManager = trtcCloud.getBeautyManager();
  }

  String effectKey = "setMotionTmpl-nil";
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: BeautySetting.effectList
          .map((item) => GestureDetector(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 65.0,
                  height: 40,
                  child: Text(
                    item.name,
                    //overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        // fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        color:
                            effectKey == item.key ? Colors.red : Colors.white),
                  ),
                ),
                onTap: () {
                  this.setState(() {
                    effectKey = item.key;
                    BeautySetting.doSpecialEffect(txBeautyManager, item.key);
                  });
                },
              ))
          .toList(),
    );
  }
}
