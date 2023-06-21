import 'package:flutter/material.dart';
import 'cardItem.dart';

class CardGame extends StatelessWidget {
  const CardGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
  List<CardItem> cards = CardItem.getLevel1();
  bool flipable = true;
  String lastFlip = '';

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
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
