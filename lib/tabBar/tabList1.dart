import 'package:flutter/material.dart';

class tabList1 extends StatefulWidget {
  const tabList1({super.key});

  @override
  State<tabList1> createState() => _tabList1State();
}

class _tabList1State extends State<tabList1> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Tab 1'),
        Text('Tab 1'),
        Text('Tab 1'),
        Text('Tab 1'),
        Text('Tab 1'),
        Text('Tab 1')
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Tab 1');
  }
}
