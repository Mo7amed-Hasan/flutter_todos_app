import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int sizeList;
  final int countTask;
  const Counter({super.key, required this.sizeList, required this.countTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "$countTask/$sizeList",
        style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: countTask == sizeList ? Colors.green : Colors.red),
      ),
    );
  }
}
