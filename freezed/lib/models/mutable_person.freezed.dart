// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutable_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MutablePerson {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  set age(int value) => throw _privateConstructorUsedError;

  /// Create a copy of MutablePerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MutablePersonCopyWith<MutablePerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MutablePersonCopyWith<$Res> {
  factory $MutablePersonCopyWith(
    MutablePerson value,
    $Res Function(MutablePerson) then,
  ) = _$MutablePersonCopyWithImpl<$Res, MutablePerson>;
  @useResult
  $Res call({int id, String name, int age});
}

/// @nodoc
class _$MutablePersonCopyWithImpl<$Res, $Val extends MutablePerson>
    implements $MutablePersonCopyWith<$Res> {
  _$MutablePersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MutablePerson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? age = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            age:
                null == age
                    ? _value.age
                    : age // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MutablePersonImplCopyWith<$Res>
    implements $MutablePersonCopyWith<$Res> {
  factory _$$MutablePersonImplCopyWith(
    _$MutablePersonImpl value,
    $Res Function(_$MutablePersonImpl) then,
  ) = __$$MutablePersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int age});
}

/// @nodoc
class __$$MutablePersonImplCopyWithImpl<$Res>
    extends _$MutablePersonCopyWithImpl<$Res, _$MutablePersonImpl>
    implements _$$MutablePersonImplCopyWith<$Res> {
  __$$MutablePersonImplCopyWithImpl(
    _$MutablePersonImpl _value,
    $Res Function(_$MutablePersonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MutablePerson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? age = null}) {
    return _then(
      _$MutablePersonImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                as int,
        null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                as String,
        null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$MutablePersonImpl
    with DiagnosticableTreeMixin
    implements _MutablePerson {
  _$MutablePersonImpl(this.id, this.name, this.age);

  @override
  final int id;
  @override
  String name;
  @override
  int age;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MutablePerson(id: $id, name: $name, age: $age)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MutablePerson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age));
  }

  /// Create a copy of MutablePerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MutablePersonImplCopyWith<_$MutablePersonImpl> get copyWith =>
      __$$MutablePersonImplCopyWithImpl<_$MutablePersonImpl>(this, _$identity);
}

abstract class _MutablePerson implements MutablePerson {
  factory _MutablePerson(final int id, String name, int age) =
      _$MutablePersonImpl;

  @override
  int get id;
  @override
  String get name;
  set name(String value);
  @override
  int get age;
  set age(int value);

  /// Create a copy of MutablePerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MutablePersonImplCopyWith<_$MutablePersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
