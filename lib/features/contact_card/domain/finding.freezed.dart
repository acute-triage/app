// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Finding {
  SymptomCategory get category => throw _privateConstructorUsedError;
  List<Symptom> get symptoms => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FindingCopyWith<Finding> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindingCopyWith<$Res> {
  factory $FindingCopyWith(Finding value, $Res Function(Finding) then) =
      _$FindingCopyWithImpl<$Res, Finding>;
  @useResult
  $Res call({SymptomCategory category, List<Symptom> symptoms});

  $SymptomCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$FindingCopyWithImpl<$Res, $Val extends Finding>
    implements $FindingCopyWith<$Res> {
  _$FindingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? symptoms = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SymptomCategory,
      symptoms: null == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<Symptom>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SymptomCategoryCopyWith<$Res> get category {
    return $SymptomCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SymptomCategoryImplCopyWith<$Res>
    implements $FindingCopyWith<$Res> {
  factory _$$SymptomCategoryImplCopyWith(_$SymptomCategoryImpl value,
          $Res Function(_$SymptomCategoryImpl) then) =
      __$$SymptomCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SymptomCategory category, List<Symptom> symptoms});

  @override
  $SymptomCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$SymptomCategoryImplCopyWithImpl<$Res>
    extends _$FindingCopyWithImpl<$Res, _$SymptomCategoryImpl>
    implements _$$SymptomCategoryImplCopyWith<$Res> {
  __$$SymptomCategoryImplCopyWithImpl(
      _$SymptomCategoryImpl _value, $Res Function(_$SymptomCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? symptoms = null,
  }) {
    return _then(_$SymptomCategoryImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SymptomCategory,
      symptoms: null == symptoms
          ? _value._symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<Symptom>,
    ));
  }
}

/// @nodoc

class _$SymptomCategoryImpl extends _SymptomCategory {
  const _$SymptomCategoryImpl(
      {required this.category, required final List<Symptom> symptoms})
      : _symptoms = symptoms,
        super._();

  @override
  final SymptomCategory category;
  final List<Symptom> _symptoms;
  @override
  List<Symptom> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  @override
  String toString() {
    return 'Finding(category: $category, symptoms: $symptoms)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SymptomCategoryImplCopyWith<_$SymptomCategoryImpl> get copyWith =>
      __$$SymptomCategoryImplCopyWithImpl<_$SymptomCategoryImpl>(
          this, _$identity);
}

abstract class _SymptomCategory extends Finding {
  const factory _SymptomCategory(
      {required final SymptomCategory category,
      required final List<Symptom> symptoms}) = _$SymptomCategoryImpl;
  const _SymptomCategory._() : super._();

  @override
  SymptomCategory get category;
  @override
  List<Symptom> get symptoms;
  @override
  @JsonKey(ignore: true)
  _$$SymptomCategoryImplCopyWith<_$SymptomCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
