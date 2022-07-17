import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class LoginForm {
  final String email;
  final String password;

  const LoginForm({
    required this.email,
    required this.password,
  });

  const LoginForm.empty() : this(email: '', password: '');
}
