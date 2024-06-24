class ProfileDetail {
  final String name;
  final String img;

  ProfileDetail({required this.name, required this.img});
  ProfileDetail copyWith({String? name, String? img}) {
    return ProfileDetail(
      name: name ?? this.name,
      img: img ?? this.img,
    );
  }

  factory ProfileDetail.fromMap(Map<dynamic, dynamic> map) {
    return ProfileDetail(
      name: map['name'],
      img: map['img'],
    );
  }
}
