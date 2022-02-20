// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repo_detail_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RepoDetailStateTearOff {
  const _$RepoDetailStateTearOff();

  _Initial initial({bool hasStarredStatuschange = false}) {
    return _Initial(
      hasStarredStatuschange: hasStarredStatuschange,
    );
  }

  _LoadInProggress loadInProggress({bool hasStarredStatuschange = false}) {
    return _LoadInProggress(
      hasStarredStatuschange: hasStarredStatuschange,
    );
  }

  _LoadSuccess loadSuccess(Fresh<GithubRepoDetail?> repoDetail,
      {bool hasStarredStatuschange = false}) {
    return _LoadSuccess(
      repoDetail,
      hasStarredStatuschange: hasStarredStatuschange,
    );
  }

  _LoadFailure loadFailure(GithubFailure failure,
      {bool hasStarredStatuschange = false}) {
    return _LoadFailure(
      failure,
      hasStarredStatuschange: hasStarredStatuschange,
    );
  }
}

/// @nodoc
const $RepoDetailState = _$RepoDetailStateTearOff();

/// @nodoc
mixin _$RepoDetailState {
  bool get hasStarredStatuschange => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatuschange) initial,
    required TResult Function(bool hasStarredStatuschange) loadInProggress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatuschange)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool hasStarredStatuschange)? initial,
    TResult Function(bool hasStarredStatuschange)? loadInProggress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatuschange)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatuschange)? initial,
    TResult Function(bool hasStarredStatuschange)? loadInProggress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatuschange)?
        loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProggress value) loadInProggress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProggress value)? loadInProggress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProggress value)? loadInProggress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoDetailStateCopyWith<RepoDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoDetailStateCopyWith<$Res> {
  factory $RepoDetailStateCopyWith(
          RepoDetailState value, $Res Function(RepoDetailState) then) =
      _$RepoDetailStateCopyWithImpl<$Res>;
  $Res call({bool hasStarredStatuschange});
}

/// @nodoc
class _$RepoDetailStateCopyWithImpl<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  _$RepoDetailStateCopyWithImpl(this._value, this._then);

  final RepoDetailState _value;
  // ignore: unused_field
  final $Res Function(RepoDetailState) _then;

  @override
  $Res call({
    Object? hasStarredStatuschange = freezed,
  }) {
    return _then(_value.copyWith(
      hasStarredStatuschange: hasStarredStatuschange == freezed
          ? _value.hasStarredStatuschange
          : hasStarredStatuschange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({bool hasStarredStatuschange});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$RepoDetailStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? hasStarredStatuschange = freezed,
  }) {
    return _then(_Initial(
      hasStarredStatuschange: hasStarredStatuschange == freezed
          ? _value.hasStarredStatuschange
          : hasStarredStatuschange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial({this.hasStarredStatuschange = false}) : super._();

  @JsonKey()
  @override
  final bool hasStarredStatuschange;

  @override
  String toString() {
    return 'RepoDetailState.initial(hasStarredStatuschange: $hasStarredStatuschange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality()
                .equals(other.hasStarredStatuschange, hasStarredStatuschange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(hasStarredStatuschange));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatuschange) initial,
    required TResult Function(bool hasStarredStatuschange) loadInProggress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatuschange)
        loadFailure,
  }) {
    return initial(hasStarredStatuschange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool hasStarredStatuschange)? initial,
    TResult Function(bool hasStarredStatuschange)? loadInProggress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatuschange)?
        loadFailure,
  }) {
    return initial?.call(hasStarredStatuschange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatuschange)? initial,
    TResult Function(bool hasStarredStatuschange)? loadInProggress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatuschange)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(hasStarredStatuschange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProggress value) loadInProggress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProggress value)? loadInProggress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProggress value)? loadInProggress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends RepoDetailState {
  const factory _Initial({bool hasStarredStatuschange}) = _$_Initial;
  const _Initial._() : super._();

  @override
  bool get hasStarredStatuschange;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadInProggressCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$LoadInProggressCopyWith(
          _LoadInProggress value, $Res Function(_LoadInProggress) then) =
      __$LoadInProggressCopyWithImpl<$Res>;
  @override
  $Res call({bool hasStarredStatuschange});
}

