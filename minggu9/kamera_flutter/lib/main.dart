import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kamera_flutter/widget/filter_carousel.dart';
import 'package:kamera_flutter/widget/takepicture_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Meminta daftar kamera yang tersedia di perangkat
  final cameras = await availableCameras();

  // Memilih kamera pertama sebagai default (misalnya kamera belakang)
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera with Filter',
      theme: ThemeData.dark(),
      home: TakePictureScreen(camera: camera),
    );
  }
}