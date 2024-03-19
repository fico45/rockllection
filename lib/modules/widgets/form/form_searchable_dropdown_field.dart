import 'package:dropdown_search/dropdown_search.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_template/modules/widgets/form/form_field_decorator.dart';
import 'package:flutter_template/modules/widgets/form/helper_model/searchable_dropdown_item_model.dart';
import 'package:flutter_template/utils/extensions.dart';

class SearchableFormDropdownField<T> extends ReactiveFormField<T, T> {
  SearchableFormDropdownField({
    super.key,
    super.formControlName,
    String? label,
    bool required = false,
    Widget? prefixIcon,
    required List<SearchableDropdownItem> items,
    super.formControl,
    required BuildContext context,
    Future Function(String id)? onChangedCallback,
  }) : super(
          builder: (ReactiveFormFieldState<T, T> field) {
            return DropdownSearch<SearchableDropdownItem>(
              enabled: field.control.enabled,
              popupProps: PopupProps.menu(
                onDismissed: () {
                  field.control.markAsTouched();
                },
                searchDelay: const Duration(milliseconds: 200),
                showSelectedItems: true,
                scrollbarProps: const ScrollbarProps(
                  thickness: 8,
                ),
                menuProps: const MenuProps(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: context.colorScheme.onInverseSurface,
                    border: FormFieldDecorator.border.outlinedInputBorder,
                    disabledBorder:
                        FormFieldDecorator.border.outlinedInputBorder,
                    enabledBorder:
                        FormFieldDecorator.border.outlinedInputBorder,
                    focusedBorder:
                        FormFieldDecorator.border.outlinedInputBorder,
                    focusedErrorBorder:
                        FormFieldDecorator.border.errorInputBorder,
                    prefix: const Padding(
                      padding: EdgeInsets.only(
                        right: 8,
                      ),
                    ),
                    prefixIcon: prefixIcon,
                    errorBorder: FormFieldDecorator.border.errorInputBorder,
                    contentPadding: const EdgeInsets.all(14),
                  ),
                ),
                fit: FlexFit.loose,
                constraints: const BoxConstraints.tightFor(),
                itemBuilder: (context, item, isSelected) {
                  return ListTile(
                    title: Text(item.name),
                    selected: isSelected,
                  );
                },
              ),
              items: items,
              validator: (value) {
                if (required && value == null && field.control.touched) {
                  return 'This field is required';
                }

                return null;
              },
              clearButtonProps: ClearButtonProps(
                isVisible: !required,
                icon: Icon(
                  Icons.clear,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                onPressed: () => field.didChange(null),
              ),
              autoValidateMode: AutovalidateMode.always,
              dropdownDecoratorProps: DropDownDecoratorProps(
                baseStyle: context.textTheme.bodyLarge!.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
                dropdownSearchDecoration: InputDecoration(
                  label: Text(
                    required ? '${label ?? ''}*' : label ?? '',
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: context.colorScheme.onInverseSurface,
                  border: FormFieldDecorator.border.outlinedInputBorder,
                  disabledBorder: FormFieldDecorator.border.outlinedInputBorder,
                  enabledBorder: FormFieldDecorator.border.outlinedInputBorder,
                  focusedBorder: FormFieldDecorator.border.outlinedInputBorder,
                  focusedErrorBorder:
                      FormFieldDecorator.border.errorInputBorder,
                  prefix: const Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                  ),
                  prefixIcon: prefixIcon,
                  errorBorder: FormFieldDecorator.border.errorInputBorder,
                  contentPadding: const EdgeInsets.all(14),
                ),
              ),
              onChanged: (value) async {
                if (value == null) {
                  return;
                }

                field.didChange(value.id as T?);
                if (onChangedCallback != null) {
                  await onChangedCallback(value.id);
                }
              },
              filterFn: (item, String? query) {
                return item.name.toLowerCase().contains(query!);
              },
              compareFn:
                  (SearchableDropdownItem? i, SearchableDropdownItem? s) {
                if (i == null || s == null) {
                  return false;
                }

                return i.id == s.id;
              },
              selectedItem: items.firstWhereOrNull(
                (element) {
                  return element.id == field.value;
                },
              ),
              itemAsString: (item) => item.name,
            );
          },
        );
}
