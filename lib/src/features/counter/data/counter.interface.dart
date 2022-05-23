
import 'package:coodoo_style_flutter_project/src/features/counter/data/counter.repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterRepoProvider = Provider<CounterRepo>((ref) {
  return FakeCounterRepo();
});

abstract class CounterRepo {
  int get value;
  Future<int> increment();
  Future<int> decrement();
}
