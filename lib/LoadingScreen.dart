import 'package:flutter/material.dart';

loading(context) {
  return Center(
    child: Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/icons/badge_72.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const CircularProgressIndicator(
        strokeWidth: 4,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
      ),
    ),
  );
}
