import 'package:flutter/material.dart';
import 'package:noteapp/Overview/ShowNotePage.dart';
import 'package:noteapp/Overview/overview.dart';

class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({super.key});

  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Công viêcl",
              ),
              Tab(
                text: "học tập",
              ),
              Tab(
                text: "Riêng  tư",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: OverviewScreen(),
            ),
            Center(
              child: OverviewScreen(),
            ),
            Center(
              child: OverviewScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
