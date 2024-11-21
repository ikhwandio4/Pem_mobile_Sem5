import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

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
          result = response.body
              .substring(0, 450); // Menampilkan 450 karakter pertama
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

Future<String> returnError() async {
  await Future.delayed(const Duration(seconds: 3)); // Simulasi delay
  if (DateTime.now().second % 2 == 0) {
    return "Data fetched successfully!";
  } else {
    throw "Simulated error occurred!";
  }
}


  late Completer<int> completer;

  Future<void> getNumber() async {
    setState(() {
      isLoading = true; // Mulai loading
    });

    completer = Completer<int>();
    calculate();

    try {
      final value = await completer.future;
      setState(() {
        result = value.toString(); // Menampilkan hasil
      });
    } catch (e) {
      setState(() {
        result = 'An error occurred: $e'; // Menampilkan error
      });
    } finally {
      setState(() {
        isLoading = false; // Selesai loading
      });
    }
  }

  Future<void> calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42); // Memberikan hasil
    } catch (e) {
      completer.completeError('Calculation failed'); // Memberikan error
    }
  }

  void returnFG() async {
    setState(() {
      isLoading = true; // Memulai loading
      result = ''; // Reset hasil
    });

    try {
      // Menjalankan semua Future secara paralel
      final futures = await Future.wait<int>([
        returnOneAsync(),
        returnTwoAsync(),
        returnThreeAsync(),
      ]);

      // Menjumlahkan hasil dari semua Future
      int total = futures.fold(0, (sum, value) => sum + value);

      setState(() {
        result = total.toString(); // Menampilkan hasil total
      });
    } catch (error) {
      setState(() {
        result = 'An error occurred: $error'; // Menangani error
      });
    } finally {
      setState(() {
        isLoading = false; // Selesai loading
      });
    }
  }

  Future<void> handleError() async {
  setState(() {
    isLoading = true; // Mulai loading
    result = ''; // Reset hasil
  });

  try {
    final value = await returnError(); // Menunggu hasil dari returnError
    setState(() {
      result = 'Success: $value'; // Menampilkan hasil sukses
    });
  } catch (error) {
    setState(() {
      result = 'Error: ${error.toString()}'; // Menampilkan pesan error
    });
  } finally {
    setState(() {
      isLoading = false; // Menghentikan loading
    });
    print('Complete'); // Debug log proses selesai
  }
}


  @override
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
            onPressed: handleError, // Memanggil handleError saat tombol ditekan
            child: const Text('Go'),
          ),
          const SizedBox(height: 20),
          isLoading
              ? const CircularProgressIndicator() // Menampilkan loading
              : Text(result, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}


  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }
}
