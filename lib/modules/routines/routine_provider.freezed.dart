// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routine_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoutineState {
  String? get activeIdRoutine => throw _privateConstructorUsedError;
  List<Routine> get routines => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutineStateCopyWith<RoutineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineStateCopyWith<$Res> {
  factory $RoutineStateCopyWith(
          RoutineState value, $Res Function(RoutineState) then) =
      _$RoutineStateCopyWithImpl<$Res, RoutineState>;
  @useResult
  $Res call({String? activeIdRoutine, List<Routine> routines});
}

/// @nodoc
class _$RoutineStateCopyWithImpl<$Res, $Val extends RoutineState>
    implements $RoutineStateCopyWith<$Res> {
  _$RoutineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeIdRoutine = freezed,
    Object? routines = null,
  }) {
    return _then(_value.copyWith(
      activeIdRoutine: freezed == activeIdRoutine
          ? _value.activeIdRoutine
          : activeIdRoutine // ignore: cast_nullable_to_non_nullable
              as String?,
      routines: null == routines
          ? _value.routines
          : routines // ignore: cast_nullable_to_non_nullable
              as List<Routine>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoutinesStateCopyWith<$Res>
    implements $RoutineStateCopyWith<$Res> {
  factory _$$_RoutinesStateCopyWith(
          _$_RoutinesState value, $Res Function(_$_RoutinesState) then) =
      __$$_RoutinesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? activeIdRoutine, List<Routine> routines});
}

/// @nodoc
class __$$_RoutinesStateCopyWithImpl<$Res>
    extends _$RoutineStateCopyWithImpl<$Res, _$_RoutinesState>
    implements _$$_RoutinesStateCopyWith<$Res> {
  __$$_RoutinesStateCopyWithImpl(
      _$_RoutinesState _value, $Res Function(_$_RoutinesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeIdRoutine = freezed,
    Object? routines = null,
  }) {
    return _then(_$_RoutinesState(
      activeIdRoutine: freezed == activeIdRoutine
          ? _value.activeIdRoutine
          : activeIdRoutine // ignore: cast_nullable_to_non_nullable
              as String?,
      routines: null == routines
          ? _value._routines
          : routines // ignore: cast_nullable_to_non_nullable
              as List<Routine>,
    ));
  }
}

/// @nodoc

class _$_RoutinesState implements _RoutinesState {
  _$_RoutinesState(
      {this.activeIdRoutine, required final List<Routine> routines})
      : _routines = routines;

  @override
  final String? activeIdRoutine;
  final List<Routine> _routines;
  @override
  List<Routine> get routines {
    if (_routines is EqualUnmodifiableListView) return _routines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routines);
  }

  @override
  String toString() {
    return 'RoutineState(activeIdRoutine: $activeIdRoutine, routines: $routines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoutinesState &&
            (identical(other.activeIdRoutine, activeIdRoutine) ||
                other.activeIdRoutine == activeIdRoutine) &&
            const DeepCollectionEquality().equals(other._routines, _routines));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeIdRoutine,
      const DeepCollectionEquality().hash(_routines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoutinesStateCopyWith<_$_RoutinesState> get copyWith =>
      __$$_RoutinesStateCopyWithImpl<_$_RoutinesState>(this, _$identity);
}

abstract class _RoutinesState implements RoutineState {
  factory _RoutinesState(
      {final String? activeIdRoutine,
      required final List<Routine> routines}) = _$_RoutinesState;

  @override
  String? get activeIdRoutine;
  @override
  List<Routine> get routines;
  @override
  @JsonKey(ignore: true)
  _$$_RoutinesStateCopyWith<_$_RoutinesState> get copyWith =>
      throw _privateConstructorUsedError;
}
