class UserModel {
  String? name;
  String? email;
  String? image;

  UserModel({
    this.name,
    this.email,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String?,
      email: map['email'] as String?,
      image: map['image'] as String?,
    );
  }
}
