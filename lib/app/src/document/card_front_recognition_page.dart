import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:izota_ekyc/card_recognition_interface.dart';
import 'package:izota_ekyc/izota_ekyc.dart';

import 'card_back_mrz_scan.dart';

class CardFrontRecognitionPage extends StatefulWidget
    implements CardRecognitionInterface {
  const CardFrontRecognitionPage({super.key});
  @override
  State<CardFrontRecognitionPage> createState() => _CardFrontRecognitionPage();
}

class _CardFrontRecognitionPage extends State<CardFrontRecognitionPage> {
  void onOcrFrontDocument() {
    EasyLoading.show();
  }

  void onOcrFrontCardError(ex, cameraController) {
    EasyLoading.dismiss();
    if (ex is AppException) {
      EasyLoading.showError(
        ex.message,
        duration: const Duration(
          milliseconds: 2500,
        ),
      );
    }
    cameraController.resumePreview();
  }

  Future<void> onOcrFrontCardSuccess(
      ocrRes, file, CardFrontRecognitionState cameraState) async {
    EasyLoading.dismiss();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MRZCameraPage(documentId: ocrRes.documentId),
      ),
    );
    cameraState.refreshCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chụp mặt trước thẻ CCCD'),
      ),
      body: CardFrontRecognition(
        onOcrFrontDocument:
            onOcrFrontDocument, //callback when user press takePicture button
        cardRecognitionInterface: widget,
        onOcrFrontCardError:
            onOcrFrontCardError, //callback when ocrCardFront Error
        onOcrFrontCardSuccess:
            onOcrFrontCardSuccess, //callback when ocrCardFront Success
        takePictureWidget: Image.asset(
          'assets/ic_round_photo_camera.png',
          width: 75,
          height: 75,
        ), // widget TakePicture
      ),
    );
  }
}
