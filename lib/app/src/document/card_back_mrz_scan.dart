import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:izota_ekyc/izota_ekyc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'mrz_info_page.dart';

class MRZCameraPage extends StatefulWidget {
  const MRZCameraPage({super.key, required this.documentId});
  final String documentId;

  @override
  State<MRZCameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<MRZCameraPage> {
  IZOTAMRZController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quét mã MRZ",
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: FutureBuilder<PermissionStatus>(
          future: Permission.camera.request(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == PermissionStatus.granted) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  IZOTAMRZScanner(
                    withOverlay: true,
                    onControllerCreated: onControllerCreated,
                  )
                ],
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Awaiting for permissions'),
                  ),
                  Text('Current status: ${snapshot.data?.toString()}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool isParsed = false;

  @override
  void dispose() {
    controller?.stopPreview();
    super.dispose();
  }

  void onControllerCreated(IZOTAMRZController mrzController) {
    if (controller != null) {
      return;
    }

    controller = mrzController;

    mrzController.onParsed = (mrzModel) async {
      if (isParsed) {
        return;
      }
      isParsed = true;
      if (widget.documentId == mrzModel.documentNumber) {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MRZInfoPage(
              mrzInfoModel: mrzModel,
            ),
          ),
        );
      } else {
        await EasyLoading.showError(
            'Thông tin mặt trước và mặt sau không đồng nhất',
            duration: const Duration(seconds: 3));
      }

      isParsed = false;
      controller?.startPreview();
    };
  }
}
