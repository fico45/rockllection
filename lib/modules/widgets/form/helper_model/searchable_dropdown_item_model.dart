import 'package:freezed_annotation/freezed_annotation.dart';

part 'searchable_dropdown_item_model.freezed.dart';
part 'searchable_dropdown_item_model.g.dart';

@freezed
class SearchableDropdownItem with _$SearchableDropdownItem {
  const factory SearchableDropdownItem({
    required String id,
    required String name,
    String? description,
  }) = _SearchableDropdownItem;
  factory SearchableDropdownItem.fromJson(Map<String, Object?> json) =>
      _$SearchableDropdownItemFromJson(json);
}
