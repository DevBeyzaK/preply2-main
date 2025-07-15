import 'package:flutter/material.dart';

class ProfileAvatarButton extends StatelessWidget {
    final VoidCallback onTap;
    const ProfileAvatarButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (newContext) => GestureDetector(
        onTap: () {
          Scaffold.of(newContext).openEndDrawer();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/beyza.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
