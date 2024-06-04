import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:convert_native_img_stream/convert_native_img_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

extension DeviceOrientationUtils on DeviceOrientation {
  int? get rotationCompensation => _getRotationCompensation();

  int? _getRotationCompensation() {
    late final int _rotation;

    switch (this) {
      case DeviceOrientation.portraitUp:
        _rotation = 0;
        break;
      case DeviceOrientation.landscapeLeft:
        _rotation = 90;
        break;
      case DeviceOrientation.portraitDown:
        _rotation = 180;
        break;
      case DeviceOrientation.landscapeRight:
        _rotation = 270;
        break;
      default:
        return null;
    }

    return _rotation;
  }
}

class ImageUtils {
  static Future<Uint8List?> convertCameraImage(CameraImage cameraImage) async {
    final convertNative = ConvertNativeImgStream();
    final frame = cameraImage.planes.first.bytes;

    return await convertNative.convertImgToBytes(
      frame,
      cameraImage.width,
      cameraImage.height,
    );
  }
}
