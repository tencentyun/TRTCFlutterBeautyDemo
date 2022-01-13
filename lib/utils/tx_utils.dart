import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive.dart';

class TXUtils {
  static Future<bool> isMotionDirExit(String key) async {
    Directory dir = Directory(await getMotionDirByKey(key));
    return dir.exists();
  }

  static Future<String> getMotionDirByKey(String key) async {
    final documentsDir = await getApplicationDocumentsDirectory();
    String documentsDirPath = documentsDir.path;
    return "$documentsDirPath/files/$key";
  }

  /// 下载文件
  static Future<String> downloadMotionZipFile(String url) async {
    // 初始化目录
    final documentsDir = await getApplicationDocumentsDirectory();
    print('==documentsDir path=' + documentsDir.path);

    String documentsDirPath = documentsDir.path;
    String zipFileName = url.substring(url.lastIndexOf('/') + 1);
    String packagesDirPath = "$documentsDirPath/files/";
    print('==start download file url=' + url);
    String newZipPath = "$documentsDirPath/packages/download/$zipFileName"; //
    if (await File(newZipPath).exists()) {
      await File(newZipPath).delete();
    }
    Dio dio = Dio();
    await dio.download(url, newZipPath);
    print('==end download file file=' + newZipPath);
    final bytes = File(newZipPath).readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes);

    String rstr = "";
    for (final file in archive.files) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        var newFile = File(packagesDirPath + filename);
        await newFile.create(recursive: true);
        await newFile.writeAsBytes(data);
      } else {
        var newDir = Directory(packagesDirPath + filename);
        await newDir.create(recursive: true);
        if (rstr.isEmpty) {
          rstr = newDir.path;
        }
      }
    }
    if (await File(newZipPath).exists()) {
      await File(newZipPath).delete();
    }
    print('=== unzip file=' + rstr);
    return rstr;
  }
}
