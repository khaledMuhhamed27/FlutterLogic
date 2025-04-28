class LoginResponse {
  LoginResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final bool? status;
  final Data? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json["message"],
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.token,
    required this.user,
  });

  final String? token;
  final User? user;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json["token"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.avatarOriginal,
    required this.birthday,
    required this.userType,
    required this.lang,
    required this.currency,
    required this.marketer,
    required this.kyc,
    required this.wallet,
    required this.amount,
  });

  final int? id;
  final String? name;
  final String? email;
  final int? phone;
  final dynamic avatar;
  final dynamic avatarOriginal;
  final dynamic birthday;
  final String? userType;
  final String? lang;
  final String? currency;
  final dynamic marketer;
  final dynamic kyc;
  final List<dynamic> wallet;
  final String? amount;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      avatar: json["avatar"],
      avatarOriginal: json["avatar_original"],
      birthday: json["birthday"],
      userType: json["user_type"],
      lang: json["lang"],
      currency: json["currency"],
      marketer: json["marketer"],
      kyc: json["kyc"],
      wallet: json["wallet"] == null
          ? []
          : List<dynamic>.from(json["wallet"]!.map((x) => x)),
      amount: json["amount"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "avatar_original": avatarOriginal,
        "birthday": birthday,
        "user_type": userType,
        "lang": lang,
        "currency": currency,
        "marketer": marketer,
        "kyc": kyc,
        "wallet": wallet.map((x) => x).toList(),
        "amount": amount,
      };
}
