import 'dart:async';

void main() {
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.where((val) => val % 2 == 0).listen((val) {
    print("Listener1 : $val");
  });

  final streamListener2 = stream.where((val) => val % 2 == 1).listen((val) {
    print("Listener2 : $val");
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
  controller.sink.add(6);
}
