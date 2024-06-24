class Frequency {
  final int years;
  final int months;
  final int days;

  Frequency({required this.years, required this.months, required this.days});
  Frequency copyWith({int? years, int? months, int? days}) {
    return Frequency(
      years: years ?? this.years,
      months: months ?? this.months,
      days: days ?? this.days,
    );
  }
}
