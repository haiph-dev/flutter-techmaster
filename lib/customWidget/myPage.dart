import 'package:flutter/material.dart';
import 'myTextField.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final nameController = TextEditingController();
  final bodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myTextField(
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
            ),
            myTextField(controller: bodController, text)
          ],
        ),
      ),
    );
  }
}
