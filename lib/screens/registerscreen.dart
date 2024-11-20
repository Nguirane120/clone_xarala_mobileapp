import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/screens/loginscreen.dart';
import 'package:clonexaralalmobileapp/widgets/texformWidget.dart';
import 'package:flutter/material.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final FocusNode _focusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
      
      });
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
                  padding: EdgeInsets.symmetric(horizontal: 10,),
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
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              print('Form is valid');
                              print(_emailController.text);
                              print(_passwordController.text);
                            } else {
                              print('Form is not valid');
                            }
                          },
                          child: Text(
                            'S\'inscrire',
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
                                           Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Loginscreen()));
                            },
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
