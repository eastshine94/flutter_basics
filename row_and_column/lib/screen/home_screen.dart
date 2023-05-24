import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Container(
        color: Colors.black,
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Column(
          /**
           * mainAxisAlignment - 주축 정렬
           * start: 시작
           * end: 끝
           * center: 가운데
           * spaceBetween - 위젯과 위젯의 사이가 동일하게 배치
           * spaceEvenly - 위젯을 같은 간격으로 배치하지만 끝과 끝에도 위젯이 아닌 빈 간격으로 시작
           * spaceAround - spaceEvenly + 끝과 끝의 간격은 1/2
           */
          mainAxisAlignment: MainAxisAlignment.start,
          /**
           * CrossAxisAlignment - 반대축 정렬
           * start: 시작
           * end: 끝
           * center: 가운데
           * stretch: 최대로 늘린다
           */
          crossAxisAlignment: CrossAxisAlignment.start,
          /**
           * MainAxisSize: 주축 크기
           * max: 최대
           * min: 최소
           */
          mainAxisSize: MainAxisSize.max,
          children: [
            /**
             * Expanded: 남아있는 공간을 나눠먹음
             * - flex: 나눠먹는 비율
             * Flexible: 가진 영역 중 설정한 높이, 넓이만큼만 가지고 남아있는 공간을 버림
             */
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.red,
                width: 50.0,
                height: 50.0,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.orange,
                width: 50.0,
                height: 50.0,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.pink,
                width: 50.0,
                height: 50.0,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                width: 50.0,
                height: 50.0,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
