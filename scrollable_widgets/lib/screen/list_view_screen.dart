import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: "ListViewScreen", body: renderBuilder());
  }

  // 한 번에 다 그림
  Widget renderDefault() {
    return MainLayout(
        title: "ListViewScreen",
        body: ListView(
          children: numbers
              .map((i) => renderContainer(
                  color: rainbowColors[i % rainbowColors.length], index: i))
              .toList(),
        ));
  }

  // builder를 쓰면 화면에 보이는 것을 그림 (스크롤로 지나가면 지워짐 => 보이면 다시 그림)
  Widget renderBuilder() {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index));
  }

  // 중간 중간에 위젯 그릴 수 있음
  Widget renderSeparated() {
    return ListView.separated(
        itemCount: 100,
        itemBuilder: (context, index) => renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index),
        // 아이템 중간 중간에 Widget을 끼워 넣을 수 있음
        separatorBuilder: (context, index) {
          index += 1;

          // 5개의 아이템마다 배너 보여주기
          if (index % 5 == 0) {
            return renderContainer(
                color: Colors.black, index: index, height: 100);
          }
          return Container();
        });
  }

  Widget renderContainer(
      {required Color color, required int index, double? height}) {
    print(index);
    return Container(
      height: height ?? 300.0,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30.0),
        ),
      ),
    );
  }
}
