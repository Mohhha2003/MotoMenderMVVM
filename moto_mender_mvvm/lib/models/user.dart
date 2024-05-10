class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? role;
  bool? isBlocked;
  String? profileImage;
  String? password;
  int? v;
  DateTime? resetPasswordExpires;
  String? resetPasswordOtp;
  String? emailVerify;
  List<String>? favorites;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.role,
      this.isBlocked,
      this.profileImage,
      this.password,
      this.v,
      this.resetPasswordExpires,
      this.resetPasswordOtp,
      this.favorites,
      this.emailVerify});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      role: json['role'] as String?,
      isBlocked: json['isBlocked'] as bool?,
      profileImage: json['profileImage'] as String?,
      password: json['password'] as String?,
      favorites: json['favorites'].cast<String>(),
      v: json['__v'] as int?,
      resetPasswordExpires: json['resetPasswordExpires'] == null
          ? null
          : DateTime.parse(json['resetPasswordExpires'] as String),
      resetPasswordOtp: json['resetPasswordOTP'] as String?,
      emailVerify: json['emailVerify'] as String?);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'role': role,
        'isBlocked': isBlocked,
        'profileImage': profileImage,
        'password': password,
        '__v': v,
        'resetPasswordExpires': resetPasswordExpires?.toIso8601String(),
        'resetPasswordOTP': resetPasswordOtp,
      };
}
