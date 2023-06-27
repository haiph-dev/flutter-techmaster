import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildTab();
  }
}

class buildTab extends StatefulWidget {
  const buildTab({super.key});

  @override
  State<buildTab> createState() => _buildTabState();
}

class _buildTabState extends State<buildTab> {
  late TabController tabController;
  final tabItems = <Widget>[];
  final pages = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar Demo'),
      ),
      body: Column(
        children: [
          TabBar(
            tabs: tabItems,
          ),
        ],
      ),
    );
  }
}
