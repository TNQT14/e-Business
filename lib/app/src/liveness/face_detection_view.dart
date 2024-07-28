import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:izota_ekyc/facedetection_interface.dart';
import 'package:izota_ekyc/izota_ekyc.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../src/nfc/nfc_result_page.dart';
import '../..//src/utils/image_assets.dart';
import '../..//src/utils/sound_assets.dart';
import 'package:path_provider/path_provider.dart';

// ignore: must_be_immutable
class FaceRecognitionPage extends StatefulWidget {
  FaceDetectionViewController? idcardDetectionViewController;
  final CCCDNFCModel cccdnfcModel;

  FaceRecognitionPage({
    super.key,
    required this.cccdnfcModel,
  });

  @override
  State<StatefulWidget> createState() => IDCardRecognitionViewState();
}

class IDCardRecognitionViewState extends State<FaceRecognitionPage> {
  bool _recognized = false;
  var _documentImage;
  var cameraLens = 1;

  FaceDetectionViewController? idcardDetectionViewController;
  String _faceStateInstructionPath = ImageAssets.imgLivenesHead;

  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    idcardDetectionViewController?.stopCamera();
  }

  Future<void> onVerificationSuccess(
    FaceVerificationResponse faceVerificationResponse,
    LivenessFileModel livenessFileModel,
    bool isVerifiedWithRAR,
  ) async {
    EasyLoading.dismiss();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NFCResultPage(
          cccdnfcModel: widget.cccdnfcModel,
          faceVerificationResponse: faceVerificationResponse,
          livenessFileModel: livenessFileModel,
          isVeririedRAR: isVerifiedWithRAR,
        ),
      ),
    );
  }

  Future<void> onNextFaceState(FaceState faceState) async {
    switch (faceState) {
      case FaceState.FACE_STATE_STRAIGHT:
        _faceStateInstructionPath = ImageAssets.imgLivenesHead;
        break;
      case FaceState.FACE_STATE_TURN_RIGHT:
        await player.play(AssetSource(SoundAssets.soundHeadRight));
        _faceStateInstructionPath = ImageAssets.imgLivenesHeadRight;
        break;
      case FaceState.FACE_STATE_TURN_LEFT:
        await player.play(AssetSource(SoundAssets.soundHeadLeft));
        _faceStateInstructionPath = ImageAssets.imgLivenesHeadLeft;
        break;
      case FaceState.FACE_STATE_HEAD:
        await player.play(AssetSource(SoundAssets.soundStraight));
        _faceStateInstructionPath = ImageAssets.imgLivenesHead;
        break;
      case FaceState.FACE_STATE_DONE:
        await player.play(AssetSource(SoundAssets.soundDone));
        _faceStateInstructionPath = ImageAssets.imgSuccess;

      default:
    }
    setState(() {});
  }

  void onLivenessDone() {
    EasyLoading.show();
  }

  Future<void> onVerificationError(Exception exception) async {
    EasyLoading.dismiss();
    if (exception is AppException) {
      await EasyLoading.showError(exception.message,
          duration: const Duration(seconds: 3));
    } else {
      await EasyLoading.showError(exception.toString(),
          duration: const Duration(seconds: 3));
      Navigator.of(context).popUntil(
        (route) => route.settings.name == '/userProfile',
      );
    }
  }

  bool isShowDialogError = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        idcardDetectionViewController?.stopCamera();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                idcardDetectionViewController?.stopCamera();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Liveness"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  FaceCardDetectionView(
                    idcardRecognitionViewState: this,
                    documentImage: _documentImage,
                  ),
                  Positioned.fill(
                    child: Image.asset(
                      ImageAssets.imgLivenesHeadMask,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset(
                  _faceStateInstructionPath,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaceCardDetectionView extends StatefulWidget
    implements FaceDetectionInterface {
  IDCardRecognitionViewState idcardRecognitionViewState;
  final Uint8List? documentImage;

  FaceCardDetectionView({
    super.key,
    required this.idcardRecognitionViewState,
    this.documentImage,
  });

  @override
  State<StatefulWidget> createState() => _IDCardDetectionViewState();
}

class _IDCardDetectionViewState extends State<FaceCardDetectionView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'idcarddetectionview',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else {
      return UiKitView(
        viewType: 'idcarddetectionview',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
  }

  void _onPlatformViewCreated(int id) async {
    //setup idcardDetectionViewController
    widget.idcardRecognitionViewState.idcardDetectionViewController =
        FaceDetectionViewController(
      id,
      widget,
      widget.idcardRecognitionViewState.widget.cccdnfcModel,
    );

    //callback when onNextFaceState, you can change your UI, sound here
    widget.idcardRecognitionViewState.idcardDetectionViewController
        ?.onNextFaceState = (faceState) {
      widget.idcardRecognitionViewState.onNextFaceState(faceState);
    };

    //callback when onLivenessDone
    widget.idcardRecognitionViewState.idcardDetectionViewController
        ?.onLivenessDone = () {
      widget.idcardRecognitionViewState.onLivenessDone();
    };

    //callback when onFaceVerificationSuccess (After call api facematching)
    widget.idcardRecognitionViewState.idcardDetectionViewController
        ?.onFaceVerificationSuccess = (
      verificationSuccess,
      livenessFileModel,
      isVerifiedRAR,
    ) {
      widget.idcardRecognitionViewState.onVerificationSuccess(
        verificationSuccess,
        livenessFileModel,
        isVerifiedRAR,
      );
    };

    //callback when onFaceVerificationError
    widget.idcardRecognitionViewState.idcardDetectionViewController
        ?.onFaceVerificationError = (exception) {
      widget.idcardRecognitionViewState.onVerificationError(exception);
    };

    //setup image from CCCDNfcModel to prepare data for FaceMatching step
    widget.idcardRecognitionViewState.idcardDetectionViewController
        ?.documentImageFile = await writeFile(
      base64String: widget
          .idcardRecognitionViewState.widget.cccdnfcModel.photoBase64
          .replaceAll(RegExp(r'\s+'), ''),
    );

    //init Handler Method
    await widget.idcardRecognitionViewState.idcardDetectionViewController
        ?.initHandler();

    //start ImageStream
    await widget.idcardRecognitionViewState.idcardDetectionViewController
        ?.startCamera(
      widget.idcardRecognitionViewState.cameraLens,
    );
  }

  Future<File?> writeFile({required String base64String}) async {
    try {
      final decodedBytes = base64Decode(base64String);
      final directory = await getApplicationDocumentsDirectory();
      final fileImg = File(
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch.toString()}_documentImage.png');
      fileImg.writeAsBytesSync(List.from(decodedBytes));
      return fileImg;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
