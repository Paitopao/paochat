import 'dart:html';

import 'package:flutter/material.dart';
import 'package:paochat/proceso/autenticacion.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final email = TextEditingController();
final password = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login / Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                  image: NetworkImage(
                      "https://www.state.gov/courses/answeringdifficultquestions/assets/m/img/comm_verbal.png")),
            ),
            TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Email", suffixIcon: Icon(Icons.email_rounded))),
            TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                  hintText: "Password", suffixIcon: Icon(Icons.vpn_key)),
            ),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  Autenticacion().iniciarSesion(
                      email: email.text, password: password.text);
                },
                icon: Icon(Icons.login_sharp),
                label: Text("Iniciar Sesion")),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  Autenticacion()
                      .crearUsuario(email: email.text, password: password.text);
                },
                icon: Icon(Icons.person_add_alt),
                label: Text("Registrar Usuario"))
          ],
        ),
      ),
    );
  }
}
