import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

/// 授权返回
class PrivilegeStatus {
  final bool result;
  final String message;
  final bool? camera;
  final bool? photos;
  final bool? storage;
  final bool? microphone;

  PrivilegeStatus({
    required this.result,
    required this.message,
    this.camera,
    this.photos,
    this.storage,
    this.microphone,
  });

  String getPermissionText() {
    String title = '允许访问';
    if (camera == false) {
      title = '$title,摄像头';
    }
    if (photos == false) {
      title = '$title,相册';
    }
    if (storage == false) {
      title = "$title,存储空间";
    }
    if (microphone == false) {
      title = "$title,麦克风";
    }
    title = title.replaceAll("允许访问,", "允许访问");
    return title;
  }
}

/// 动态授权
class Privilege {
  /// 是否有相册权限
  static Future<PrivilegeStatus> checkPhotos() async {
    var photosStatus = await Permission.photos.status;
    bool photoPrivilege = photosStatus == PermissionStatus.granted ||
        photosStatus == PermissionStatus.limited;
    bool storagePrivilege = true;
    if (GetPlatform.isAndroid) {
      int version = await getAndroidVersion();
      if (version >= 13) {
        storagePrivilege = true;
      } else {
        var storageStatuses = await Permission.storage.status;
        storagePrivilege = storageStatuses == PermissionStatus.granted;
        photoPrivilege = true;
      }
    }
    bool value = photoPrivilege && storagePrivilege;
    return PrivilegeStatus(
        result: value,
        message: value ? '好的' : '请打开图片库访问',
        photos: photoPrivilege,
        storage: storagePrivilege);
  }

  /// 是否有相机权限
  static Future<PrivilegeStatus> checkCamera() async {
    bool cameraPrivilege =
        await Permission.camera.status == PermissionStatus.granted;
    bool storagePrivilege = true;
    if (GetPlatform.isAndroid) {
      int version = await getAndroidVersion();
      if (version < 13) {
        storagePrivilege =
            await Permission.storage.status == PermissionStatus.granted;
      }
    }
    bool value = cameraPrivilege && storagePrivilege;
    return PrivilegeStatus(
        result: value,
        message: value ? '好的' : '请打开摄像机',
        camera: cameraPrivilege,
        storage: storagePrivilege);
  }

  /// 是否有麦克风权限
  static Future<PrivilegeStatus> checkMicrophone() async {
    bool microphonePrivilege =
        await Permission.microphone.status == PermissionStatus.granted;
    bool storagePrivilege = true;
    if (GetPlatform.isAndroid) {
      int version = await getAndroidVersion();
      if (version < 13) {
        storagePrivilege =
            await Permission.storage.status == PermissionStatus.granted;
      }
    }
    bool value = microphonePrivilege && storagePrivilege;
    return PrivilegeStatus(
        result: value,
        message: value ? '好的' : '请打开麦克风',
        microphone: microphonePrivilege,
        storage: storagePrivilege);
  }

  ///获取相册权限
  static requestPhoto(Function successCallback,
      {String desc = "用来扫码识别蓝牙", Function? failCallback}) async {
    //1判断权限
    var checkResult = await checkPhotos();
    if (!checkResult.result) {
      //兼容ios审核处理
      if (GetPlatform.isIOS) {
        var photosStatus = await Permission.photos.status;
        if (photosStatus == PermissionStatus.permanentlyDenied) {
          showSimpleDialog(checkResult.getPermissionText(),
              '应用权限说明:$desc点击“不允许”将无法使用扫码识别蓝牙，点击“设置"将前往系统设置页面开启。');
          return;
        }
      }
      //2获取权限
      showPermissionDialog(
          title: "${checkResult.getPermissionText()},$desc",
          onConfirm: () async {
            bool needCheckStoragePermission = true;
            if (GetPlatform.isAndroid) {
              int version = await getAndroidVersion();
              if (version >= 13) {
                needCheckStoragePermission = false;
              }
            } else {
              needCheckStoragePermission = false;
            }
            PermissionStatus photos = await Permission.photos.request();
            PermissionStatus? storage = needCheckStoragePermission
                ? await Permission.storage.request()
                : null;

            bool storagePermission = true;
            if (storage == null) {
              storagePermission = true;
            } else if (storage == PermissionStatus.granted) {
              storagePermission = true;
            } else {
              storagePermission = false;
            }
            bool photosPermission = photos == PermissionStatus.granted ||
                photos == PermissionStatus.limited;
            if (GetPlatform.isAndroid) {
              int version = await getAndroidVersion();
              if (version < 13) {
                photosPermission = true;
              }
            }
            if (photosPermission && storagePermission) {
              successCallback();
            } else {
              //拒绝
              if (GetPlatform.isAndroid) {
                showSimpleDialog(
                    checkResult.getPermissionText(), "应用权限说明:$desc");
              } else {
                if (failCallback != null) {
                  failCallback();
                }
              }
            }
          });
    } else {
      successCallback();
    }
  }

