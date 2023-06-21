import 'package:flutter/material.dart';

class CardItem {
  final String type;
  final String image;
  bool isFlip = false;
  // bool isMatch = false;

  CardItem(this.type, this.image);

  static List<CardItem> getLevel1() {
    final cards = <CardItem>[];
    cards.add(CardItem('dragon', 'lib/cardGame/images/chameleon.png'));
    cards.add(CardItem('dragon', 'lib/cardGame/images/charizard.png'));
    cards.add(CardItem('saur', 'lib/cardGame/images/bulbasaur.png'));
    cards.add(CardItem('saur', 'lib/cardGame/images/venusaur.png'));
    cards.add(CardItem('turle', 'lib/cardGame/images/blastoise.png'));
    cards.add(CardItem('turle', 'lib/cardGame/images/squirtle.png'));
    cards.shuffle();

    return cards;
  }
}

class FrontCard extends StatelessWidget {
  final CardItem card;
  const FrontCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: const Color.fromARGB(255, 153, 198, 235),
          child: Image.asset(
            card.image,
          ),
        ));
  }
}

class BackCard extends StatefulWidget {
  const BackCard({super.key});

  @override
  State<BackCard> createState() => _BackCardState();
}

class _BackCardState extends State<BackCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset('lib/cardGame/images/ball.jpg'),
    );
  }
}
