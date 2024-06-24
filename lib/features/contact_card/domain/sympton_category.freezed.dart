// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sympton_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SymptomCategory {
  String get name => throw _privateConstructorUsedError;
  List<Symptom> get symptoms => throw _privateConstructorUsedError;
  SymptomCategoryType get type => throw _privateConstructorUsedError;
  Map<int, Code>? get symptomsCountToCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SymptomCategoryCopyWith<SymptomCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomCategoryCopyWith<$Res> {
  factory $SymptomCategoryCopyWith(
          SymptomCategory value, $Res Function(SymptomCategory) then) =
      _$SymptomCategoryCopyWithImpl<$Res, SymptomCategory>;
  @useResult
  $Res call(
      {String name,
      List<Symptom> symptoms,
      SymptomCategoryType type,
      Map<int, Code>? symptomsCountToCode});
}

/// @nodoc
class _$SymptomCategoryCopyWithImpl<$Res, $Val extends SymptomCategory>
    implements $SymptomCategoryCopyWith<$Res> {
  _$SymptomCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symptoms = null,
    Object? type = null,
    Object? symptomsCountToCode = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<Symptom>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SymptomCategoryType,
      symptomsCountToCode: freezed == symptomsCountToCode
          ? _value.symptomsCountToCode
          : symptomsCountToCode // ignore: cast_nullable_to_non_nullable
              as Map<int, Code>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SymptomCategoryImplCopyWith<$Res>
    implements $SymptomCategoryCopyWith<$Res> {
  factory _$$SymptomCategoryImplCopyWith(_$SymptomCategoryImpl value,
          $Res Function(_$SymptomCategoryImpl) then) =
      __$$SymptomCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<Symptom> symptoms,
      SymptomCategoryType type,
      Map<int, Code>? symptomsCountToCode});
}

/// @nodoc
class __$$SymptomCategoryImplCopyWithImpl<$Res>
    extends _$SymptomCategoryCopyWithImpl<$Res, _$SymptomCategoryImpl>
    implements _$$SymptomCategoryImplCopyWith<$Res> {
  __$$SymptomCategoryImplCopyWithImpl(
      _$SymptomCategoryImpl _value, $Res Function(_$SymptomCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symptoms = null,
    Object? type = null,
    Object? symptomsCountToCode = freezed,
  }) {
    return _then(_$SymptomCategoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value._symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<Symptom>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SymptomCategoryType,
      symptomsCountToCode: freezed == symptomsCountToCode
          ? _value._symptomsCountToCode
          : symptomsCountToCode // ignore: cast_nullable_to_non_nullable
              as Map<int, Code>?,
    ));
  }
}

/// @nodoc

class _$SymptomCategoryImpl extends _SymptomCategory {
  const _$SymptomCategoryImpl(
      {required this.name,
      required final List<Symptom> symptoms,
      this.type = SymptomCategoryType.symptomCode,
      final Map<int, Code>? symptomsCountToCode})
      : _symptoms = symptoms,
        _symptomsCountToCode = symptomsCountToCode,
        super._();

  @override
  final String name;
  final List<Symptom> _symptoms;
  @override
  List<Symptom> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  @override
  @JsonKey()
  final SymptomCategoryType type;
  final Map<int, Code>? _symptomsCountToCode;
  @override
  Map<int, Code>? get symptomsCountToCode {
    final value = _symptomsCountToCode;
    if (value == null) return null;
    if (_symptomsCountToCode is EqualUnmodifiableMapView)
      return _symptomsCountToCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SymptomCategory(name: $name, symptoms: $symptoms, type: $type, symptomsCountToCode: $symptomsCountToCode)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SymptomCategoryImplCopyWith<_$SymptomCategoryImpl> get copyWith =>
      __$$SymptomCategoryImplCopyWithImpl<_$SymptomCategoryImpl>(
          this, _$identity);
}

abstract class _SymptomCategory extends SymptomCategory {
  const factory _SymptomCategory(
      {required final String name,
      required final List<Symptom> symptoms,
      final SymptomCategoryType type,
      final Map<int, Code>? symptomsCountToCode}) = _$SymptomCategoryImpl;
  const _SymptomCategory._() : super._();

  @override
  String get name;
  @override
  List<Symptom> get symptoms;
  @override
  SymptomCategoryType get type;
  @override
  Map<int, Code>? get symptomsCountToCode;
  @override
  @JsonKey(ignore: true)
  _$$SymptomCategoryImplCopyWith<_$SymptomCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
