import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ScrollbarScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  ScrollbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "ScrollbarScreen",
        body: Scrollbar(
          child: SingleChildScrollView(
              child: Column(
                  children: numbers
                      .map((i) => renderContainer(
                          color: rainbowColors[i % rainbowColors.length],
                          index: i))
                      .toList())),
        ));
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
