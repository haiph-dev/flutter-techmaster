import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    Future<http.Response> fetchUser(http.Client client) async {
      return client.get(Uri.parse('http://api.quynhtao.com/api/users'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('List View Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
      ),
    );
  }
}
