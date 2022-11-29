import 'package:firebase_auth/firebase_auth.dart';

class Autenticacion {
  final FirebaseAuth fire = FirebaseAuth.instance;
  User? get usuarios => fire.currentUser;
  Stream<User?> get estadoLogin => fire.authStateChanges();

  Future<void> iniciarSesion(
      {required String email, required String password}) async {
    try {
      await fire.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> crearUsuario(
      {required String email, required String password}) async {
    try {
      await fire.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> cerrarSesion() async {
    try {
      await fire.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
