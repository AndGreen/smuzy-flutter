// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DaysState {
  Map<int, String?> get visibleDayGrid => throw _privateConstructorUsedError;
  DateTime get visibleDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DaysStateCopyWith<DaysState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaysStateCopyWith<$Res> {
  factory $DaysStateCopyWith(DaysState value, $Res Function(DaysState) then) =
      _$DaysStateCopyWithImpl<$Res, DaysState>;
  @useResult
  $Res call({Map<int, String?> visibleDayGrid, DateTime visibleDate});
}

/// @nodoc
class _$DaysStateCopyWithImpl<$Res, $Val extends DaysState>
    implements $DaysStateCopyWith<$Res> {
  _$DaysStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visibleDayGrid = null,
    Object? visibleDate = null,
  }) {
    return _then(_value.copyWith(
      visibleDayGrid: null == visibleDayGrid
          ? _value.visibleDayGrid
          : visibleDayGrid // ignore: cast_nullable_to_non_nullable
              as Map<int, String?>,
      visibleDate: null == visibleDate
          ? _value.visibleDate
          : visibleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DaysStateCopyWith<$Res> implements $DaysStateCopyWith<$Res> {
  factory _$$_DaysStateCopyWith(
          _$_DaysState value, $Res Function(_$_DaysState) then) =
      __$$_DaysStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, String?> visibleDayGrid, DateTime visibleDate});
}

/// @nodoc
class __$$_DaysStateCopyWithImpl<$Res>
    extends _$DaysStateCopyWithImpl<$Res, _$_DaysState>
    implements _$$_DaysStateCopyWith<$Res> {
  __$$_DaysStateCopyWithImpl(
      _$_DaysState _value, $Res Function(_$_DaysState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visibleDayGrid = null,
    Object? visibleDate = null,
  }) {
    return _then(_$_DaysState(
      visibleDayGrid: null == visibleDayGrid
          ? _value._visibleDayGrid
          : visibleDayGrid // ignore: cast_nullable_to_non_nullable
              as Map<int, String?>,
      visibleDate: null == visibleDate
          ? _value.visibleDate
          : visibleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DaysState implements _DaysState {
  _$_DaysState(
      {required final Map<int, String?> visibleDayGrid,
      required this.visibleDate})
      : _visibleDayGrid = visibleDayGrid;

  final Map<int, String?> _visibleDayGrid;
  @override
  Map<int, String?> get visibleDayGrid {
    if (_visibleDayGrid is EqualUnmodifiableMapView) return _visibleDayGrid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_visibleDayGrid);
  }

  @override
  final DateTime visibleDate;

  @override
  String toString() {
    return 'DaysState(visibleDayGrid: $visibleDayGrid, visibleDate: $visibleDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DaysState &&
            const DeepCollectionEquality()
                .equals(other._visibleDayGrid, _visibleDayGrid) &&
            (identical(other.visibleDate, visibleDate) ||
                other.visibleDate == visibleDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_visibleDayGrid), visibleDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DaysStateCopyWith<_$_DaysState> get copyWith =>
      __$$_DaysStateCopyWithImpl<_$_DaysState>(this, _$identity);
}

abstract class _DaysState implements DaysState {
  factory _DaysState(
      {required final Map<int, String?> visibleDayGrid,
      required final DateTime visibleDate}) = _$_DaysState;

  @override
  Map<int, String?> get visibleDayGrid;
  @override
  DateTime get visibleDate;
  @override
  @JsonKey(ignore: true)
  _$$_DaysStateCopyWith<_$_DaysState> get copyWith =>
      throw _privateConstructorUsedError;
}
