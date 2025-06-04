extension RupiahFormatOnIntForPaymentDetail on int {
  String get toRupiah {
    if (this == 0) return 'Rp0';
    return 'Rp${toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }
}
