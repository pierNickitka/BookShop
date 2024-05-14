import 'package:flutter/material.dart';
import 'package:bookshopv2/models/user.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final user = await _userRepository.authenticate(
                  _usernameController.text,
                  _passwordController.text,
                );
                if (user != null) {
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid username or password')),
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              child: Text('Register'),
              onPressed: () {
                Navigator.of(context).pushNamed('/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
