import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/screens/mainscreen.dart';
import 'package:clonexaralalmobileapp/widgets/texformWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final FocusNode _focusNode = FocusNode();
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool _isPasswordVisible = false;
  Future<void> signUpWithDetails({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'name': name,
        'phone': phone,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print('Utilisateur inscrit avec succès');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Mainscreen()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'Cet email est déjà utilisé.';
      } else {
        errorMessage = 'Erreur: ${e.message}';
      }
      _showErrorDialog(errorMessage);
    } catch (e) {
      _showErrorDialog('Une erreur est survenue. Veuillez réessayer.');
      print('Erreur lors de l\'inscription: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Erreur'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      signUpWithDetails(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/logoxarala.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "Inscription",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextformWidget(
                          prefixIcon: Icon(
                            Icons.person,
                            color: primaryColor,
                          ),
                          contontroller: _nameController,
                          labelText: 'Nom complet',
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        TextformWidget(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: primaryColor,
                          ),
                          contontroller: _phoneController,
                          labelText: 'Telephone',
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        TextformWidget(
                          prefixIcon: Icon(
                            Icons.email,
                            color: primaryColor,
                          ),
                          contontroller: _emailController,
                          labelText: 'xaralaacademy@gmail.com',
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        TextformWidget(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: primaryColor,
                          ),
                          contontroller: _passwordController,
                          labelText: '*********',
                          obscureText: !_isPasswordVisible,
                          textInputType: TextInputType.text,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        TextformWidget(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: primaryColor,
                          ),
                          contontroller: _confirmPasswordController,
                          labelText: '*********',
                          obscureText: !_isPasswordVisible,
                          textInputType: TextInputType.text,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        ElevatedButton(
                          onPressed: isLoading ? null : _signUp,
                          child: isLoading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.0,
                                  ),
                                )
                              : Text('S\'inscrire'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Se connecter",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
