import 'package:crystalonbritsols_task/services/storage_helper.dart';
import 'package:device_info_plus/device_info_plus.dart';

class GlobalCahce {
  late AndroidDeviceInfo androidInfo;
  late IosDeviceInfo iosDeviceInfo;
  String userId = "";
  late String deviceId;
  late String platform;
  String token = "";

  setGlobalCache(
    String accessToken,
  ) async {
    await StorageHelper.mInstance
        .setString(StorageHelper.storageAccessToken, accessToken);
  }
}
