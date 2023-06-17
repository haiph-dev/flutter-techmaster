import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_techmaster/cardGame/item.dart';

class Item {
  final String type;
  String? photo;
  bool isFlip = false;
  // bool isMatch = false;

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
  int lastFlip = -1;
  bool flipable = true;

  void updateCardFlip(int index) async {
    if (flipable == false) return;
    widget.cardList[index].isFlip = true;
    print('index: $index : ${widget.cardList[index].type}');
    setState(() {});

    if (lastFlip > -1) {
      if (widget.cardList[index].type != widget.cardList[lastFlip].type) {
        widget.cardList[index].isFlip = false;
        widget.cardList[lastFlip].isFlip = false;
        flipable = false;
        await Future.delayed(Duration(seconds: 2), () {
          setState(() {});
        });

        flipable = true;
      }
      lastFlip = -1;
      print('lastFlip: $lastFlip');
    } else {
      lastFlip = index;
      print('lastFlip: $lastFlip');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(10), child: FrontCard());
  }
}
