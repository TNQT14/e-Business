import 'package:encrypt/encrypt.dart';
abstract class EncryptUtils {
  static String get encrypterKey =>'';
  static Key get key => Key.fromUtf8(encrypterKey);
  static IV get iv => IV.fromUtf8(encrypterKey);

  static String encryptAES(String input) {
    final Encrypter encrypter = Encrypter(AES(key));

    return encrypter.encrypt(input, iv: iv).base64;
  }

  static String decryptAES(String base64) {
    final Encrypter encrypter = Encrypter(AES(key));

    return encrypter.decrypt(Encrypted.from64(base64), iv: iv);
  }

  static String encryptFernet(String input) {
    final Encrypter encrypter = Encrypter(Fernet(key));

    return encrypter.encrypt(input, iv: iv).base64;
  }

  static String decryptFernet(String base64) {
    final Encrypter encrypter = Encrypter(Fernet(key));

    return encrypter.decrypt(Encrypted.from64(base64), iv: iv);
  }
}
