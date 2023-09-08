import 'package:eval/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../utils/spaces.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final Function(BuildContext) onLoginPressed;

  LoginForm({
    required this.formKey,
    required this.userNameController,
    required this.passwordController,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                hintText: "Nom d'utilisateur",
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length < 5) {
                    return "Le nom d'utilisateur doit comporter plus de 5 caractères";
                  } else if (value != null && value.isEmpty) {
                    return "Veuillez entrer votre nom d'utilisateur";
                  }
                  return null;
                },
                controller: userNameController,
              ),
              verticalSpacing(24),
              CustomTextField(
                hasAsterisks: true,
                controller: passwordController,
                hintText: 'Mot de passe',
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length < 8) {
                    return "Le mot de passe doit comporter plus de 8 caractères";
                  } else if (value != null && value.isEmpty) {
                    return "Veuillez entrer un mot de passe fort";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        verticalSpacing(24),
        ElevatedButton(
          onPressed: () async {
            onLoginPressed(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)),
          ),
          child: Text(
            'Connexion',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
        ),
        verticalSpacing(24),
      ],
    );
  }
}
