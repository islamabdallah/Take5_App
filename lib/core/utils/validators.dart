String? validatePassword(String? value) {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,32}$');
  if (value==null||value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Password must contains one special character (\$, %,@, etc), one UpperCase letter, one digit and at least 8 characters.';
    } else {
      return null;
    }
  }
}