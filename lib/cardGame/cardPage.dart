import 'package:flutter/material.dart';
import 'cardItem.dart';

class CardGame extends StatelessWidget {
  const CardGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Card Game'),
        ),
        body: CardGameView());
  }
}

class CardGameView extends StatefulWidget {
  CardGameView({super.key});

  @override
  State<CardGameView> createState() => _CardGameViewState();
}

class _CardGameViewState extends State<CardGameView> {
  // List<CardItem> cards = CardItem.getLevel1();
  late List<CardItem> cards;
  bool flipable = true;
  String lastFlip = '';
  bool gameover = true;
  late int noCardsInLine;

  @override
  Widget build(BuildContext context) {
    if (gameover == true) {
      return Container(
        width: double.infinity,
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  cards = CardItem.getLevel1();
                  noCardsInLine = 2;
                  gameover = false;
                  setState(() {});
                },
                child: const Text('Level 1 (2x3)')),
            ElevatedButton(
                onPressed: () {
                  cards = CardItem.getLevel2();
                  noCardsInLine = 3;
                  gameover = false;
                  setState(() {});
                },
                child: const Text('Level 2 (3x3)'))
          ],
        ),
      );
    }
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: noCardsInLine,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          final card = cards[index];
          if (card.isFlip) {
            return FrontCard(card: card);
          } else {
            return GestureDetector(
                onTap: () => onTapCallback(card), child: const BackCard());
          }
        },
        physics: const NeverScrollableScrollPhysics());
  }

  void onTapCallback(CardItem justFlip) {
    //check if all flip -> gameover
    int countFlip = cards.where((e) => e.isFlip == false).length;
    print('countFlip: $countFlip');
    if (countFlip == 1) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          gameover = true;
        });
      });
    }

    //not flipable cause still in wrong flip delay
    if (!flipable) {
      print('flipable: $flipable');
      return;
    }

    int countExistNotFlip =
        cards.where((e) => e.type == lastFlip && e.isFlip == false).length;
    if (justFlip.type == lastFlip || countExistNotFlip == 0) {
      //flip correct means justFlip has the same type with lastFlip, or all of lastType had been flipped and flip new type
      justFlip.isFlip = true;
      lastFlip = justFlip.type;
    } else {
      //flip wrong type keep card for 1s then flip all cards
      justFlip.isFlip = true;
      flipable = false;
      lastFlip = '';
      Future.delayed(const Duration(seconds: 1), () {
        for (CardItem card in cards) {
          card.isFlip = false;
        }
        flipable = true;
        setState(() {});
      });
    }

    setState(() {});
  }
}
