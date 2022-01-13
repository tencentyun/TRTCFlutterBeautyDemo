import 'dart:io';
import 'package:tencent_trtc_cloud_beauty/trtc_cloud_def.dart';
import 'package:tencent_trtc_cloud_beauty/tx_beauty_manager.dart';
import 'package:trtc_demo/utils/tx_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SettingItem {
  String key, name, funcName;
  SettingItem(this.key, this.name, this.funcName);
  var _params;
  dynamic getParams() {
    return this._params;
  }

  void setParams(dynamic p) {
    this._params = p;
  }
}

///美颜
class BeautySetting {
  static List<SettingItem> settingList = [
    SettingItem("effects", "特效", 'effects'),
    SettingItem('smooth', '光滑', 'setBeautyStyle')
      ..setParams(TRTCCloudDef.TRTC_BEAUTY_STYLE_SMOOTH),
    SettingItem('nature', '自然', 'setBeautyStyle')
      ..setParams(TRTCCloudDef.TRTC_BEAUTY_STYLE_NATURE),
    SettingItem('pitu', 'P图', 'setBeautyStyle')
      ..setParams(TRTCCloudDef.TRTC_BEAUTY_STYLE_PITU),
    SettingItem('whitening', '美白', 'setWhitenessLevel'),
    SettingItem('ruddy', '红润', 'setRuddyLevel'),
    //企业版 SDK
    ////SettingItem('setEyeLightenLevel', '亮眼', 'setEyeLightenLevel'),
    SettingItem('setEyeScaleLevel', '大眼', 'setEyeScaleLevel'),
    SettingItem('setFaceSlimLevel', '瘦脸', 'setFaceSlimLevel'),
    SettingItem('setFaceVLevel', 'V 脸', 'setFaceVLevel'),
    SettingItem('setChinLevel', '下巴', 'setChinLevel'),
    SettingItem('setLipsThicknessLevel', '嘴唇厚度', 'setLipsThicknessLevel'),
    SettingItem('setFaceShortLevel', '    短脸', 'setFaceShortLevel'),
    SettingItem('setNoseSlimLevel', '瘦鼻', 'setNoseSlimLevel'),
    SettingItem('setToothWhitenLevel', '白牙', 'setToothWhitenLevel'),
    SettingItem('setWrinkleRemoveLevel', '祛皱', 'setWrinkleRemoveLevel'),
    SettingItem('setPounchRemoveLevel', '祛眼袋', 'setPounchRemoveLevel'),
    SettingItem('setSmileLinesRemoveLevel', '法令纹', 'setSmileLinesRemoveLevel'),
    SettingItem('setForeheadLevel', '发际线', 'setForeheadLevel'),
    SettingItem('setEyeDistanceLevel', '眼距', 'setEyeDistanceLevel'),
    SettingItem('setEyeAngleLevel', '眼角', 'setEyeAngleLevel'),
    SettingItem('setNosePositionLevel', '鼻子位置', 'setNosePositionLevel'),
    SettingItem('setMouthShapeLevel', '   嘴型', 'setMouthShapeLevel'),
    SettingItem('setNoseWingLevel', '鼻翼', 'setNoseWingLevel'),
    SettingItem('setFaceBeautyLevel', '脸型', 'setFaceBeautyLevel')
  ];

  static doBeautyBySetting(
      TXBeautyManager txBeautyManager, String key, double value) {
    int val = value.round();
    switch (key) {
      case "effects":
        txBeautyManager.setMotionTmpl(null);
        break;
      case "smooth":
        txBeautyManager.setBeautyStyle(TRTCCloudDef.TRTC_BEAUTY_STYLE_SMOOTH);
        txBeautyManager.setBeautyLevel(val);
        break;
      case "nature":
        txBeautyManager.setBeautyStyle(TRTCCloudDef.TRTC_BEAUTY_STYLE_NATURE);
        txBeautyManager.setBeautyLevel(val);
        break;
      case "pitu":
        txBeautyManager.setBeautyStyle(TRTCCloudDef.TRTC_BEAUTY_STYLE_PITU);
        txBeautyManager.setBeautyLevel(val);
        break;
      case "whitening":
        txBeautyManager.setWhitenessLevel(val);
        break;
      case "ruddy":
        txBeautyManager.setRuddyLevel(val);
        break;
      case "setEyeScaleLevel":
        txBeautyManager.setEyeScaleLevel(value);
        break;
      case "setFaceSlimLevel":
        txBeautyManager.setFaceSlimLevel(value);
        break;
      case "setFaceVLevel":
        txBeautyManager.setFaceVLevel(value);
        break;
      case "setChinLevel":
        txBeautyManager.setChinLevel(value);
        break;
      case "setLipsThicknessLevel":
        txBeautyManager.setLipsThicknessLevel(value);
        break;
      case "setFaceShortLevel":
        txBeautyManager.setFaceShortLevel(value);
        break;
      case "setNoseSlimLevel":
        txBeautyManager.setNoseSlimLevel(value);
        break;
      case "setToothWhitenLevel":
        txBeautyManager.setToothWhitenLevel(value);
        break;
      case "setWrinkleRemoveLevel":
        txBeautyManager.setWrinkleRemoveLevel(value);
        break;
      case "setPounchRemoveLevel":
        txBeautyManager.setPounchRemoveLevel(value);
        break;
      case "setSmileLinesRemoveLevel":
        txBeautyManager.setSmileLinesRemoveLevel(value);
        break;
      case "setForeheadLevel":
        txBeautyManager.setForeheadLevel(value);
        break;
      case "setEyeDistanceLevel":
        txBeautyManager.setEyeDistanceLevel(value);
        break;
      case "setEyeAngleLevel":
        txBeautyManager.setEyeAngleLevel(value);
        break;
      case "setNosePositionLevel":
        txBeautyManager.setNosePositionLevel(value);
        break;
      case "setMouthShapeLevel":
        txBeautyManager.setMouthShapeLevel(value);
        break;
      case "setNoseWingLevel":
        txBeautyManager.setNoseWingLevel(value);
        break;
      case "setFaceBeautyLevel":
        txBeautyManager.setFaceBeautyLevel(value);
        break;
    }
  }

