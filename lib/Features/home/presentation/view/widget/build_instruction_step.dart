import 'package:flutter/material.dart';

class BuildInstructionStep extends StatelessWidget {
  const BuildInstructionStep({super.key, required this.number, required this.text});

  final int number;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.deepOrange,
            child: Text(
              number.toString(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 16, height: 1.5)),
          ),
        ],
      ),
    );
  }
}
