import 'package:flutter/material.dart';
import 'package:flutter_techmaster/navigator/homePage.dart';

class EditMyProfilePage extends StatelessWidget {
  const EditMyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit My Profile Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text('Back to Home Page'),
              ),
              ElevatedButton(
                  onPressed: () => logout(), child: const Text('Logout'))
            ]),
      ),
    );
  }

  void logout() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: ((_) => const HomePage())),
        (route) => false);
  }
}
