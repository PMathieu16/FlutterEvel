import 'package:eval/services/auth_service.dart';
import 'package:eval/utils/spaces.dart';
import 'package:eval/widgets/custom_text_field.dart';
import 'package:eval/widgets/login_form.dart';
import 'package:eval/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  Future<void> loginUser(BuildContext context) async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      await context.read<AuthService>().loginUser(userNameController.text, passwordController.text);
      Navigator.pushReplacementNamed(context, '/user-information',
          arguments: '${userNameController.text}');
      print('Connexion réussie !');
    } else {
      print('Échec de la connexion.');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
            if (constraints.maxWidth > 1000) {
              // Mise en page pour le web
              return Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginHeader(),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(child: LoginForm(formKey: _formkey, userNameController: userNameController, passwordController: passwordController, onLoginPressed: loginUser)),
                  Spacer(
                    flex: 1,
                  ),
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginHeader(),
                LoginForm(formKey: _formkey, userNameController: userNameController, passwordController: passwordController, onLoginPressed: loginUser),
              ],
            );
          }),
        ),
      ),
    );
  }
}
