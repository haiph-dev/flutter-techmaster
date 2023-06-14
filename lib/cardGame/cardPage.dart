import 'dart:io';

import 'package:flutter/material.dart';

class Item {
  final String type;
  String? photo;
  bool isFlip = false;
  bool isMatch = false;

  Item(this.type);

  static List<Item> getLevel1() {
    final items = <Item>[];

    items.add(Item('cat'));
    items.add(Item('cat'));
    items.add(Item('dog'));
    items.add(Item('dog'));
    items.add(Item('pig'));
    items.add(Item('pig'));

    items.shuffle();
    return items;
  }
}

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
  List<Item> cardList = Item.getLevel1();
  CardGameView({super.key});

  @override
  State<CardGameView> createState() => _CardGameViewState();
}

class _CardGameViewState extends State<CardGameView> {
  int flipCount = 0;

  void checkMatch() async {
    for (int i = 0; i < widget.cardList.length - 1; i++) {
      for (int j = i + 1; j < widget.cardList.length; j++) {
        if (widget.cardList[i].isFlip &&
            widget.cardList[j].isFlip &&
            widget.cardList[i].type == widget.cardList[j].type) {
          widget.cardList[i].isMatch = true;
          widget.cardList[j].isMatch = true;
        }
      }
    }
    for (int i = 0; i < widget.cardList.length; i++) {
      widget.cardList[i].isFlip = false;
    }
    flipCount = 0;
    // sleep(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 2)).then((_) {
      setState(() {});
    });
  }

  void updateCardFlip(int index) async {
    widget.cardList[index].isFlip = true;
    flipCount++;
    setState(() {});
    if (flipCount == 2) checkMatch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            widget.cardList.length,
            (index) => GestureDetector(
              onTap: () => updateCardFlip(index),
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Center(
                    child: Text(
                  widget.cardList[index].isMatch ||
                          widget.cardList[index].isFlip
                      ? widget.cardList[index].type
                      : '?',
                  style: const TextStyle(fontSize: 50),
                )),
              ),
            ),
          ),
        ));
  }
}
