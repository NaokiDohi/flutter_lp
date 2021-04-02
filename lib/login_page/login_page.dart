import 'package:flutter/material.dart';

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
                        return value.isEmpty ? 'Please add in a title' : null;
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
                        return value.isEmpty ? 'Please add in a url' : null;
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
                        onPressed: () {},
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
