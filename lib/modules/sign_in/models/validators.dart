abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String? value) {
    if (value == null) {
      return false;
    }
    return value.isNotEmpty;
  }
}

class GeneralValidator {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final StringValidator phoneValidator = NonEmptyStringValidator();
  final StringValidator smsCodeValidator = NonEmptyStringValidator();
  final String invalidErrorText = 'Please provide a valid value';
}
