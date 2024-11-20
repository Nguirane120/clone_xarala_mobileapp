import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/widgets/texformWidget.dart';
import 'package:flutter/material.dart';

class Resetpasswordscreen extends StatefulWidget {
  const Resetpasswordscreen({super.key});

  @override
  State<Resetpasswordscreen> createState() => _ResetpasswordscreenState();
}

class _ResetpasswordscreenState extends State<Resetpasswordscreen> {
  final FocusNode _focusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reinitialisation"),
        centerTitle: true,
      ),
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
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Image.asset(
                    'images/logoxarala.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "Reinitialisation",
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
                            Icons.key,
                            color: primaryColor,
                          ),
                          contontroller: _emailController,
                         
                          labelText: 'Code',
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
                            'ENVOYER',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
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
