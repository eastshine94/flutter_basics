import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  SingleChildScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'SingleChildScrollView', body: renderPerformance());
  }

  // 기본 랜더링법
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
          children: rainbowColors
              .map((c) => renderContainer(
                    color: c,
                  ))
              .toList()),
    );
  }

  // 화면을 넘어가지 않아도 스크롤되게 하기
  Widget renderAlwaysScroll() {
    return MainLayout(
        title: 'SingleChildScrollView',
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [renderContainer(color: Colors.black)],
          ),
        ));
  }

  // 위젯이 잘리지 않게 하기
  Widget renderClip() {
    return MainLayout(
        title: 'SingleChildScrollView',
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [renderContainer(color: Colors.black)],
          ),
        ));
  }

  // 여러가지 physics 정리
  Widget renderPhysics() {
    return MainLayout(
        title: 'SingleChildScrollView',
        body: SingleChildScrollView(
          // NeverScrollableScrollPhysics - 스크롤 안됨
          // AlwaysScrollableScrollPhysics - 무조건 스크롤 됨
          // BouncingScrollPhysics - 스크롤 팅김(IOS 스타일)
          // ClampingScrollPhysics - 스크롤 안팅김(Android 스타일)
          physics: const ClampingScrollPhysics(),
          child: Column(
              children: rainbowColors
                  .map((c) => renderContainer(
                        color: c,
                      ))
                  .toList()),
        ));
  }

  // SingleChildScrollView 퍼포먼스
  // SingleChildScrollView는 보이지 않는 영역도 rendering을 다해버림
  // 그래서 많은 위젯이 있는 경우, 성능 상 이슈가 있을 수 있음
  Widget renderPerformance() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
          children: numbers
              .map((i) => renderContainer(
                  color: rainbowColors[i % rainbowColors.length], index: i))
              .toList()),
    );
  }

  Widget renderContainer({required Color color, int? index}) {
    if (index != null) {
      print(index);
    }
    return Container(
      height: 300.0,
      color: color,
    );
  }
}
