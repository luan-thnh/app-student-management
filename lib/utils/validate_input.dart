class ValidateFieldUtil {
  static String? validateEmail(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Email must be required';
    }

    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$');

    if (emailRegex.hasMatch(value!.trim())) {
      return null;
    }

    return 'Invalid email address';
  }

  static String? validateFullName(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Please enter your fullname name.';
    }

    if (value!.trim().length > 3) {
      return null;
    }

    return 'FullName must at least 3 or more characters';
  }

  static String? validateStudentId(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Student Id must be required';
    }

    return null;
  }

  static String? validateAverMark(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Average mark must be required';
    }

    double? averageMark = double.tryParse(value!);
    if (averageMark == null) {
      return 'Average mark must be a valid number';
    }

    if (averageMark > 4.0) {
      return 'Average mark must be less than or equal to 4';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Phone number must be required';
    }

    RegExp phoneNumberRegex = RegExp(r'^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');

    if (phoneNumberRegex.hasMatch(value!.trim())) {
      return null;
    }

    return 'Invalid phone number';
  }

  static String? validateBirthday(String? birth) {
    int? year = int.parse(birth!.substring(0, 4));

    if (year + 7 > DateTime.now().year) {
      return 'Invalid date of birth.';
    } else {
      return null;
    }
  }
}
