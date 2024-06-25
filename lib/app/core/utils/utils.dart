// ignore_for_file: no-magic-number, long-method

//define regex here
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:cross_file/cross_file.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ebusiness/app/core/utils/date_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_style.dart';
import '../values/app_colors.dart';
import '../values/enums.dart';
import '../values/image_assets.dart';
import 'math_utils.dart';
import 'package:image/image.dart' as img;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:date_format/date_format.dart';
import 'package:ebusiness/app/core/utils/date_helpers.dart';

// at least 6 characters
RegExp regPasswordLengthExp = RegExp(
  r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[_@$!%*?&])[A-Za-z\d_@$!%*?&]{8,}$",
  caseSensitive: true,
  multiLine: false,
);

RegExp regPasswordLv2LengthExp = RegExp(
  r"^.{4,6}$",
  caseSensitive: false,
  multiLine: false,
);

// Vietnam numberphone format
RegExp regPhoneInvalidFormat = RegExp(
  r'(0[2|3|5|7|8|9])+([0-9]{8})\b$',
);

RegExp regEmailFormat = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

class Utils {

  static bool isVietnamesePhoneNumber(String number) {
    RegExp regex = RegExp(r"(03|05|07|08|09|01[2689])+\d{8}\b");
    return regex.hasMatch(number);
  }

  static RichText getRequiredLabel(String fieldName) {
    return RichText(
      text: TextSpan(
        style: AppStyles.txt12Bold.copyWith(
          color: const Color(0xff7B8B9D),
        ),
        text: fieldName,
        children: const [
          TextSpan(text: ' *', style: TextStyle(color: Colors.red))
        ],
      ),
    );
  }

  static bool checkRegex(RegExp regex, String inputString) =>
      regex.hasMatch(inputString);

  static void showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  static Future<void> copyToClipboard(String content) async {
    await Clipboard.setData(ClipboardData(text: content));
    Fluttertoast.showToast(msg: "Đã copy thành công");
  }

  static String getTimeTextFromMillisecondsSinceEpoch(int? milis) {
    var date = milis != null
        ? DateTime.fromMillisecondsSinceEpoch(milis)
        : DateTime.now();
    if (date.isToday()) {
      return DateFormat('HH:mm a', "vi").format(date);
    } else if (date.isYesterday()) {
      return "Hôm qua " + DateFormat('HH:mm a', "vi").format(date);
    } else {
      return DateFormat.yMd("vi").add_jm().format(date);
    }
  }

  static String getTimeFromMillisecondsSinceEpoch(int? milis) {
    var date = milis != null
        ? DateTime.fromMillisecondsSinceEpoch(milis)
        : DateTime.now();
    return DateFormat('HH:mm', "vi").format(date);
  }

  static String getDateFromMillisecondsSinceEpoch(int? milis) {
    var date = milis != null
        ? DateTime.fromMillisecondsSinceEpoch(milis)
        : DateTime.now();
    if (date.isToday()) {
      return "Hôm nay";
    } else if (date.isYesterday()) {
      return "Hôm qua";
    } else {
      return DateFormat('dd/MM/yyyy', 'vi_VN').format(date);
    }
  }


  static String getIconPathTranstype({String? transtype}) {
    switch (transtype) {
      case "REFUND":
        return ImageAssets.icDepositGStar;
      case "TRANSFER":
      case "GIVEGSTAR":
      case "TRANSFER_MONEY":
        return ImageAssets.icTransferMoneyGstar;
      case "EXCHANGE":
        return ImageAssets.iconTransfer;
      case "TOPUP":
        return ImageAssets.iconNaptiendienthoai;
      case "TOPUP_DATA":
        return ImageAssets.iconNaptiendata;
      case 'PIN_CODE':
        return ImageAssets.iconCardPhone;
      case "PIN_DATA":
        return ImageAssets.iconNaptiendata;
      case "PIN_GATE":
        return ImageAssets.iconCardGame;
      case "PIN_GAME":
        return ImageAssets.iconCardGame;
      case "FSTAR":
      case "BUYGSTAR":
        return ImageAssets.iconLogo;
      // return ImageAssets.icFstarHistory;
      case "RECEIVE_GIVEGSTAR":
      case "RECEIVE_MONEY":
        return ImageAssets.icGiveGstar;
      case "GSTAR":
      case "DEPOSIT":
        return ImageAssets.icExchangeGstar;
      default:
        return ImageAssets.iconLogo;
    }
  }

