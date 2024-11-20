import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo Ikhwandi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  bool isLoading = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
      result = '';
    });

    try {
      const authority = 'www.googleapis.com';
      const path = '/books/v1/volumes/L8lCEAAAQBAJ';
      final url = Uri.https(authority, path);

      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          result = response.body.substring(0, 450); // Menampilkan 450 karakter pertama
        });
      } else {
        setState(() {
          result = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        result = 'An error occurred: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: getData,
              child: const Text('GO!'),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : Text(result, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
