import 'dart:io';

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

class SingletonCardList {
  List<CardItem> list = [];
  final String name = 'SingletonCardList';

  static final SingletonCardList _singleton = SingletonCardList._internal();

  factory SingletonCardList() {
    return _singleton;
  }

  SingletonCardList._internal();

  void initList({required List<CardItem> input}) {
    list = input;
    list.shuffle();
    for (int i = 0; i < list.length; i++) {
      list[i].index = i;
    }
  }

  List<CardItem> getList() {
    return list;
  }

  void checkMatch(int index) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].isOpen) {
        if (i != index && list[i].type == list[index].type) {
          list[i].isMatch = true;
          list[index].isMatch = true;
        } else {
          list[i].isOpen = false;
        }
      }
    }
  }
}

class CardGameView extends StatefulWidget {
  const CardGameView({super.key});

  @override
  State<CardGameView> createState() => _CardGameViewState();
}

class _CardGameViewState extends State<CardGameView> {
  final singletonCardList = SingletonCardList().initList(input: [
    CardItem(type: 'cat'),
    CardItem(type: 'cat'),
    CardItem(type: 'dog'),
    CardItem(type: 'dog'),
    CardItem(type: 'pig'),
    CardItem(type: 'pig')
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        children: SingletonCardList().list,
      ),
    );
  }
}

class CardItem extends StatefulWidget {
  final String type;
  late int index;
  bool isOpen = false;
  bool isMatch = false;

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
            print(
                'index: ${widget.index} type: ${widget.type} open: ${widget.isOpen} match: ${widget.isMatch}');
            sleep(const Duration(seconds: 2));
            SingletonCardList().checkMatch(widget.index);
            print(
                'index: ${widget.index} type: ${widget.type} open: ${widget.isOpen} match: ${widget.isMatch}');
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
              visible: !widget.isOpen || widget.isMatch,
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