  static bool isCategory(String? serviceCode) {
    switch (serviceCode) {
      case "EVN_BILL":
      case "INS_BILL":
      case "WATER_BILL":
      case "INTERNET_BILL":
      case "TELEPHONE_BILL":
      case "MOBILE_BILL":
      case "TICKET_BILL":
      case "TV_BILL":
      case "FINANCE_BILL":
        return true;
      default:
        return false;
    }
  }

  static int daysDifferenceBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);

    return (to.difference(from).inHours / 24).round();
  }


  static Future<String> base64EncodeFromFile(XFile file) async {
    final base64Bytes = await file.readAsBytes();

    return base64Encode(base64Bytes);
  }


  static Future<void> launchBrowserUrl(String? url) async {
    if (url == null) return;
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchMakeACall(String? phoneNumber) async {
    if (phoneNumber == null) return;
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static bool stringIsUrl(String? url) {
    if (url != null && url.isNotEmpty) {
      return Uri.tryParse(url)?.isAbsolute ?? false;
    }

    return false;
  }

  static Rectangle<int> getCropRect({
    required int sourceWidth,
    required int sourceHeight,
    required double aspectRatio,
  }) {
    var left = 0;
    var top = 0;
    var width = sourceWidth;
    var height = sourceHeight;

    if (aspectRatio < sourceWidth / sourceHeight) {
      width = (sourceHeight * aspectRatio).toInt();
      left = (sourceWidth - width) ~/ 2;
    } else if (aspectRatio > sourceWidth / sourceHeight) {
      height = sourceWidth ~/ aspectRatio;
      top = (sourceHeight - height) ~/ 2;
    }

    return Rectangle<int>(left, top, width, height);
  }

  static XFile resizeImage({
    required XFile file,
    double? resizeWidth,
    double? resizeHeight,
    double ratio = 1,
    ImageEncodeType encodeType = ImageEncodeType.PNG,
    bool useCropSize = false,
  }) {
    final _decodeImage = img.decodeImage(
      File(file.path).readAsBytesSync(),
    ) as img.Image;

    final _rect = getCropRect(
      sourceWidth: _decodeImage.width.round(),
      sourceHeight: _decodeImage.height.round(),
      aspectRatio: ratio,
    );

    final _crop = img.copyCrop(
      _decodeImage,
      x: _rect.left,
      y: _rect.top,
      width: _rect.width,
      height: _rect.height,
    );

    final _resize = img.copyResize(
      _crop,
      width: useCropSize ? _crop.width : resizeWidth?.toInt(),
      height: useCropSize ? _crop.height : resizeHeight?.toInt(),
    );

    late final Uint8List _u;

    if (encodeType == ImageEncodeType.JPG) {
      _u = img.encodeJpg(_resize, quality: 80);
    } else {
      _u = img.encodePng(_resize);
    }

    final _newFile = File(file.path)..writeAsBytesSync(_u);

    return XFile(
      _newFile.path,
      bytes: _newFile.readAsBytesSync(),
      name: file.name,
    );
  }

  static int getDiffDateTime(String startDate) {
    final startDateTime =
        DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(startDate, true).toLocal();
    final diffDuration = startDateTime.difference(DateTime.now());

    return diffDuration.inSeconds;
  }

  static LinearGradient getGradient(List<String> gradientVotingButton) {
    if (gradientVotingButton.isEmpty) {
      return const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
      );
    }
    if (gradientVotingButton.length == 1) {
      return LinearGradient(colors: [
        AppColors.fromHex(gradientVotingButton.first),
        AppColors.fromHex(gradientVotingButton.first)
      ]);
    }

    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: gradientVotingButton.map((e) => AppColors.fromHex(e)).toList(),
    );
  }

  static Future<XFile> createXFileFromUint8List(
      Uint8List uint8List, String fileName) async {
    final Directory tempDir = await getTemporaryDirectory();
    final File tempFile = File('${tempDir.path}/$fileName');
    await tempFile.writeAsBytes(uint8List);
    // final tempFileLength = await tempFile.length();
    final xFile = XFile(tempFile.path);
    // final xfileLenght = await xFile.length();

    return xFile;
  }

  static bool isOldIdCardType(String? docId) {
    return docId?.length == 9;
  }

  static Future<void> checkCameraPermission({
    required Function() onPermissionGranted,
  }) async {
    bool isCameraGranted = await Permission.camera.request().isGranted;
    if (!isCameraGranted) {
      isCameraGranted =
          await Permission.camera.request() == PermissionStatus.granted;
      if (!isCameraGranted) {
        openAppSettings();
        return;
      }
    } else {
      onPermissionGranted();
    }
  }

  static String hideBankNumber(String fullAccountNumber) {
    String lastTwoDigits =
        fullAccountNumber.substring(fullAccountNumber.length - 2);

    return lastTwoDigits;
  }


}

