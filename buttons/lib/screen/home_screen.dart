import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('버튼')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    /**
                     * Material State
                     * hovered - 호버링 상태 (마우스 커서를 올려 놓은 상태)
                     * focused - 포커스 됐을 때 (텍스트 필드)
                     * pressed - 눌렀을 때
                     * dragged - 드래그 됐을 때
                     * selected - 선택 됐을 때(체크박스, 라디오 버튼)
                     * scrollUnder - 다른 컴포넌트 밑으로 스크롤링 됐을 때
                     * disabled - 비활성화 됐을 때
                     * error - 에러 상태
                     */

                    backgroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  }

                  return Colors.black;
                }), foregroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.white;
                  }

                  return Colors.red;
                }), padding: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const EdgeInsets.all(100.0);
                  }

                  return const EdgeInsets.all(20.0);
                })),
                child: const Text("ButtonStyle")),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    // 메인 색
                    backgroundColor: Colors.red,
                    // 글자 및 애니메이션 색
                    foregroundColor: Colors.black,
                    // 그림자 색
                    shadowColor: Colors.green,
                    // 3D 입체감의 높이
                    elevation: 10.0,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20.0),
                    padding: const EdgeInsets.all(32.0),
                    side: const BorderSide(color: Colors.black, width: 4.0)),
                child: const Text("ElevatedButton")),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.yellow,
                    elevation: 10.0),
                child: const Text('OutlinedButton')),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.brown,
                  backgroundColor: Colors.blue,
                ),
                child: const Text('TextButton'))
          ],
        ),
      ),
    );
  }
}
