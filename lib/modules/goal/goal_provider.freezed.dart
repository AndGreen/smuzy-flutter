// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoalState {
  List<GoalRoutine> get visibleGoals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoalStateCopyWith<GoalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalStateCopyWith<$Res> {
  factory $GoalStateCopyWith(GoalState value, $Res Function(GoalState) then) =
      _$GoalStateCopyWithImpl<$Res, GoalState>;
  @useResult
  $Res call({List<GoalRoutine> visibleGoals});
}

/// @nodoc
class _$GoalStateCopyWithImpl<$Res, $Val extends GoalState>
    implements $GoalStateCopyWith<$Res> {
  _$GoalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visibleGoals = null,
  }) {
    return _then(_value.copyWith(
      visibleGoals: null == visibleGoals
          ? _value.visibleGoals
          : visibleGoals // ignore: cast_nullable_to_non_nullable
              as List<GoalRoutine>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoalStateCopyWith<$Res> implements $GoalStateCopyWith<$Res> {
  factory _$$_GoalStateCopyWith(
          _$_GoalState value, $Res Function(_$_GoalState) then) =
      __$$_GoalStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GoalRoutine> visibleGoals});
}

/// @nodoc
class __$$_GoalStateCopyWithImpl<$Res>
    extends _$GoalStateCopyWithImpl<$Res, _$_GoalState>
    implements _$$_GoalStateCopyWith<$Res> {
  __$$_GoalStateCopyWithImpl(
      _$_GoalState _value, $Res Function(_$_GoalState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visibleGoals = null,
  }) {
    return _then(_$_GoalState(
      visibleGoals: null == visibleGoals
          ? _value._visibleGoals
          : visibleGoals // ignore: cast_nullable_to_non_nullable
              as List<GoalRoutine>,
    ));
  }
}

/// @nodoc

class _$_GoalState implements _GoalState {
  _$_GoalState({required final List<GoalRoutine> visibleGoals})
      : _visibleGoals = visibleGoals;

  final List<GoalRoutine> _visibleGoals;
  @override
  List<GoalRoutine> get visibleGoals {
    if (_visibleGoals is EqualUnmodifiableListView) return _visibleGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visibleGoals);
  }

  @override
  String toString() {
    return 'GoalState(visibleGoals: $visibleGoals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoalState &&
            const DeepCollectionEquality()
                .equals(other._visibleGoals, _visibleGoals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_visibleGoals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoalStateCopyWith<_$_GoalState> get copyWith =>
      __$$_GoalStateCopyWithImpl<_$_GoalState>(this, _$identity);
}

abstract class _GoalState implements GoalState {
  factory _GoalState({required final List<GoalRoutine> visibleGoals}) =
      _$_GoalState;

  @override
  List<GoalRoutine> get visibleGoals;
  @override
  @JsonKey(ignore: true)
  _$$_GoalStateCopyWith<_$_GoalState> get copyWith =>
      throw _privateConstructorUsedError;
}
