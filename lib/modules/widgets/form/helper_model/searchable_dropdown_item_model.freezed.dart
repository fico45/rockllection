// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searchable_dropdown_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchableDropdownItem _$SearchableDropdownItemFromJson(
    Map<String, dynamic> json) {
  return _SearchableDropdownItem.fromJson(json);
}

/// @nodoc
mixin _$SearchableDropdownItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchableDropdownItemCopyWith<SearchableDropdownItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchableDropdownItemCopyWith<$Res> {
  factory $SearchableDropdownItemCopyWith(SearchableDropdownItem value,
          $Res Function(SearchableDropdownItem) then) =
      _$SearchableDropdownItemCopyWithImpl<$Res, SearchableDropdownItem>;
  @useResult
  $Res call({String id, String name, String? description});
}

/// @nodoc
class _$SearchableDropdownItemCopyWithImpl<$Res,
        $Val extends SearchableDropdownItem>
    implements $SearchableDropdownItemCopyWith<$Res> {
  _$SearchableDropdownItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchableDropdownItemImplCopyWith<$Res>
    implements $SearchableDropdownItemCopyWith<$Res> {
  factory _$$SearchableDropdownItemImplCopyWith(
          _$SearchableDropdownItemImpl value,
          $Res Function(_$SearchableDropdownItemImpl) then) =
      __$$SearchableDropdownItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? description});
}

/// @nodoc
class __$$SearchableDropdownItemImplCopyWithImpl<$Res>
    extends _$SearchableDropdownItemCopyWithImpl<$Res,
        _$SearchableDropdownItemImpl>
    implements _$$SearchableDropdownItemImplCopyWith<$Res> {
  __$$SearchableDropdownItemImplCopyWithImpl(
      _$SearchableDropdownItemImpl _value,
      $Res Function(_$SearchableDropdownItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$SearchableDropdownItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchableDropdownItemImpl implements _SearchableDropdownItem {
  const _$SearchableDropdownItemImpl(
      {required this.id, required this.name, this.description});

  factory _$SearchableDropdownItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchableDropdownItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'SearchableDropdownItem(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchableDropdownItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchableDropdownItemImplCopyWith<_$SearchableDropdownItemImpl>
      get copyWith => __$$SearchableDropdownItemImplCopyWithImpl<
          _$SearchableDropdownItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchableDropdownItemImplToJson(
      this,
    );
  }
}

abstract class _SearchableDropdownItem implements SearchableDropdownItem {
  const factory _SearchableDropdownItem(
      {required final String id,
      required final String name,
      final String? description}) = _$SearchableDropdownItemImpl;

  factory _SearchableDropdownItem.fromJson(Map<String, dynamic> json) =
      _$SearchableDropdownItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$SearchableDropdownItemImplCopyWith<_$SearchableDropdownItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
