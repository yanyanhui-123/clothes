import 'package:encrypt/encrypt.dart';

// AES
const aesKey = 'aH5aH5bG0dC6aA3oN0cK4aU5jU6aK2lN';
const aesIV = 'hK6eB4aE1aF3gH5q';

/// 加密类
class EncryptUtil {
  static final EncryptUtil _instance = EncryptUtil._internal();
  factory EncryptUtil() => _instance;
  EncryptUtil._internal() {
    encrypter = Encrypter(AES(
      key,
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
  }

  final key = Key.fromUtf8(aesKey);
  final iv = IV.fromUtf8(aesIV);
  late Encrypter encrypter;

  /// aes加密
  String aesEncode(String content) {
    final encrypted = encrypter.encrypt(content, iv: iv);
    return encrypted.base64;
  }
}
