String formatPhoneNumber(String phoneNumber) {
  String digits = phoneNumber.replaceAll(RegExp(r'\D'), '');
  return '+${digits.substring(0, 2)} (${digits.substring(2, 4)}) ${digits.substring(4, 8)}-${digits.substring(8, 11)}';
}
