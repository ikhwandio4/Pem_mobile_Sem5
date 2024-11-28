import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    super.initState();
    getPosition().then((Position myPos) {
      setState(() {
        myPosition =
            'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}';
      });
    }).catchError((e) {
      setState(() {
        myPosition = 'Failed to get location: $e';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final myWidget =
        myPosition == '' ? const CircularProgressIndicator() : Text(myPosition);
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location Iwan')),
      body: Center(child: myWidget),
    );
  }

  Future<Position> getPosition() async {
    await Future.delayed(const Duration(seconds: 3));

    // Memastikan layanan lokasi diaktifkan
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled");
    }

    // Memastikan izin lokasi telah diberikan
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception("Location permission denied");
    }

    // Mengambil lokasi saat ini
    return await Geolocator.getCurrentPosition();
  }
}
