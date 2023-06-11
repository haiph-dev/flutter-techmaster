import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardGame extends StatelessWidget {
  const CardGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Card Game'),
        ),
        body: CardGameView());
  }
}

class CardGameView extends StatefulWidget {
  const CardGameView({super.key});

  @override
  State<CardGameView> createState() => _CardGameViewState();
}

class _CardGameViewState extends State<CardGameView> {
  List<CardItem> cardList = List.generate(6, (index) => CardItem(type: 'cat'));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        children: cardList,
      ),
    );
  }
}

class CardItem extends StatefulWidget {
  final String type;
  bool isOpen = false;

  CardItem({super.key, required this.type});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isOpen = !widget.isOpen;
          });
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
              child: Center(
                  child: Text(
                widget.type,
                style: const TextStyle(fontSize: 30),
              )),
            ),
            Visibility(
              visible: !widget.isOpen,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber),
                child: const Center(
                    child: Text(
                  '?',
                  style: TextStyle(fontSize: 30),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
