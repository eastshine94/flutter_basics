import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TABS.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("BasicAppBarScreen"),
            bottom: TabBar(
                tabs: TABS
                    .map((e) => Tab(icon: Icon(e.icon), child: Text(e.label)))
                    .toList()),
          ),
          body: const Column(children: []),
        ));
  }
}
