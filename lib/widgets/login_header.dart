import 'package:flutter/material.dart';

import '../utils/spaces.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Connectez-vous !',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        Text(
          'Bienvenue ! Vous nous avez manqué !',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.blueGrey,
          ),
        ),
        verticalSpacing(24),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/illustration.png'),
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        verticalSpacing(24),
      ],
    );
  }
}
