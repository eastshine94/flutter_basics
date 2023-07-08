import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate(
      {required this.child, required this.maxHeight, required this.minHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // 최대 높이
  double get maxExtent => maxHeight;

  @override
  // 최소 높이
  double get minExtent => minHeight;

  @override
  // covariant - 상속된 클래스도 사용 가능
  // covariant SliverPersistentHeaderDelegate
  // oldDelegate - build가 실행이 됐을 때 이전 Delegate
  // this - 새로운 delegate
  //shouldRebuild - 새로 build를 해야할지 말지 결정
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppbar(),
          renderHeader(),
          renderBuilderSliverList(),
          renderHeader(),
          renderSliverGridBuilder(),
          renderHeader(),
          renderBuilderSliverList()
        ],
      ),
    );
  }

  // Header
  SliverPersistentHeader renderHeader() {
    return SliverPersistentHeader(
        pinned: true,
        delegate: _SliverFixedHeaderDelegate(
          child: Container(
              color: Colors.black,
              child: const Center(
                child: Text(
                  "신기 신기",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          minHeight: 50,
          maxHeight: 200,
        ));
  }

  // AppBar
  SliverAppBar renderSliverAppbar() {
    return SliverAppBar(
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
      collapsedHeight: 200,
      // appBar를 꾸밀 수 있음
      flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            'asset/img/image_1.jpeg',
            fit: BoxFit.cover,
          ),
          title: const Text("FlexibleSpace")),
      title: const Text("CustomScrollViewScreen"),
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
