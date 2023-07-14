import 'package:flutter/material.dart';

enum PasswordStrength {
  Weak,
  Medium,
  Strong,
}

Color getColorForPasswordStrength(PasswordStrength strength) {
  switch (strength) {
    case PasswordStrength.Weak:
      return Colors.red;
    case PasswordStrength.Medium:
      return Colors.orange;
    case PasswordStrength.Strong:
      return Colors.green;
    default:
      return Colors.black;
  }
}

PasswordStrength checkPasswordStrength(String password) {
  // Define your password strength criteria
  const int minLength = 8;
  // const int minUpperCase = 1;
  // const int minLowerCase = 1;
  // const int minDigits = 1;
  // const int minSpecialChars = 1;

  int strength = 0;

  if (password.length >= minLength) {
    strength++;
  }

  if (RegExp(r'[A-Z]').hasMatch(password)) {
    strength++;
  }

  if (RegExp(r'[a-z]').hasMatch(password)) {
    strength++;
  }

  if (RegExp(r'\d').hasMatch(password)) {
    strength++;
  }

  if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
    strength++;
  }

  if (strength == 1) {
    return PasswordStrength.Weak;
  } else if (strength == 2 || strength == 3) {
    return PasswordStrength.Medium;
  } else {
    return PasswordStrength.Strong;
  }
}
