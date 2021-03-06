import 'package:flutter/material.dart';
import 'auth_credentials.dart';

class LoginPage extends StatefulWidget{
  final VoidCallback shouldShowSignUp;
  final ValueChanged<LoginCredentials> didProvideCredentials;

  LoginPage({Key key, this.didProvideCredentials, this.shouldShowSignUp}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final _usernameController = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 40),
        child: Stack(children: [
          _loginForm(),

          Container(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              onPressed: widget.shouldShowSignUp,
              child: Text('Dont have an account? Sign up.')),
            )
        ])
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Username TextField
        TextField(
          controller: _usernameController,
          decoration:
            InputDecoration(icon: Icon(Icons.mail), labelText: 'Username'),
        ),
        // Password TextField
        TextField(
          controller: _passwordcontroller,
          decoration:
          InputDecoration(
              icon: Icon(Icons.lock_open), labelText: 'Password'),
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        // Login Button
        FlatButton(
          onPressed: _login,
          child: Text('Login'),
          color: Theme.of(context).accentColor
        ),
      ]
    );
  }

  void _login(){
    final username = _usernameController.text.trim();
    final password = _passwordcontroller.text.trim();

    print('username: $username');
    print('password: $password');

    final credentials =
        LoginCredentials(username: username, password: password);
    widget.didProvideCredentials(credentials);
  }
}