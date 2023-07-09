import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TABS.length * 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("BasicAppBarScreen"),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabBar(
                      indicatorColor: Colors.red,
                      indicatorWeight: 4.0,
                      // tab: 전체 사이즈
                      // label: label 영역만
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      labelColor: Colors.yellow,
                      unselectedLabelColor: Colors.black,
                      labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                      unselectedLabelStyle:
                          const TextStyle(fontWeight: FontWeight.w100),
                      tabs: [...TABS, ...TABS, ...TABS]
                          .map((e) =>
                              Tab(icon: Icon(e.icon), child: Text(e.label)))
                          .toList()),
                ],
              ),
            ),
          ),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [...TABS, ...TABS, ...TABS]
                  .map((e) => Center(
                        child: Icon(e.icon),
                      ))
                  .toList()),
        ));
  }
}
