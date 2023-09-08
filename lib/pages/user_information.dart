import 'dart:math';

import 'package:flutter/material.dart';
import 'package:eval/services/auth_service.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import '../services/user_service.dart';
import '../widgets/custom_text_field.dart';

class UserInformationPage extends StatefulWidget {
  UserInformationPage({Key? key}) : super(key: key);

  @override
  State<UserInformationPage> createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? username = context.watch<AuthService>().getUserName();
    final String? password = context.watch<AuthService>().getUserPassword();
    final int userId = Random().nextInt(100);


    void updateUsername() {
      // Mettre à jour l'username dans le contexte de l'AuthService
      context.read<AuthService>().updateUserName(usernameController.text);
    }

    //Fonctionne pas
    Future<void> saveUser() async {
      final User user = User(
        userId: userId,
        userName: username,
        userPassword: password,
      );

      final userService = UserService();
      final int result = await userService.saveUser(user);

      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Utilisateur enregistré avec succès en base de données.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Échec de l'enregistrement de l\'utilisateur en base de données."),
          ),
        );
      }
    }

    usernameController.text = username!;

    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bonjour $username !",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            CustomTextField(
              hasAsterisks: false,
              controller: usernameController,
              hintText: "Nouveau nom d'utilisateur", // Laissez un texte indicatif
              filled: true,
            ),
            SizedBox(height: 20),
            Text(
              "UserID: $userId",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action lorsque le bouton "Enregistrer" est cliqué
                    saveUser();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  child: Text("Enregistrer"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action lorsque le bouton "Update" est cliqué
                    updateUsername();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  child: Text("Update"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
