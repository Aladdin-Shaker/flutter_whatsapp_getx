import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:whats_app_clone/app/config/constants.dart';

class MyDeviceInfo {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  // get device info

  Future<String?> initPlatformState() async {
    String? deviceData;

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        // print('Android deviceData => $deviceData ');
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        // print('Ios deviceData => $deviceData ');
      }
    } on PlatformException {
      deviceData = 'Error: Failed to get platform version.';
    }
    deviceDataConstant = deviceData;
    return deviceData;

    // if (!mounted) return;
  }

  String _readAndroidBuildData(AndroidDeviceInfo build) {
    return build.model;
    // return <String, dynamic>{
    // 'version.securityPatch': build.version.securityPatch,
    // 'version.sdkInt': build.version.sdkInt,
    // 'version.release': build.version.release,
    // 'version.previewSdkInt': build.version.previewSdkInt,
    // 'version.incremental': build.version.incremental,
    // 'version.codename': build.version.codename,
    // 'version.baseOS': build.version.baseOS,
    // 'board': build.board,
    // 'bootloader': build.bootloader,
    // 'brand': build.brand,
    // 'device': build.device,
    // 'display': build.display,
    // 'fingerprint': build.fingerprint,
    // 'hardware': build.hardware,
    // 'host': build.host,
    // 'id': build.id,
    // 'manufacturer': build.manufacturer,
    // 'model': build.model,
    // 'product': build.product,
    // 'supported32BitAbis': build.supported32BitAbis,
    // 'supported64BitAbis': build.supported64BitAbis,
    // 'supportedAbis': build.supportedAbis,
    // 'tags': build.tags,
    // 'type': build.type,
    // 'isPhysicalDevice': build.isPhysicalDevice,
    // 'androidId': build.androidId,
    // 'systemFeatures': build.systemFeatures,
    // };
  }

  String _readIosDeviceInfo(IosDeviceInfo data) {
    return data.model;
    // return <String, dynamic>{
    // 'name': data.name,
    // 'systemName': data.systemName,
    // 'systemVersion': data.systemVersion,
    // 'model': data.model,
    // 'localizedModel': data.localizedModel,
    // 'identifierForVendor': data.identifierForVendor,
    // 'isPhysicalDevice': data.isPhysicalDevice,
    // 'utsname.sysname:': data.utsname.sysname,
    // 'utsname.nodename:': data.utsname.nodename,
    // 'utsname.release:': data.utsname.release,
    // 'utsname.version:': data.utsname.version,
    // 'utsname.machine:': data.utsname.machine,
    // };
  }
}
