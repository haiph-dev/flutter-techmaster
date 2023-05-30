import 'package:flutter/material.dart';

class FlagRusApp extends StatelessWidget {
  const FlagRusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlagRuPage(),
    );
  }
}

class FlagRuPage extends StatefulWidget {
  const FlagRuPage({super.key});

  @override
  State<FlagRuPage> createState() => _FlagRuPageState();
}

class _FlagRuPageState extends State<FlagRuPage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(title: Text('Russian Flag App')),
      body: Center(
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            color: Colors.grey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  // height: MediaQuery.of(super.context).size.height / 3,
                  height: 100.0,
                  width: double.infinity,
                  color: Colors.white),
              Container(
                // height: MediaQuery.of(super.context).size.height / 3,
                height: 100.0,
                width: double.infinity,
                color: Colors.indigo,
              ),
              Container(
                // height: MediaQuery.of(super.context).size.height / 3,
                height: 100.0,
                width: double.infinity,
                color: Colors.red,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
