// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportsState {
  List<RoutineReport> get routinesReports => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportsStateCopyWith<ReportsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsStateCopyWith<$Res> {
  factory $ReportsStateCopyWith(
          ReportsState value, $Res Function(ReportsState) then) =
      _$ReportsStateCopyWithImpl<$Res, ReportsState>;
  @useResult
  $Res call({List<RoutineReport> routinesReports});
}

/// @nodoc
class _$ReportsStateCopyWithImpl<$Res, $Val extends ReportsState>
    implements $ReportsStateCopyWith<$Res> {
  _$ReportsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routinesReports = null,
  }) {
    return _then(_value.copyWith(
      routinesReports: null == routinesReports
          ? _value.routinesReports
          : routinesReports // ignore: cast_nullable_to_non_nullable
              as List<RoutineReport>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportsStateCopyWith<$Res>
    implements $ReportsStateCopyWith<$Res> {
  factory _$$_ReportsStateCopyWith(
          _$_ReportsState value, $Res Function(_$_ReportsState) then) =
      __$$_ReportsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RoutineReport> routinesReports});
}

/// @nodoc
class __$$_ReportsStateCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$_ReportsState>
    implements _$$_ReportsStateCopyWith<$Res> {
  __$$_ReportsStateCopyWithImpl(
      _$_ReportsState _value, $Res Function(_$_ReportsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routinesReports = null,
  }) {
    return _then(_$_ReportsState(
      routinesReports: null == routinesReports
          ? _value._routinesReports
          : routinesReports // ignore: cast_nullable_to_non_nullable
              as List<RoutineReport>,
    ));
  }
}

/// @nodoc

class _$_ReportsState implements _ReportsState {
  _$_ReportsState({required final List<RoutineReport> routinesReports})
      : _routinesReports = routinesReports;

  final List<RoutineReport> _routinesReports;
  @override
  List<RoutineReport> get routinesReports {
    if (_routinesReports is EqualUnmodifiableListView) return _routinesReports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routinesReports);
  }

  @override
  String toString() {
    return 'ReportsState(routinesReports: $routinesReports)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportsState &&
            const DeepCollectionEquality()
                .equals(other._routinesReports, _routinesReports));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_routinesReports));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportsStateCopyWith<_$_ReportsState> get copyWith =>
      __$$_ReportsStateCopyWithImpl<_$_ReportsState>(this, _$identity);
}

abstract class _ReportsState implements ReportsState {
  factory _ReportsState({required final List<RoutineReport> routinesReports}) =
      _$_ReportsState;

  @override
  List<RoutineReport> get routinesReports;
  @override
  @JsonKey(ignore: true)
  _$$_ReportsStateCopyWith<_$_ReportsState> get copyWith =>
      throw _privateConstructorUsedError;
}
