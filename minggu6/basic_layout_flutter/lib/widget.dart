import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Widget child;

  const MyContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: child,
    );
  }
}

class InfoColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoColumn({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.green[300], size: 15),
        Text(label, style: const TextStyle(fontSize: 12)),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}