import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListViewBook extends StatelessWidget {
  const ListViewBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('List View Book'),
          actions: [
            Icon(
              Icons.navigate_next,
              size: 50,
            )
          ],
        ),
        body: ListViewHoriontal());
    ;
  }
}

class ListViewHoriontal extends StatefulWidget {
  const ListViewHoriontal({super.key});

  @override
  State<ListViewHoriontal> createState() => _ListViewHoriontalState();
}

class _ListViewHoriontalState extends State<ListViewHoriontal> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return BookView(index: index);
        },
        itemCount: 3);
  }
}

class BookView extends StatelessWidget {
  final int index;
  const BookView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: index % 2 == 0 ? Colors.blue : Colors.grey,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Book Name',
            style: TextStyle(fontSize: 30),
          ),
          Container(
            height: 200,
            child: Image.network(
                'https://docs.flutter.dev/assets/images/docs/cover/beginning-app-development-with-flutter.jpg'),
          ),
          Text(
            'Description Description',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
