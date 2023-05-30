import 'package:flutter/material.dart';

class StarRateApp extends StatelessWidget {
  const StarRateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StarRatePage(),
    );
  }
}

class StarRatePage extends StatelessWidget {
  const StarRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Star Rate App')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [StarRate(1), StarRate(2), StarRate(3)]),
    );
  }
}

// ignore: must_be_immutable
class StarRate extends StatelessWidget {
  final int rate;

  StarRate(this.rate, {super.key});
  List<Widget> rateList = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < rate; i++) {
      rateList.add(Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 50,
      ));
    }

    for (int i = 0; i < 5 - rate; i++) {
      rateList
          .add(Icon(Icons.star_rate_outlined, color: Colors.grey, size: 50));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rateList,
    );
  }
}
