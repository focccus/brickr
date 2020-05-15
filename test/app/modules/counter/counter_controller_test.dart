import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:brickr/app/modules/counter/counter_controller.dart';
import 'package:brickr/app/modules/counter/counter_module.dart';

void main() {
  initModule(CounterModule());
  // CounterController counter;
  //
  setUp(() {
    //     counter = CounterModule.to.get<CounterController>();
  });

  group('CounterController Test', () {
    //   test("First Test", () {
    //     expect(counter, isInstanceOf<CounterController>());
    //   });

    //   test("Set Value", () {
    //     expect(counter.value, equals(0));
    //     counter.increment();
    //     expect(counter.value, equals(1));
    //   });
  });
}
