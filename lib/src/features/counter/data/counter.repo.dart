import 'package:coodoo_style_flutter_project/src/core/exceptions/app.exception.dart';
import 'package:coodoo_style_flutter_project/src/features/counter/data/counter.interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FakeCounterRepo implements CounterRepo {
  int _value = 0;

  @override
  int get value => _value;

  @override
  Future<int> increment() async {
    _value++;
    return Future.delayed(const Duration(seconds: 1), () {
      if (_value == 4) {
        throw const AppException(message: "Danger value is 4!");
      }
      return value;
    });
  }

  @override
  Future<int> decrement() async {
    if (_value > 0) {
      _value--;
      return Future.delayed(const Duration(seconds: 1), () {
        return value;
      });
    }
    return Future.value(_value);
  }
}
