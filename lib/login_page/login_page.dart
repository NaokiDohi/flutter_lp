import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Material(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcom back',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please add in your email';
                        } else if (!isValidEmail(value)) {
                          return 'Please add in a valid email';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: true, // パスワードを隠す
                      controller: _passwordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'You forgot your password';
                        } else if (value.length < 6) {
                          // 制限が6なのはFirebaseAuthの最小が6だから
                          return 'Password must be at least six characters';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 65),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {
                          final _email = _emailController.text;
                          final _password = _passwordController.text;
                          if (_formKey.currentState.validate()) {
                            FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: _email,
                              password: _password,
                            );
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool isValidEmail(String email) {
  // Emailならtrueが返される。
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
