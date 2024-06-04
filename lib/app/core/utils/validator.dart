enum PasswordInvalidType { EMPTY, INVALID_LENGTH, INVALID_LENGTH_LEVEL_TWO }

extension PasswordInvalidMessage on PasswordInvalidType? {
  String? getMessageInvalidPassword() {
    switch (this) {
      case PasswordInvalidType.EMPTY:
        return "Mật khẩu không được để trống";
      case PasswordInvalidType.INVALID_LENGTH:
        return "Mật khẩu ít nhất 8 ký tự bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt";
      case PasswordInvalidType.INVALID_LENGTH_LEVEL_TWO:
        return "Mật khẩu chứa ít nhất 4 ký tự số";
      default:
        return null;
    }
  }
}

enum PhoneInvalidType { EMPTY, INVALID_FORMAT }

extension PhoneInvalidMessage on PhoneInvalidType? {
  String? getMessageInvalidPhone() {
    switch (this) {
      case PhoneInvalidType.EMPTY:
        return "Số điện thoại không được để trống";
      case PhoneInvalidType.INVALID_FORMAT:
        return "Số điện thoại không hợp lệ";
      default:
        return null;
    }
  }
}

enum NameInvalidType { EMPTY }

extension NameInvalidMessage on NameInvalidType? {
  String? getMessageInvalidName() {
    switch (this) {
      case NameInvalidType.EMPTY:
        return "Họ tên không được để trống";
      default:
        return null;
    }
  }
}

enum RetypePasswordInvalidType { NOT_MATCH, EMPTY }

extension RetypePasswordInvalidMessage on RetypePasswordInvalidType? {
  String? getMessageInvalidRetypePassword() {
    switch (this) {
      case RetypePasswordInvalidType.NOT_MATCH:
        return "Mật khẩu nhập lại không khớp";
      case RetypePasswordInvalidType.EMPTY:
        return "Mật khẩu nhập lại không được để trống";
      default:
        return null;
    }
  }
}

enum OtpInvalidType { NOT_FILLED }

extension OtpInvalidMessage on OtpInvalidType? {
  String? getMessageInvalidOtp() {
    switch (this) {
      case OtpInvalidType.NOT_FILLED:
        return "Vui lòng nhập đầy đủ OTP";
      default:
        return null;
    }
  }
}

enum AmountInvalidType { EMPTY }

extension AmountInvalidMessage on AmountInvalidType? {
  String? getMessageInvalidAmount() {
    switch (this) {
      case AmountInvalidType.EMPTY:
        return "Hạn mức không được để trống";
      default:
        return null;
    }
  }
}

String? validateAgentName(String? value) {
  if (value != null && value.trim().isEmpty) {
    return 'Vui lòng nhập tên cửa hàng';
  }

  return null;
}

String? validateAddress(String? value) {
  if (value != null && value.trim().isEmpty) {
    return 'Vui lòng chọn địa chỉ';
  }

  return null;
}

String? validateAddressDetail(String? value) {
  if (value != null && value.trim().isEmpty) {
    return 'Vui lòng nhập địa chỉ chi tiết';
  }

  return null;
}

String? validateCardId(String? value) {
  if (value != null && value.trim().isEmpty) {
    return 'Vui lòng nhập số giấy tờ';
  }

  return null;
}

enum EmailInvalidType { EMPTY, INVALID_FORMAT }

extension EmailInvalidMessage on EmailInvalidType? {
  String? getMessage() {
    switch (this) {
      case EmailInvalidType.EMPTY:
        return "Email không được để trống";
      case EmailInvalidType.INVALID_FORMAT:
        return "Email không hợp lệ";
      default:
        return null;
    }
  }
}

enum DropdownInvalidType { EMPTY }

extension DropdownInvalidMessage on DropdownInvalidType? {
  String? getMessage() {
    switch (this) {
      case DropdownInvalidType.EMPTY:
        return "Vui lòng chọn ít nhất 01 sự lựa chọn";
      default:
        return null;
    }
  }
}

typedef FormFieldValidator<T> = String? Function(T? value);
