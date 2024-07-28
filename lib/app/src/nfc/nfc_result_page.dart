import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izota_ekyc/izota_ekyc.dart';
import '../../logic/cubit/auth_cubit.dart';


class NFCResultPage extends StatelessWidget {
  const NFCResultPage({
    super.key,
    required this.cccdnfcModel,
    required this.faceVerificationResponse,
    required this.livenessFileModel,
    required this.isVeririedRAR,
  });

  final CCCDNFCModel cccdnfcModel;
  final FaceVerificationResponse faceVerificationResponse;
  final LivenessFileModel livenessFileModel;
  final bool isVeririedRAR;


  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

    print('cccdnfcModel.toJson(): ${cccdnfcModel.toJson()}');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Kết quả quét NFC",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.memory(
                        base64.decode(
                          cccdnfcModel.photoBase64
                              .replaceAll(RegExp(r'\s+'), ''),
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Image.file(
                        File(livenessFileModel.faceFile),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ...cccdnfcModel
                  .toJson()
                  .entries
                  .map(
                    (e) => ["dsCert", "photoBase64","fatherName", "motherName","oldIdentify"].contains(e.key)
                        ? const SizedBox()
                        : _resultItem(
                            key: e.key,
                            value: e.value,
                          ),
                  ).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: ElevatedButton(
          onPressed: () async {
            // context.read<AuthCubit>().updateInfo(
            //   cccdnfcModel.citizenPid,
            //   cccdnfcModel.fullName,
            //   cccdnfcModel.birthDate,
            //   cccdnfcModel.gender,
            //   cccdnfcModel.nationality,
            //   cccdnfcModel.ethnic,
            //   cccdnfcModel.religion,
            //   cccdnfcModel.homeTown,
            //   cccdnfcModel.regPlaceAddress,
            //   cccdnfcModel.identifyCharacteristics,
            //   cccdnfcModel.dateProvide,
            //   cccdnfcModel.outOfDate,
            //   cccdnfcModel.photoBase64,
            //
            // );



            String uid = _auth.currentUser!.uid;

            await _fireStore.collection('User').doc(uid).update(
                {
                  "citizenPid" :cccdnfcModel.citizenPid ,
                  "fullName": cccdnfcModel.fullName,
                  "birthDate": cccdnfcModel.birthDate,
                  "gender": cccdnfcModel.gender,
                  "nationality": cccdnfcModel.nationality,
                  "ethnic": cccdnfcModel.ethnic,
                  "religion":cccdnfcModel.religion,
                  "homeTown": cccdnfcModel.homeTown,
                  "regPlaceAddress": cccdnfcModel.regPlaceAddress,
                  "identifyCharacteristics": cccdnfcModel.identifyCharacteristics,
                  "dateProvide": cccdnfcModel.dateProvide,
                  "outOfDate": cccdnfcModel.outOfDate,
                  "photoBase64": cccdnfcModel.photoBase64,
                  "verify_account" : "true"
                }
            );

            Navigator.of(context).popUntil(
              (route) => route.settings.name == '/',
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            "Xác thực thông tin",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Padding _resultItem({
    required String key,
    required String value,
    Color valueTextColor = Colors.black,
    bool isBoldText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            getTitleKey(key),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Text(
            value.toString().isEmpty ? "Không có dữ liệu" : value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 16,
              color: valueTextColor,
              fontWeight: isBoldText ? FontWeight.bold : FontWeight.normal,
            ),
          )),
        ],
      ),
    );
  }

  String getTitleKey(String key) {
    switch (key) {
      case "citizenPid":
        return "Số CCCD";
      case "fullName":
        return "Họ và tên";
      case "birthDate":
        return "Ngày sinh";
      case "gender":
        return "Giới tính";
      case "nationality":
        return "Quốc tịch";
      case "ethnic":
        return "Dân tộc";
      case "religion":
        return "Tôn giáo";
      case "homeTown":
        return "Quê quán";
      case "regPlaceAddress":
        return "Địa chỉ";
      case "identifyCharacteristics":
        return "Đặc điểm nhận dạng";
      case "dateProvide":
        return "Ngày cấp";
      case "outOfDate":
        return "Ngày hết hạn";
      case "fatherName":
        return "Tên bố";
      case "motherName":
        return "Tên mẹ";
      case "oldIdentify":
        return "Số CMT cũ";
      case "verifyResult":
        return "Kết quả kiểm tra";
      case "faceAntiSpoofStatus":
        return "Kết quả kiểm tra giả mạo";
      case "isVeririedRAR":
        return "Xác thực C06";
      case 'warningMask':
        return 'Cảnh báo đeo khẩu trang';
      default:
        return "";
    }
  }
}
