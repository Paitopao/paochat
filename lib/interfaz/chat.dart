import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paochat/interfaz/mensajes.dart';
import 'package:paochat/proceso/autenticacion.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final Mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;

class _chatState extends State<chat> {
  final FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Autenticacion().cerrarSesion();
                },
                icon: Icon(Icons.logout_outlined)),
            VerticalDivider(),
            Text((Autenticacion().usuarios?.email).toString())
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: Mensaje,
                    focusNode: myFocusNode,
                    decoration: InputDecoration(hintText: "Mensaje..."),
                    onSubmitted: (valor) {
                      Mensaje.text = valor;
                      if (Mensaje.text.isNotEmpty) {
                        myFocusNode.requestFocus();
                        fire.collection("Chat").doc().set({
                          "Mensaje": Mensaje.text,
                          "tiempo": DateTime.now(),
                          "Email": (Autenticacion().usuarios?.email).toString()
                        });

                        Mensaje.clear();
                      }
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (Mensaje.text.isNotEmpty) {
                        fire.collection("Chat").doc().set({
                          "Mensaje": Mensaje.text,
                          "tiempo": DateTime.now(),
                          "Email": (Autenticacion().usuarios?.email).toString()
                        });

                        Mensaje.clear();
                      }
                    },
                    icon: Icon(Icons.send))
              ],
            ),
            Container(child: Expanded(child: mensajes())),
          ],
        ),
      ),
    );
  }
}