/// @nodoc
class __$LoadInProggressCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res>
    implements _$LoadInProggressCopyWith<$Res> {
  __$LoadInProggressCopyWithImpl(
      _LoadInProggress _value, $Res Function(_LoadInProggress) _then)
      : super(_value, (v) => _then(v as _LoadInProggress));

  @override
  _LoadInProggress get _value => super._value as _LoadInProggress;

  @override
  $Res call({
    Object? hasStarredStatuschange = freezed,
  }) {
    return _then(_LoadInProggress(
      hasStarredStatuschange: hasStarredStatuschange == freezed
          ? _value.hasStarredStatuschange
          : hasStarredStatuschange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadInProggress extends _LoadInProggress {
  const _$_LoadInProggress({this.hasStarredStatuschange = false}) : super._();

  @JsonKey()
  @override
  final bool hasStarredStatuschange;

  @override
  String toString() {
    return 'RepoDetailState.loadInProggress(hasStarredStatuschange: $hasStarredStatuschange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadInProggress &&
            const DeepCollectionEquality()
                .equals(other.hasStarredStatuschange, hasStarredStatuschange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(hasStarredStatuschange));

  @JsonKey(ignore: true)
  @override
  _$LoadInProggressCopyWith<_LoadInProggress> get copyWith =>
      __$LoadInProggressCopyWithImpl<_LoadInProggress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatuschange) initial,
    required TResult Function(bool hasStarredStatuschange) loadInProggress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatuschange)
        loadFailure,
  }) {
    return loadInProggress(hasStarredStatuschange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool hasStarredStatuschange)? initial,
    TResult Function(bool hasStarredStatuschange)? loadInProggress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatuschange)?
        loadFailure,
  }) {
    return loadInProggress?.call(hasStarredStatuschange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatuschange)? initial,
    TResult Function(bool hasStarredStatuschange)? loadInProggress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatuschange)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProggress != null) {
      return loadInProggress(hasStarredStatuschange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProggress value) loadInProggress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProggress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProggress value)? loadInProggress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProggress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProggress value)? loadInProggress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProggress != null) {
      return loadInProggress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProggress extends RepoDetailState {
  const factory _LoadInProggress({bool hasStarredStatuschange}) =
      _$_LoadInProggress;
  const _LoadInProggress._() : super._();

  @override
  bool get hasStarredStatuschange;
  @override
  @JsonKey(ignore: true)
  _$LoadInProggressCopyWith<_LoadInProggress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange});

  $FreshCopyWith<GithubRepoDetail?, $Res> get repoDetail;
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? repoDetail = freezed,
    Object? hasStarredStatuschange = freezed,
  }) {
    return _then(_LoadSuccess(
      repoDetail == freezed
          ? _value.repoDetail
          : repoDetail // ignore: cast_nullable_to_non_nullable
              as Fresh<GithubRepoDetail?>,
      hasStarredStatuschange: hasStarredStatuschange == freezed
          ? _value.hasStarredStatuschange
          : hasStarredStatuschange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $FreshCopyWith<GithubRepoDetail?, $Res> get repoDetail {
    return $FreshCopyWith<GithubRepoDetail?, $Res>(_value.repoDetail, (value) {
      return _then(_value.copyWith(repoDetail: value));
    });
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess {
  const _$_LoadSuccess(this.repoDetail, {this.hasStarredStatuschange = false})
      : super._();

  @override
  final Fresh<GithubRepoDetail?> repoDetail;
  @JsonKey()
  @override
  final bool hasStarredStatuschange;

  @override
  String toString() {
    return 'RepoDetailState.loadSuccess(repoDetail: $repoDetail, hasStarredStatuschange: $hasStarredStatuschange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadSuccess &&
            const DeepCollectionEquality()
                .equals(other.repoDetail, repoDetail) &&
            const DeepCollectionEquality()
                .equals(other.hasStarredStatuschange, hasStarredStatuschange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(repoDetail),
      const DeepCollectionEquality().hash(hasStarredStatuschange));

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatuschange) initial,
    required TResult Function(bool hasStarredStatuschange) loadInProggress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatuschange)
        loadFailure,
  }) {
    return loadSuccess(repoDetail, hasStarredStatuschange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool hasStarredStatuschange)? initial,
    TResult Function(bool hasStarredStatuschange)? loadInProggress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatuschange)?
        loadFailure,
  }) {
    return loadSuccess?.call(repoDetail, hasStarredStatuschange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatuschange)? initial,
    TResult Function(bool hasStarredStatuschange)? loadInProggress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatuschange)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(repoDetail, hasStarredStatuschange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProggress value) loadInProggress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProggress value)? loadInProggress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProggress value)? loadInProggress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends RepoDetailState {
  const factory _LoadSuccess(Fresh<GithubRepoDetail?> repoDetail,
      {bool hasStarredStatuschange}) = _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  Fresh<GithubRepoDetail?> get repoDetail;
  @override
  bool get hasStarredStatuschange;
  @override
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  @override
  $Res call({GithubFailure failure, bool hasStarredStatuschange});

  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object? failure = freezed,
    Object? hasStarredStatuschange = freezed,
  }) {
    return _then(_LoadFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
      hasStarredStatuschange: hasStarredStatuschange == freezed
          ? _value.hasStarredStatuschange
          : hasStarredStatuschange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure extends _LoadFailure {
  const _$_LoadFailure(this.failure, {this.hasStarredStatuschange = false})
      : super._();

  @override
  final GithubFailure failure;
  @JsonKey()
  @override
  final bool hasStarredStatuschange;

  @override
  String toString() {
    return 'RepoDetailState.loadFailure(failure: $failure, hasStarredStatuschange: $hasStarredStatuschange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadFailure &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality()
                .equals(other.hasStarredStatuschange, hasStarredStatuschange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(hasStarredStatuschange));

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatuschange) initial,
    required TResult Function(bool hasStarredStatuschange) loadInProggress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatuschange)
        loadFailure,
  }) {
    return loadFailure(failure, hasStarredStatuschange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool hasStarredStatuschange)? initial,
    TResult Function(bool hasStarredStatuschange)? loadInProggress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatuschange)?
        loadFailure,
  }) {
    return loadFailure?.call(failure, hasStarredStatuschange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatuschange)? initial,
    TResult Function(bool hasStarredStatuschange)? loadInProggress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatuschange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatuschange)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(failure, hasStarredStatuschange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProggress value) loadInProggress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProggress value)? loadInProggress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProggress value)? loadInProggress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends RepoDetailState {
  const factory _LoadFailure(GithubFailure failure,
      {bool hasStarredStatuschange}) = _$_LoadFailure;
  const _LoadFailure._() : super._();

  GithubFailure get failure;
  @override
  bool get hasStarredStatuschange;
  @override
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
