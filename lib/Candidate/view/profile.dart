import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name;
  final String level;
  const Profile({super.key, required this.name, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            level,
            style: TextStyle(fontSize: 15),
          ),
          Image.asset(
            "assets/1.png",
            height: 100,
            width: 100,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
