import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kamera_flutter/widget/filter_selector.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final ValueNotifier<Color> _filterColor = ValueNotifier<Color>(Colors.white);

  DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture ikhwandi - 2241720028 ')),
      body: Stack(
        children: [
          // Display the picture with selected filter
          Positioned.fill(
            child: ValueListenableBuilder(
              valueListenable: _filterColor,
              builder: (context, color, child) {
                return Image.file(
                  File(imagePath),
                  color: color.withOpacity(0.5),
                  colorBlendMode: BlendMode.color,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Filter Selector at the bottom
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: FilterSelector(
              filters: [
                Colors.white,
                ...List.generate(
                  Colors.primaries.length,
                  (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
                ),
              ],
              onFilterChanged: (selectedColor) {
                _filterColor.value = selectedColor;
              },
            ),
          ),
        ],
      ),
    );
  }
}