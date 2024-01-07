


extension StringExtension on String {
  String capitalize() {
    if(isEmpty){
      return '';
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}


final RegExp numericRegExp = RegExp(r'^\d*\.?\d*$'); // Regular expression to allow numbers


bool isValidEmail(String email) {
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
  );
  return emailRegex.hasMatch(email);
}


bool isValidPassword(String password) {
  // Check if the password length is at least 6 characters
  if (password.length < 6) {
    return false;
  }

  // Check if the password contains at least one digit
  if (!password.contains(RegExp(r'\d'))) {
    return false;
  }

  // Check if the password contains at least one special character
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return false;
  }

  // Check if the password contains both uppercase and lowercase letters
  if (!password.contains(RegExp(r'[a-z]')) || !password.contains(RegExp(r'[A-Z]'))) {
    return false;
  }

  return true;
}