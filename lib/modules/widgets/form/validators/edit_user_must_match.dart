import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_template/utils/consts.dart';

/// Represents a [FormGroup] validator that requires that two controls in the
/// group have the same values.
class AfterTouchMustMatchValidator extends Validator<dynamic> {
  final String controlName;
  final String matchingControlName;
  final bool markAsDirty;

  /// Constructs an instance of [MustMatchValidator]
  const AfterTouchMustMatchValidator(
      this.controlName, this.matchingControlName, this.markAsDirty)
      : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = {ValidationMessage.mustMatch: true};

    if (control is! FormGroup) {
      return error;
    }

    final formControl = control.control(controlName);
    final matchingFormControl = control.control(matchingControlName);
    if (formControl.dirty || matchingFormControl.dirty) {
      formControl.setValidators([
        Validators.required,
        Validators.minLength(MyFacts.minPasswordLength),
      ]);
      matchingFormControl.setValidators([
        Validators.required,
        Validators.minLength(MyFacts.minPasswordLength),
      ]);
      if (formControl.value != matchingFormControl.value) {
        matchingFormControl.setErrors(error, markAsDirty: markAsDirty);
        matchingFormControl.markAsTouched();
      } else {
        matchingFormControl.removeError(ValidationMessage.mustMatch);
      }
    }

    return null;
  }
}
