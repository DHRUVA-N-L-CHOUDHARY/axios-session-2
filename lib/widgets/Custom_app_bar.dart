import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool active;
  const CustomAppBar({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: active == true ? IconButton( 
        onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)) : Container(),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      title: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 68, 191)
          ],
        ).createShader(bounds),
        child: const Text(
          "O M D B",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
