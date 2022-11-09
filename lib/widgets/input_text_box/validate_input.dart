import 'validate_email.dart';

String? validateInput(String? value, String? label, {bool isOption = false}) {
  if (!isOption && (value == null || value.isEmpty)) {
    return 'Vui lòng nhập $label của bạn';
  }

  switch (label!.toLowerCase()) {
    case 'họ và tên':
      if (value!.contains(RegExp(r'[1-9]'))) {
        return 'Họ tên không được chứa số';
      }
      break;
    case 'email':
      if (!value!.contains('@')) {
        return 'Email của bạn thiếu ký tự "@"';
      }
      if (!value.contains('.')) {
        return 'Email của bạn thiếu ký tự "."';
      }
      if (!validateEmail(value)) {
        return 'Email của bạn sai định dạng';
      }
      break;
    case 'số điện thoại':
      if (!RegExp(r'^(?:[+])?[0-9]').hasMatch(value!)) {
        return 'Số điện thoại chỉ được chứa chữ số';
      }
      if (value.length < 10 || value.length > 11) {
        return 'Độ dài số điện thoại chưa đúng';
      }
      break;
    case 'số cmnd/cccd':
    case 'cmnd/cccd':
      if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
        return 'CMND/CCCD chỉ được chứa chữ số';
      }
      if (value.length < 9 || value.length > 12) {
        return 'Độ dài số CNND/CCCD chưa đúng';
      }
      break;
    case 'năm':
      if (value != '') {
        if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
          return 'Năm chỉ được chứa chữ số';
        }
        if (value.length != 4) {
          return 'Độ dài năm chưa đúng';
        }
      }
      break;
    case 'mật khẩu':
    case 'mật khẩu cũ':
    case 'mật khẩu mới':
    case 'xác nhận mật khẩu':
      if (value!.length < 8) {
        return 'Mật khẩu của bạn cần chứa ít nhất 8 ký tự';
      }
      if (!value.contains(RegExp(r'[A-Z]'))) {
        return 'Mật khẩu của bạn cần phải chứa ký tự viết hoa';
      }
      if (!value.contains(RegExp(r'[0-9]'))) {
        return 'Mật khẩu của bạn cần phải chứa chữ số';
      }
      if (!value.contains(RegExp(r'[a-z]'))) {
        return 'Mật khẩu của bạn cần phải chứa ký tự viết thường';
      }
      if (!value.contains(RegExp(r'[!%@#^\$&*~_+=<>.,?/;:"|{}()\-\\\[\]]'))) {
        return 'Mật khẩu của bạn cần chứa ký tự đặc biệt';
      }
      break;
    case 'địa chỉ':
    case 'nơi sinh':
    case 'địa chỉ liên hệ':
      if (value!.split(',').length < 3) {
        return 'Bạn cần nhập đủ số nhà, tên đường, xã/phường, huyện/quận, tỉnh/thành phố';
      }
      break;
    case 'ngày sinh':
    case 'ngày hết hạn':
      List<String> splits = value!.split('/');
      if (splits.length != 3) {
        return 'Định dạng ngày không hợp lệ (dd/mm/yyyy)';
      }
      int? day = int.tryParse(splits[0]);
      int? month = int.tryParse(splits[1]);
      int? year = int.tryParse(splits[2]);
      if (day == null || month == null || year == null) {
        return 'Định dạng ngày không hợp lệ';
      }
      List<int> months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
      if (year < 1922 || year > DateTime.now().year) {
        return 'Năm không hợp lệ';
      }
      if (month <= 0 || month > 12) {
        return 'Tháng không hợp lệ';
      }
      if (day <= 0 || day > months[month - 1]) {
        return 'Ngày không hợp lệ';
      }
      break;
    case 'tiến độ':
      int? progress = int.tryParse(value!);
      if (progress == null) {
        return 'Vui lòng nhập tiến độ là số nguyên';
      }
      if (progress < 0 || progress > 100) {
        return 'Vui lòng nhập tiến độ trong khoảng 0 - 100';
      }
      break;
    default:
  }
  return null;
}
