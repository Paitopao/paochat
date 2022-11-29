import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paochat/proceso/autenticacion.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState() => _mensajesState();
}

class _mensajesState extends State<mensajes> {
  Stream<QuerySnapshot> respuesta_consulta = FirebaseFirestore.instance
      .collection("Chat")
      .orderBy("tiempo", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: respuesta_consulta,
        builder: (context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return ListView.builder(
            itemCount: respuesta.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: (Autenticacion().usuarios?.email).toString() ==
                        respuesta.data!.docs[index].get("Email")
                    ? Colors.amber[100]
                    : Colors.blue[100],
                child: ListTile(
                  title: Text(respuesta.data!.docs[index].get("Mensaje"),
                      textAlign: (Autenticacion().usuarios?.email).toString() ==
                              respuesta.data!.docs[index].get("Email")
                          ? TextAlign.left
                          : TextAlign.right),
                  subtitle: Text(respuesta.data!.docs[index].get("Email"),
                      textAlign: (Autenticacion().usuarios?.email).toString() ==
                              respuesta.data!.docs[index].get("Email")
                          ? TextAlign.left
                          : TextAlign.right),
                ),
              );
            },
          );
        });
  }
}