  static List<SettingItem> effectList = Platform.isAndroid
      ? [
          SettingItem('setMotionTmpl-nil', '无动效', 'setMotionTmpl'),
          SettingItem('video_boom', 'Boom', 'setMotionTmpl')
            ..setParams(
                "http://dldir1.qq.com/hudongzhibo/AISpecial/Android/170/video_boomAndroid.zip"),
          SettingItem('video_cherries', '美妆', 'setMotionTmpl')
            ..setParams(
                "http://dldir1.qq.com/hudongzhibo/AISpecial/Android/video_cherriesAndroid.zip"),
          SettingItem('video_pikachu', '皮卡丘', 'setMotionTmpl')
            ..setParams(
                "https://dldir1.qq.com/hudongzhibo/AISpecial/Android/181/video_pikachu.zip"),
          SettingItem('video_xiaofu', 'AI抠背', 'setMotionTmpl')
            ..setParams(
                "https://dldir1.qq.com/hudongzhibo/AISpecial/Android/170/video_xiaofuAndroid.zip"),
          SettingItem('MotionMute_true', '动效静音', 'setMotionMute'),
          SettingItem('MotionMute_false', '动效音乐', 'setMotionMute'),
          SettingItem('setGreenScreenFile', '绿幕', 'setGreenScreenFile')
            ..setParams("Resources/goodluck.mp4"),
          SettingItem('setGreenScreenFile-nil', '去绿幕', 'setGreenScreenFile')
            ..setParams(null),
        ]
      : [
          SettingItem('setMotionTmpl-nil', '无动效', 'setMotionTmpl'),
          SettingItem('video_boom', 'Boom', 'setMotionTmpl')
            ..setParams(
                "https://dldir1.qq.com/hudongzhibo/AISpecial/ios/160/video_boom.zip"),
          SettingItem('video_pikachu', '皮卡丘', 'setMotionTmpl')
            ..setParams(
                "https://dldir1.qq.com/hudongzhibo/AISpecial/Android/181/video_pikachu.zip"),
          SettingItem('video_qingchunzannan_iOS', '原宿复古', 'setMotionTmpl')
            ..setParams(
                "https://res.tu.qq.com/materials/video_qingchunzannan_iOS.zip"),
          SettingItem('video_xiaofu', 'AI抠背', 'setMotionTmpl')
            ..setParams(
                "https://dldir1.qq.com/hudongzhibo/AISpecial/ios/160/video_xiaofu.zip"),
          SettingItem('MotionMute_true', '动效静音', 'setMotionMute')
            ..setParams(true),
          SettingItem('MotionMute_false', '动效音乐', 'setMotionMute')
            ..setParams(false),
          SettingItem('setGreenScreenFile', '绿幕', 'setGreenScreenFile')
            ..setParams("Resources/goodluck.mp4"),
          SettingItem('setGreenScreenFile-nil', '去绿幕', 'setGreenScreenFile')
            ..setParams(null),
        ];

  static Future<void> doSpecialEffect(
      TXBeautyManager txBeautyManager, String skey) async {
    SettingItem item = effectList.firstWhere((element) => element.key == skey);
    String key = item.key, funcName = item.funcName;
    var params = item.getParams();
    switch (funcName) {
      case "setMotionTmpl":
        {
          try {
            if (key == "setMotionTmpl-nil") {
              EasyLoading.show(
                  status: '切换中...',
                  maskType: EasyLoadingMaskType.black,
                  dismissOnTap: false);
              await txBeautyManager.setMotionTmpl(null);
            } else {
              bool isExitDir = await TXUtils.isMotionDirExit(key);
              EasyLoading.show(
                  status: isExitDir ? "loading..." : '下载资源文件中...',
                  maskType: EasyLoadingMaskType.black,
                  dismissOnTap: false);
              String fullPath = isExitDir
                  ? await TXUtils.getMotionDirByKey(key)
                  : await TXUtils.downloadMotionZipFile(params);
              txBeautyManager.setMotionTmpl(fullPath);
              if (Platform.isAndroid) {
                Future.delayed(const Duration(milliseconds: 1500), () {
                  //延时执行的代码,为啥会这样呢。这里是为了解决特效在杀进程后重启特效不生效的问题，具体原因不明白
                  txBeautyManager.setToothWhitenLevel(6.0);
                });
              }
            }
          } catch (e) {
            EasyLoading.showError(e.toString());
          } finally {
            EasyLoading.dismiss();
          }
        }
        break;
      case "setGreenScreenFile":
        txBeautyManager.setGreenScreenFile(params);
        break;
      case "setMotionMute":
        txBeautyManager.setMotionMute(key == "MotionMute_false" ? false : true);
        break;
    }
  }
}
