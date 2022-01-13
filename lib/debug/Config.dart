class Config {
  // 在工程配置完之后，您需集成美颜特效 License 才能开始使用功能。在调用 SDK 的相关接口前调用如下所示方法进行 License 的设置。
  // 配置 美颜License，licenceUrl必须使用https
  // licenceUrl 下载url 和 key。授权 License 请根据 美颜特效 SDK [购买流程](https://cloud.tencent.com/document/product/647/32689#Enterprise) 获取。
  static String licenceUrl = '';

  /// 美颜特效licenseKey
  static String licenseKey = 'PLACEHOLDER';

  static int sdkAppId = 0;
  static String secretKey = '';
}