  ///获取相机权限
  static requestCamera(Function successCallback,
      {String desc = "用来扫码识别蓝牙", Function? failCallback}) async {
    //1判断权限
    var checkResult = await checkCamera();
    if (!checkResult.result) {
      //兼容ios审核处理
      if (GetPlatform.isIOS) {
        var cameraStatus = await Permission.camera.status;
        if (cameraStatus == PermissionStatus.permanentlyDenied) {
          showSimpleDialog(checkResult.getPermissionText(),
              '应用权限说明:$desc点击“不允许”将无法使用扫码识别蓝牙，点击“设置"将前往系统设置页面开启。');
          return;
        }
      }
      //2获取权限
      showPermissionDialog(
          title: "${checkResult.getPermissionText()},$desc",
          onConfirm: () async {
            bool needCheckStoragePermission = true;
            if (GetPlatform.isAndroid) {
              int version = await getAndroidVersion();
              if (version >= 13) {
                needCheckStoragePermission = false;
              }
            } else {
              needCheckStoragePermission = false;
            }
            PermissionStatus camera = await Permission.camera.request();
            PermissionStatus? storage = needCheckStoragePermission
                ? await Permission.storage.request()
                : null;

            bool storagePermission = true;
            if (storage == null) {
              storagePermission = true;
            } else if (storage == PermissionStatus.granted) {
              storagePermission = true;
            } else {
              storagePermission = false;
            }
            if (camera == PermissionStatus.granted && storagePermission) {
              successCallback();
            } else {
              //拒绝
              if (GetPlatform.isAndroid) {
                showSimpleDialog(
                    checkResult.getPermissionText(), "应用权限说明:$desc");
              } else {
                if (failCallback != null) {
                  failCallback();
                }
              }
            }
          });
    } else {
      successCallback();
    }
  }

  ///获取麦克风权限
  static requestMicrophone(Function successCallback,
      {String desc = "用来录音功能或上载录音云存储!", Function? failCallback}) async {
    //1判断权限
    var checkResult = await checkMicrophone();
    if (!checkResult.result) {
      //兼容ios审核处理
      if (GetPlatform.isIOS) {
        var microphoneStatus = await Permission.microphone.status;
        if (microphoneStatus == PermissionStatus.permanentlyDenied) {
          showSimpleDialog(checkResult.getPermissionText(),
              '应用权限说明:$desc点击“不允许”将无法使用录音功能或上载录音云存储，点击“设置"将前往系统设置页面开启。');
          return;
        }
      }
      //2获取权限
      showPermissionDialog(
          title: "${checkResult.getPermissionText()},$desc",
          onConfirm: () async {
            bool needCheckStoragePermission = true;
            if (GetPlatform.isAndroid) {
              int version = await getAndroidVersion();
              if (version >= 13) {
                needCheckStoragePermission = false;
              }
            } else {
              needCheckStoragePermission = false;
            }
            PermissionStatus microphone = await Permission.microphone.request();
            PermissionStatus? storage = needCheckStoragePermission
                ? await Permission.storage.request()
                : null;

            bool storagePermission = true;
            if (storage == null) {
              storagePermission = true;
            } else if (storage == PermissionStatus.granted) {
              storagePermission = true;
            } else {
              storagePermission = false;
            }
            if (microphone == PermissionStatus.granted && storagePermission) {
              successCallback();
            } else {
              //拒绝
              if (GetPlatform.isAndroid) {
                showSimpleDialog(
                    checkResult.getPermissionText(), "应用权限说明:$desc");
              } else {
                if (failCallback != null) {
                  failCallback();
                }
              }
            }
          });
    } else {
      successCallback();
    }
  }

  /// 打开系统设置
  static Future<bool> openSettings() async {
    return await openAppSettings();
  }

  static Future<int> getAndroidVersion() async {
    // 获取设备信息
    AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
    return int.tryParse(androidInfo.version.release) ?? 0;
  }

  static void showPermissionDialog(
      {String title = "", String content = "", Function? onConfirm}) {
    String confirmText = "开始请求授权";
    if (GetPlatform.isIOS) {
      confirmText = "下一步";
    }
    // if (!(Get.isDialogOpen ?? false)) {
    Get.dialog(
        AlertDialog(
          content: SizedBox(
            height: 120.h,
            width: 260.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GetPlatform.isIOS
                        ? const SizedBox()
                        : GestureDetector(
                      child: const Text(
                        "取消",
                        style:
                        TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      onTap: () => {Get.back()},
                    ),
                    SizedBox(width: 30.w),
                    GestureDetector(
                      child: Text(
                        confirmText,
                        style:
                        const TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      onTap: () {
                        Get.back();
                        if (onConfirm != null) {
                          onConfirm();
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        barrierDismissible: !GetPlatform.isIOS);
    // }
  }

  static void showSimpleDialog(String permission, String desc) {
    // if (Get.isDialogOpen == false) {
    Get.dialog(AlertDialog(
      content: SizedBox(
        height: 160.h,
        width: 260.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "应用没有$permission权限，请前往设置开启。",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: desc,
                  style: const TextStyle(
                    color: Colors.black,
                  )),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Text(
                    "不允许",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => {Get.back()},
                ),
                SizedBox(width: 20.w),
                GestureDetector(
                  child: const Text(
                    "设置",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => {Privilege.openSettings()},
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
// }
}
