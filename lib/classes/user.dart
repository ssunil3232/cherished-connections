class User {
  final String name;
  final int days;
  final int color;
  final String update;
  final int freq_year;
  final int freq_mth;
  final int freq_day;
  final String birthday;
  final bool alert;
  final String img;

  User(
      {required this.name,
      required this.days,
      required this.color,
      required this.update,
      required this.freq_year,
      required this.freq_mth,
      required this.freq_day,
      required this.birthday,
      required this.alert,
      required this.img});

  Map<String, dynamic> toJson() => {
        'name': name,
        'days': days,
        'color': color,
        'update': update,
        'freq_year': freq_year,
        'freq_mth': freq_mth,
        'freq_day': freq_day,
        'birthday': birthday,
        'alert': alert,
        'img': img,
      };
  User copyWith({
    String? name,
    int? days,
    int? color,
    String? update,
    int? freq_year,
    int? freq_mth,
    int? freq_day,
    String? birthday,
    bool? alert,
    String? img,
  }) {
    return User(
      name: name ?? this.name,
      days: days ?? this.days,
      color: color ?? this.color,
      update: update ?? this.update,
      freq_year: freq_year ?? this.freq_year,
      freq_mth: freq_mth ?? this.freq_mth,
      freq_day: freq_day ?? this.freq_day,
      birthday: birthday ?? this.birthday,
      alert: alert ?? this.alert,
      img: img ?? this.img,
    );
  }
}
