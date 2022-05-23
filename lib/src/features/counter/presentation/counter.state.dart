import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.state.freezed.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState(
      {@Default(AsyncValue.loading()) AsyncValue<int> value}) = _CounterState;
}
