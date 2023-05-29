import 'package:flutter/material.dart';

class FlagApp extends StatelessWidget {
  const FlagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlagHomePage(),
    );
  }
}

class FlagHomePage extends StatefulWidget {
  const FlagHomePage({super.key});

  @override
  State<FlagHomePage> createState() => _FlagHomePageState();
}

class _FlagHomePageState extends State<FlagHomePage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(title: Text('Flag App')),
      body: Center(
        child: AspectRatio(
          aspectRatio: 6 / 4,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            color: Colors.red,
            child: Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.star_rate,
                size: MediaQuery.of(super.context).size.shortestSide / 2,
                color: Colors.yellowAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
