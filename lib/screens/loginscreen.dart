import 'package:clonexaralalmobileapp/bloc/bloc/auth_bloc.dart';
import 'package:clonexaralalmobileapp/bloc/bloc/auth_event.dart';
import 'package:clonexaralalmobileapp/bloc/bloc/auth_state.dart';
import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/repositry/auth.dart';
import 'package:clonexaralalmobileapp/screens/forgotPasswordscreen.dart';
import 'package:clonexaralalmobileapp/screens/mainscreen.dart';
import 'package:clonexaralalmobileapp/screens/registerscreen.dart';
import 'package:clonexaralalmobileapp/widgets/texformWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isPasswordVisible = false;
  final authRepository = AuthenticationRepository();
  bool isLoading = false;

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
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> signInWithGoogle() async {
    setState(() {
      isLoading = true;
    });

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        // print('User: ${userCredential.user}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Mainscreen()),
        );
      }
    } catch (e) {
      print("Error ====================>: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur : ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isLoading = false; // Désactiver le loader
      });
    }
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
            SizedBox(height: 30),
            Text(
              "Se connecter",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
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
                    TextformWidget(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: primaryColor,
                      ),
                      contontroller: _passwordController,
                      inputTitle: 'Mot de passe',
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
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          setState(() {
                            isLoading = true; // Activer le loader
                          });

                          try {
                            final user = await auth.signInWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );

                            if (user != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Mainscreen(),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Erreur : ${e.toString()}'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                      child: isLoading
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              'Se connecter',
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text('Ou continuer avec:'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.05,
                            MediaQuery.of(context).size.height * 0.01),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: isLoading ? null : signInWithGoogle,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'images/google.png',
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Se connecter avec Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text(
                            'Mot de passe oublié ?',
                            style: TextStyle(color: primaryColor),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ),
                            );
                          },
                        ),
                        TextButton(
                          child: Text(
                            'S’inscrire',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Registerscreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
