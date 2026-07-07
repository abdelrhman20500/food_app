import 'package:flutter/material.dart';

class BuildSwitchTile extends StatelessWidget {
  const BuildSwitchTile({super.key, required this.title, required this.icon, required this.value});

  final String title;
  final IconData icon;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFF0F0),
          child: Icon(icon, color: Colors.orange),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: Switch(
          value: value,
          onChanged: (val) {},
          activeColor: Colors.orange,
        ),
      ),
    );
  }
}
