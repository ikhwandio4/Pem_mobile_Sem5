import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Ikhwandi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StreamHomePage(title: 'Stream Ikhwandi'),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key, required this.title});
  final String title;

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;
  late StreamTransformer transformer;
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;


@override
void initState() {
  super.initState();

  // Inisialisasi NumberStream dan controller
  numberStream = NumberStream();
  numberStreamController = numberStream.controller;
  Stream stream = numberStreamController.stream;

  // Definisikan transformer untuk stream
  transformer = StreamTransformer<int, int>.fromHandlers(
    handleData: (value, sink) {
      // Kalikan nilai dengan 10 sebelum diteruskan ke sink
      sink.add(value * 10);
    },
    handleError: (error, trace, sink) {
      // Tambahkan -1 ke sink jika terjadi error
      sink.add(-1);
    },
    handleDone: (sink) {
      // Tutup sink saat stream selesai
      sink.close();
    },
  );

  // Transform stream dan dengarkan hasilnya
  stream.transform(transformer).listen(
    (event) {
      // Perbarui state dengan nilai baru
      setState(() {
        lastNumber = event;
      });
    },
    onError: (error) {
      // Tangani error dengan memperbarui state
      setState(() {
        lastNumber = -1;
      });
    },
    onDone: () {
      // Log jika stream selesai
      print('Stream has completed.');
    },
  );
}


  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
  }

  void changeColor() async {
    // await for (var eventColor in colorStream.getColors()) {
    //   setState(() {
    //     bgColor = eventColor;
    //   });
    // }
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastNumber.toString()),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}
