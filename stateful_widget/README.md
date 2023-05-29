## Widget 이론

- Widget은 모두 "불변"의 법칙을 갖고 있다.
- 하지만 위젯의 값을 변경해야할 때가 있다.
- 변경이 필요하면 기존 위젯을 삭제해버리고 완전 새로운 위젯으로 대체한다.

## StatelessWidget 라이프 사이클(Life Cycle)

![image](https://github.com/eastshine94/flutter_basics/assets/41350459/cf4390e4-af08-433a-abaf-be48e384e513)

- Constructor로 생성이 되고 생성이 되자마자 build 함수가 실행된다.
- 이전 Container 예제와 마찬가지로 변경이 필요하면 새로운 위젯을 만들어버린다.
- 하나의 StatelessWidget은 라이프 사이클동안 단 한 번만 build 함수를 실행한다.

## StatefulWidget 라이프 사이클(Life Cycle)

![image](https://github.com/eastshine94/flutter_basics/assets/41350459/3ff8c55d-2375-4935-a15d-d84e82f0f95b)

Constructor => createState => initState => didChangeDependencies => dirty => build => clean => deactivate => dispose

### 파라미터가 바뀌었을 때 생명 주기

Constructor => didUpdateWidget => dirty => build => clean

### setState를 실행했을 때 생명 주기

setState => dirty => build => clean
