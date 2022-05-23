import 'dart:io';

import 'package:coodoo_style_flutter_project/src/core/models/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late final Provider<DeviceInfo> deviceInfoProvider;
late final Provider<Dio> dioProvider;

Future<void> initGlobalProviders() async {
  ///
  /// Device Info
  ///
  final deviceInfoPlugin = DeviceInfoPlugin();
  late final DeviceInfo _deviceInfo;
  if (Platform.isAndroid) {
    final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    _deviceInfo = DeviceInfo(
        model: androidDeviceInfo.model,
        uuid: androidDeviceInfo.androidId,
        platform: Platform.operatingSystem);
  } else if (Platform.isIOS) {
    final iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    _deviceInfo = DeviceInfo(
        model: iosDeviceInfo.model,
        uuid: iosDeviceInfo.identifierForVendor,
        platform: Platform.operatingSystem);
  }
  deviceInfoProvider = Provider<DeviceInfo>((ref) {
    return _deviceInfo;
  });

  ///
  /// Dio Http client
  ///
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com',
      responseType: ResponseType.json,
    ),
  );
  if (kDebugMode) {
    _dio.interceptors.add(LogInterceptor(
        requestBody: false,
        responseBody: false,
        responseHeader: false,
        requestHeader: false,
        request: false));
  }
  dioProvider = Provider<Dio>((ref) {
    return _dio;
  });
}
