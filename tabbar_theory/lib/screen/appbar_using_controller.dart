import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class AppbarUsingController extends StatefulWidget {
  const AppbarUsingController({Key? key}) : super(key: key);

  @override
  State<AppbarUsingController> createState() => _AppbarUsingControllerState();
}

class _AppbarUsingControllerState extends State<AppbarUsingController>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: TABS.length, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appbar using controller"),
        bottom: TabBar(
            controller: tabController,
            tabs: TABS
                .map((e) => Tab(
                      icon: Icon(e.icon),
                      child: Text(e.label),
                    ))
                .toList()),
      ),
      body: TabBarView(
          controller: tabController,
          children: TABS
              .map((e) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(e.icon),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (tabController.index != 0)
                            ElevatedButton(
                                onPressed: () {
                                  tabController
                                      .animateTo(tabController.index - 1);
                                },
                                child: const Text('이전')),
                          const SizedBox(
                            width: 16.0,
                          ),
                          if (tabController.index != TABS.length - 1)
                            ElevatedButton(
                                onPressed: () {
                                  tabController
                                      .animateTo(tabController.index + 1);
                                },
                                child: const Text('다음'))
                        ],
                      )
                    ],
                  ))
              .toList()),
    );
  }
}
