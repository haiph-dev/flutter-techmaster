import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user/user.dart';

//fetch users from API
Future<List<User>> fetchUsers(http.Client client) async {
  final response =
      await client.get(Uri.parse('http://api.quynhtao.com/api/users'));
  // print(response.body);
  return compute(parseUsers, response.body);
}

List<User> parseUsers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  List<User> temp = parsed.map<User>((json) => User.fromMap(json)).toList();
  // print(temp.toString());
  return temp;
}

//build page
class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List View Demo'),
          backgroundColor: Colors.lightBlue,
        ),
        body: FutureBuilder<List<User>>(
            future: fetchUsers(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Network Error', style: TextStyle(fontSize: 50)),
                );
              } else if (snapshot.hasData) {
                return UserListView(users: snapshot.data!);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

class UserListView extends StatelessWidget {
  final List<User> users;

  const UserListView({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    // print(users);
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(users[index].avatar ?? ""),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    users[index].name ?? "",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          );
        });
  }
}
