import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 안드로이드 시스템 뒤로가기 막을 수 있음
        //true - Pop 가능
        //false - Pop 불가능
        final canPop = Navigator.of(context).canPop();
        return canPop;
      },
      child: MainLayout(title: "Home Screen", children: [
        ElevatedButton(
            onPressed: () {
              print(Navigator.of(context).canPop());
            },
            child: const Text('Can Pop')),
        ElevatedButton(
            onPressed: () {
              // 뒤에 있다면 pop
              Navigator.of(context).maybePop();
            },
            child: const Text('Maybe Pop')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Pop')),
        ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const RouteOneScreen(
                        number: 123,
                      )));
              print(result);
            },
            child: const Text("Push"))
      ]),
    );
  }
}
