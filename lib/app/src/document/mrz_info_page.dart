import 'package:flutter/material.dart';
import 'package:izota_ekyc/izota_ekyc.dart';
import '../../src/liveness/face_detection_view.dart';

class MRZInfoPage extends StatefulWidget {
  const MRZInfoPage({super.key, required this.mrzInfoModel});
  final MRZInfoModel mrzInfoModel;

  @override
  State<MRZInfoPage> createState() => _MRZInfoPageState();
}

class _MRZInfoPageState extends State<MRZInfoPage> {
  final _izotaEkycPlugin = IzotaEkyc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kết quả quét quét MRZ",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...widget.mrzInfoModel
                .toJson()
                .entries
                .map((e) => ["last9Digits"].contains(e.key)
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Text(
                              getTitleKey(e.key),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                                child: Text(
                              e.value,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            )),
                          ],
                        ),
                      ))
                .toList()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: ElevatedButton(
            onPressed: onStartScanNFC,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text(
              "Quét NFC",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            )),
      ),
    );
  }

  String getTitleKey(String key) {
    switch (key) {
      case "birthDate":
        return "Ngày sinh";
      case "expiryDate":
        return "Ngày hết hạn";
      case "documentNumber":
        return "Số CCCD";
      default:
        return "";
    }
  }

  void onStartScanNFC() {
    _izotaEkycPlugin.startScanNFC(
      mrzInfoModel: widget.mrzInfoModel,
      onProgressNFC: (p0) {},
      onScanNFCError: (error) {},
      onScanNFCSuccess: (cccdModel) async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FaceRecognitionPage(
              cccdnfcModel: cccdModel,
            ),
          ),
        );
      },
    );
  }
}
