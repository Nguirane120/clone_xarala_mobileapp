import 'package:clonexaralalmobileapp/widgets/texformWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isLoading = false;

  Future<void> changePassword() async {
    final User? user = _auth.currentUser;
    if (user == null) {
      print("Aucun utilisateur connecté.");
      return;
    }

    String currentPassword = _currentPasswordController.text.trim();
    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Les mots de passe ne correspondent pas")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);

      await user.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mot de passe modifié avec succès")),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Une erreur est survenue.";
      if (e.code == 'wrong-password') {
        errorMessage = "Le mot de passe actuel est incorrect.";
      } else if (e.code == 'weak-password') {
        errorMessage = "Le nouveau mot de passe est trop faible.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      print("Erreur : $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier le mot de passe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextformWidget(
              contontroller: _currentPasswordController,
              labelText: "Mot de passe actuel",
              obscureText: true,
            ),
            TextformWidget(
              contontroller: _newPasswordController,
              labelText: "Nouveau mot de passe",
              obscureText: true,
            ),
            TextformWidget(
              contontroller: _confirmPasswordController,
              labelText: "Confirmer le nouveau mot de passe",
              obscureText: true,
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: changePassword,
                    child: Text("Modifier le mot de passe"),
                  ),
          ],
        ),
      ),
    );
  }
}
