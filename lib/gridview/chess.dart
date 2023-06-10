import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChessGridView extends StatelessWidget {
  const ChessGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chess Grid View'),
        backgroundColor: Colors.blue,
      ),
      body: ChessView(),
    );
  }
}

class ChessView extends StatefulWidget {
  const ChessView({super.key});

  @override
  State<ChessView> createState() => _ChessViewState();
}

class _ChessViewState extends State<ChessView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> chessList = [];
    for (int x = 0; x < 8; x++) {
      for (int y = 0; y < 8; y++) {
        chessList.add(ChessSquare(
          x: x,
          y: y,
        ));
      }
    }
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 8,
        children: chessList,
      ),
    );
  }
}

class ChessSquare extends StatelessWidget {
  final int x;
  final int y;

  const ChessSquare({
    super.key,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: (x % 2 == 0 && y % 2 == 0) || (x % 2 != 0 && y % 2 != 0)
              ? Colors.white
              : Colors.black),
    );
  }
}
