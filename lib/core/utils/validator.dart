String? validateEmail(String? email) {
  if (email == null || email.isEmpty) return 'Mandatory';
  final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailRegex.hasMatch(email) ? null : 'Type a valid email';
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) return 'Mandatory';

  final validations = <String>[];
  if (!RegExp('[A-Z]').hasMatch(password)) validations.add('Should contain at least one upper case');
  if (!RegExp('[a-z]').hasMatch(password)) validations.add('Should contain at least one lower case');
  if (!RegExp('[0-9]').hasMatch(password)) validations.add('Should contain at least one digit');

  if (!RegExp('[!@#\$&*~]').hasMatch(password)) {
    validations.add('Should contain at least one Special character');
  }

  if (password.length < 8) validations.add('Must be at least 8 characters in length');

  return validations.isEmpty ? null : validations.join(';\n');
}
