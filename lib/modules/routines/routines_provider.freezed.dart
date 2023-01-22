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
mixin _$RoutinesState {
  String? get activeIdRoutine => throw _privateConstructorUsedError;
  Map<String, Routine> get routines => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutinesStateCopyWith<RoutinesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutinesStateCopyWith<$Res> {
  factory $RoutinesStateCopyWith(
          RoutinesState value, $Res Function(RoutinesState) then) =
      _$RoutinesStateCopyWithImpl<$Res, RoutinesState>;
  @useResult
  $Res call({String? activeIdRoutine, Map<String, Routine> routines});
}

/// @nodoc
class _$RoutinesStateCopyWithImpl<$Res, $Val extends RoutinesState>
    implements $RoutinesStateCopyWith<$Res> {
  _$RoutinesStateCopyWithImpl(this._value, this._then);

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
              as Map<String, Routine>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoutinesStateCopyWith<$Res>
    implements $RoutinesStateCopyWith<$Res> {
  factory _$$_RoutinesStateCopyWith(
          _$_RoutinesState value, $Res Function(_$_RoutinesState) then) =
      __$$_RoutinesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? activeIdRoutine, Map<String, Routine> routines});
}

/// @nodoc
class __$$_RoutinesStateCopyWithImpl<$Res>
    extends _$RoutinesStateCopyWithImpl<$Res, _$_RoutinesState>
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
              as Map<String, Routine>,
    ));
  }
}

/// @nodoc

class _$_RoutinesState implements _RoutinesState {
  _$_RoutinesState(
      {this.activeIdRoutine, required final Map<String, Routine> routines})
      : _routines = routines;

  @override
  final String? activeIdRoutine;
  final Map<String, Routine> _routines;
  @override
  Map<String, Routine> get routines {
    if (_routines is EqualUnmodifiableMapView) return _routines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_routines);
  }

  @override
  String toString() {
    return 'RoutinesState(activeIdRoutine: $activeIdRoutine, routines: $routines)';
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

abstract class _RoutinesState implements RoutinesState {
  factory _RoutinesState(
      {final String? activeIdRoutine,
      required final Map<String, Routine> routines}) = _$_RoutinesState;

  @override
  String? get activeIdRoutine;
  @override
  Map<String, Routine> get routines;
  @override
  @JsonKey(ignore: true)
  _$$_RoutinesStateCopyWith<_$_RoutinesState> get copyWith =>
      throw _privateConstructorUsedError;
}
