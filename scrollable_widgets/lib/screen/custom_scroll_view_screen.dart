import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [renderSliverAppbar(), renderSliverGridBuilder()],
      ),
    );
  }

  // ListView 기본 생성자와 유사함
  SliverList renderChildSliverList() {
    return SliverList(
        delegate: SliverChildListDelegate(
      numbers
          .map((e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length], index: e))
          .toList(),
    ));
  }

  // AppBar
  SliverAppBar renderSliverAppbar() {
    return const SliverAppBar(
      // 스크롤 했을 때, 리스트의 중간에도 Appbar가 내려오게 할 수 있음.
      floating: true,
      // AppBar 상단 완전 고정
      pinned: false,
      // 자석 효과(살짝 당겨도 appBar 보임)
      // floating이 true일 때만 사용 가능
      snap: true,
      // 맨 위에서 한계 이상으로 스크롤 했을 때, 남는 공간을 차지
      stretch: true,

      // 확장된 상태에서 높이
      expandedHeight: 200,
      // 접힐 때 높이
      collapsedHeight: 150,
      // appBar를 꾸밀 수 있음
      flexibleSpace: FlexibleSpaceBar(title: Text("FlexibleSpace")),
      title: Text("CustomScrollViewScreen"),
    );
  }

  // ListView.builder 생성자와 유사함
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      }, childCount: 100),
    );
  }

  // GridView.count와 유사함
  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
        delegate: SliverChildListDelegate(
          numbers
              .map((e) => renderContainer(
                  color: rainbowColors[e % rainbowColors.length], index: e))
              .toList(),
        ),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2));
  }

  // GridView.builder와 유사함
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        }, childCount: 100),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150));
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