extension FormatterTimeOfDay on TimeOfDay {
  DateTime toDateTime() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, hour, minute);
  }
}

String readGroup(group) {
  var readDigit = [
    " Không",
    " Một",
    " Hai",
    " Ba",
    " Bốn",
    " Năm",
    " Sáu",
    " Bảy",
    " Tám",
    " Chín"
  ];
  var temp = "";
  if (group == "000") return "";
  temp = readDigit[int.parse(group.substring(0, 1))] + " Trăm";
  if (group.substring(1, 2) == "0") {
    if (group.substring(2, 3) == "0") {
      return temp;
    } else {
      temp += " Lẻ" + readDigit[int.parse(group.substring(2, 3))];

      return temp;
    }
  } else {
    temp += readDigit[int.parse(group.substring(1, 2))] + " Mươi";
  }
  if (group.substring(2, 3) == "5") {
    temp += " Lăm";
  } else if (group.substring(2, 3) != "0") {
    temp += readDigit[int.parse(group.substring(2, 3))];
  }

  return temp;
}

String readMoney(dynamic num) {
  if ((num == null) || (num == "")) return "";
  var temp = "";
  while (num.length < 18) {
    num = "0" + num;
  }
  var g1 = num.substring(0, 3);
  var g2 = num.substring(3, 6);
  var g3 = num.substring(6, 9);
  var g4 = num.substring(9, 12);
  var g5 = num.substring(12, 15);
  var g6 = num.substring(15, 18);
  if (g1 != "000") {
    temp = readGroup(g1);
    temp += " Triệu";
  }
  if (g2 != "000") {
    temp += readGroup(g2);
    temp += " Nghìn";
  }
  if (g3 != "000") {
    temp += readGroup(g3);
    temp += " Tỷ";
  } else if ("" != temp) {
    temp += " Tỷ";
  }
  if (g4 != "000") {
    temp += readGroup(g4);
    temp += " Triệu";
  }
  if (g5 != "000") {
    temp += readGroup(g5);
    temp += " Nghìn";
  }
  temp = temp + readGroup(g6);
  temp = temp.replaceAll("Một Mươi", "Mười");
  temp = temp.trim();
  temp = temp.replaceAll("Không Trăm", "");
  temp = temp.trim();
  temp = temp.replaceAll("Mười Không", "Mười");
  temp = temp.trim();
  temp = temp.replaceAll("Mươi Không", "Mươi");
  temp = temp.trim();
  if (temp.indexOf("Lẻ") == 0) temp = temp.substring(2);
  temp = temp.trim();
  temp = temp.replaceAll("Mươi Một", "Mươi Mốt");
  temp = temp.trim();
  var result = temp.isNotEmpty
      ? temp.substring(0, 1).toUpperCase() + temp.substring(1).toLowerCase()
      : '';

  final res = result == "" ? "Không" : result;

  return res.replaceAll(RegExp(r'\s\s'), r' ');
}

extension StringExtension on String {
  String useCorrectEllipsis() {
    return replaceAll('', '\u200B');
  }
}

extension ScrollControllerExtension on ScrollController {
  void animateToTop() {
    if (hasClients) {
      animateTo(
        0,
        duration: const Duration(milliseconds: 350),
        curve: Curves.ease,
      );
    }
  }
}
