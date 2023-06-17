import 'package:flutter/material.dart';
import 'package:flutter_techmaster/navigator/homePage.dart';
import 'package:flutter_techmaster/navigator/registerPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        leading: BackButton(onPressed: () {
          Navigator.of(context).pop();
        }),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => HomePage())));
                },
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const RegisterPage());
                  Navigator.of(context).push(route);
                },
                child: Text('Register'),
              )
            ]),
      ),
    );
  }
}
