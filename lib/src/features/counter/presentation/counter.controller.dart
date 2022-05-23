import 'package:coodoo_style_flutter_project/src/features/counter/data/counter.interface.dart';
import 'package:coodoo_style_flutter_project/src/features/counter/presentation/counter.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterControllerProvider =
    StateNotifierProvider.autoDispose<CounterController, CounterState>((ref) {
  return CounterController(counterRepo: ref.watch(counterRepoProvider));
});

class CounterController extends StateNotifier<CounterState> {
  CounterController({required this.counterRepo})
      : super(const CounterState()) {
    init();
  }

  final CounterRepo counterRepo;

  void init() {
    state = state.copyWith(value: AsyncValue.data(counterRepo.value));
  }

  Future<void> increment() async {
    state = state.copyWith(value: const AsyncValue.loading());
    state = state.copyWith(
        value: await AsyncValue.guard(() => counterRepo.increment()));
  }

  Future<void> decrement() async {
    state = state.copyWith(value: const AsyncValue.loading());
    state = state.copyWith(
        value: await AsyncValue.guard(() => counterRepo.decrement()));
  }
}
