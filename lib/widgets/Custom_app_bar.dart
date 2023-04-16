import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      title: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 68, 191)
          ],
        ).createShader(bounds),
        child: Text(
          "O M D B",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
