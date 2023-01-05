// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) sucess,
    required TResult Function(String msg) error,
    required TResult Function(String msg) teste,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> data)? sucess,
    TResult? Function(String msg)? error,
    TResult? Function(String msg)? teste,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? sucess,
    TResult Function(String msg)? error,
    TResult Function(String msg)? teste,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) sucess,
    required TResult Function(Error<T> value) error,
    required TResult Function(Teste<T> value) teste,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? sucess,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Teste<T> value)? teste,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? sucess,
    TResult Function(Error<T> value)? error,
    TResult Function(Teste<T> value)? teste,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeResultCopyWith<T, $Res> {
  factory $HomeResultCopyWith(
          HomeResult<T> value, $Res Function(HomeResult<T>) then) =
      _$HomeResultCopyWithImpl<T, $Res, HomeResult<T>>;
}

/// @nodoc
class _$HomeResultCopyWithImpl<T, $Res, $Val extends HomeResult<T>>
    implements $HomeResultCopyWith<T, $Res> {
  _$HomeResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessCopyWith<T, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<T> value, $Res Function(_$Success<T>) then) =
      __$$SuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> data});
}

/// @nodoc
class __$$SuccessCopyWithImpl<T, $Res>
    extends _$HomeResultCopyWithImpl<T, $Res, _$Success<T>>
    implements _$$SuccessCopyWith<T, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<T> _value, $Res Function(_$Success<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$Success<T>(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$Success<T> implements Success<T> {
  _$Success(final List<T> data) : _data = data;

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'HomeResult<$T>.sucess(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<T> &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      __$$SuccessCopyWithImpl<T, _$Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) sucess,
    required TResult Function(String msg) error,
    required TResult Function(String msg) teste,
  }) {
    return sucess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> data)? sucess,
    TResult? Function(String msg)? error,
    TResult? Function(String msg)? teste,
  }) {
    return sucess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? sucess,
    TResult Function(String msg)? error,
    TResult Function(String msg)? teste,
    required TResult orElse(),
  }) {
    if (sucess != null) {
      return sucess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) sucess,
    required TResult Function(Error<T> value) error,
    required TResult Function(Teste<T> value) teste,
  }) {
    return sucess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? sucess,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Teste<T> value)? teste,
  }) {
    return sucess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? sucess,
    TResult Function(Error<T> value)? error,
    TResult Function(Teste<T> value)? teste,
    required TResult orElse(),
  }) {
    if (sucess != null) {
      return sucess(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements HomeResult<T> {
  factory Success(final List<T> data) = _$Success<T>;

  List<T> get data;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<T, $Res> {
  factory _$$ErrorCopyWith(_$Error<T> value, $Res Function(_$Error<T>) then) =
      __$$ErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$ErrorCopyWithImpl<T, $Res>
    extends _$HomeResultCopyWithImpl<T, $Res, _$Error<T>>
    implements _$$ErrorCopyWith<T, $Res> {
  __$$ErrorCopyWithImpl(_$Error<T> _value, $Res Function(_$Error<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$Error<T>(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error<T> implements Error<T> {
  _$Error(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'HomeResult<$T>.error(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error<T> &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<T, _$Error<T>> get copyWith =>
      __$$ErrorCopyWithImpl<T, _$Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) sucess,
    required TResult Function(String msg) error,
    required TResult Function(String msg) teste,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> data)? sucess,
    TResult? Function(String msg)? error,
    TResult? Function(String msg)? teste,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? sucess,
    TResult Function(String msg)? error,
    TResult Function(String msg)? teste,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) sucess,
    required TResult Function(Error<T> value) error,
    required TResult Function(Teste<T> value) teste,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? sucess,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Teste<T> value)? teste,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? sucess,
    TResult Function(Error<T> value)? error,
    TResult Function(Teste<T> value)? teste,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements HomeResult<T> {
  factory Error(final String msg) = _$Error<T>;

  String get msg;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<T, _$Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TesteCopyWith<T, $Res> {
  factory _$$TesteCopyWith(_$Teste<T> value, $Res Function(_$Teste<T>) then) =
      __$$TesteCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$TesteCopyWithImpl<T, $Res>
    extends _$HomeResultCopyWithImpl<T, $Res, _$Teste<T>>
    implements _$$TesteCopyWith<T, $Res> {
  __$$TesteCopyWithImpl(_$Teste<T> _value, $Res Function(_$Teste<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$Teste<T>(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Teste<T> implements Teste<T> {
  _$Teste(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'HomeResult<$T>.teste(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Teste<T> &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TesteCopyWith<T, _$Teste<T>> get copyWith =>
      __$$TesteCopyWithImpl<T, _$Teste<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) sucess,
    required TResult Function(String msg) error,
    required TResult Function(String msg) teste,
  }) {
    return teste(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> data)? sucess,
    TResult? Function(String msg)? error,
    TResult? Function(String msg)? teste,
  }) {
    return teste?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? sucess,
    TResult Function(String msg)? error,
    TResult Function(String msg)? teste,
    required TResult orElse(),
  }) {
    if (teste != null) {
      return teste(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) sucess,
    required TResult Function(Error<T> value) error,
    required TResult Function(Teste<T> value) teste,
  }) {
    return teste(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? sucess,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Teste<T> value)? teste,
  }) {
    return teste?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? sucess,
    TResult Function(Error<T> value)? error,
    TResult Function(Teste<T> value)? teste,
    required TResult orElse(),
  }) {
    if (teste != null) {
      return teste(this);
    }
    return orElse();
  }
}

abstract class Teste<T> implements HomeResult<T> {
  factory Teste(final String msg) = _$Teste<T>;

  String get msg;
  @JsonKey(ignore: true)
  _$$TesteCopyWith<T, _$Teste<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
