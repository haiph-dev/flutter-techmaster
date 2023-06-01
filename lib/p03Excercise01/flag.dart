import 'package:flutter/material.dart';

class FlagPage extends StatelessWidget {
  const FlagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flag App'),
      ),
      body: const Center(
        child: Column(children: [
          SwedenFLag(),
          SizedBox(
            height: 200,
          ),
          VNflag()
        ]),
      ),
    );
  }
}

class SwedenFLag extends StatelessWidget {
  const SwedenFLag({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 300,
        height: 200,
        color: Color(0xff006AA7),
      ),
      Positioned(
        top: 70,
        // left: 100,
        child: Container(
          width: 300,
          height: 25,
          color: Colors.yellow,
        ),
      ),
      Positioned(
        left: 100,
        child: Container(
          width: 25,
          height: 200,
          color: Colors.yellow,
        ),
      ),
    ]);
  }
}

class VNflag extends StatelessWidget {
  const VNflag({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(width: 300, height: 200, color: Colors.red),
      Positioned(
          bottom: 0,
          child: Container(height: 100, width: 300, color: Colors.blue)),
      Positioned(
        top: 15,
        left: 70,
        child: Icon(
          Icons.star_rate,
          size: 150.0,
          color: Colors.yellow,
        ),
      )
    ]);
  }
}
