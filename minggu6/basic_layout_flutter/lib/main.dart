import 'package:flutter/material.dart';
import 'widget.dart'; // Mengimpor file widgets.dart

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final Icon starStyle = Icon(
    Icons.star,
    size: 10,
    color: Colors.grey[700],
  );

  final double iconSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Menggunakan Padding untuk judul
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Strawberry Pavlova",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Menggunakan Padding untuk deskripsi
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. "
                          "It features a crisp crust and soft, light inside, topped with fruit and whipped cream.",
                          softWrap: true,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Menggunakan Padding untuk rating
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: List.generate(5, (index) => starStyle),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "170 Reviews",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                    FontWeight.bold, // Menjadikan teks tebal
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Menggunakan Padding untuk informasi
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InfoColumn(
                                icon: Icons.kitchen_outlined,
                                label: "PREP:",
                                value: "25 min"),
                            InfoColumn(
                                icon: Icons.timer_outlined,
                                label: "COOK:",
                                value: "1 hr"),
                            InfoColumn(
                                icon: Icons.restaurant_outlined,
                                label: "FEEDS:",
                                value: "4 - 6"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Kolom untuk Gambar
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment:
                        Alignment.topCenter, // Memindahkan gambar ke atas
                    child: Image.asset(
                      "images/strawberry.png",
                      fit: BoxFit.cover,
                      height: 500, // Sesuaikan ukuran gambar
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
