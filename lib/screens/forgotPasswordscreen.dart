import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/screens/resetPasswordscreen.dart';
import 'package:clonexaralalmobileapp/widgets/texformWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final FocusNode _focusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Un e-mail de réinitialisation a été envoyé à $email"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erreur : $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reinitialiser mot de passe"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08),
              alignment: Alignment.center,
              child: Image.asset(
                'images/logoxarala.png',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Reinitialiser mot de passe",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            Padding(
              padding: EdgeInsets.all(17),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextformWidget(
                      prefixIcon: Icon(
                        Icons.email,
                        color: primaryColor,
                      ),
                      contontroller: _emailController,
                      inputTitle: 'Adresse Email',
                      labelText: 'xaralaacademy@gmail.com',
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final email = _emailController.text.trim();
                        if (email.isNotEmpty) {
                          resetPassword(context, email);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Veuillez entrer une adresse e-mail."),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: Text(
                        'VALIDER',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Resetpasswordscreen()));
                          },
                          child: Text("J’ai deja un code",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
