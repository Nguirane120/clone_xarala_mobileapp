import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/screens/forgotPasswordscreen.dart';
import 'package:clonexaralalmobileapp/screens/registerscreen.dart';
import 'package:clonexaralalmobileapp/widgets/texformWidget.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final FocusNode _focusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Color _borderColor = Colors.grey;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _borderColor = _focusNode.hasFocus ? Colors.blue : Colors.grey[200]!;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
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
                  height: 30,
                ),
                Text(
                  "Se connnecter",
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
                          borderColor: _borderColor,
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
                          borderColor: _borderColor,
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
                          onPressed: () {
                            print(_emailController);
                            print(_passwordController);
                          },
                          child: Text(
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
                          onPressed: () {},
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
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                child: Text(
                                  'Mot de passe oublie ?',
                                  style: TextStyle(color: primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()));
                                },
                              ),
                              TextButton(
                                child: Text('S’inscrire',
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  //                                   if (_formKey.currentState?.validate() ?? false) {
                                  //   print('Form is valid');
                                  //   print(_emailController.text);
                                  //   print(_passwordController.text);
                                  // } else {
                                  //   print('Form is not valid');
                                  // }
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Registerscreen()));
                                },
                              )
                            ],
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
