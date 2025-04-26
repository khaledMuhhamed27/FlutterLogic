class RegisterResponse {
  final String message;
  final bool status;
  final UserData data;

  RegisterResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json["message"] as String? ?? "",
      status: json["status"] as bool? ?? false,
      data: UserData.fromJson(json["data"] as Map<String, dynamic>? ?? {}),
    );
  }
}

class UserData {
  final User user;
  final String accessToken;
  final String tokenType;
  final String expiresAt;

  UserData({
    required this.user,
    required this.accessToken,
    required this.tokenType,
    required this.expiresAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json["user"] as Map<String, dynamic>? ?? {}),
      accessToken: json["access_token"] as String? ?? "",
      tokenType: json["token_type"] as String? ?? "",
      expiresAt: json["expires_at"] as String? ?? "",
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final int phone;
  final int otpCode;
  final int isOtpVerified;
  final String otpExpiresAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.otpCode,
    required this.isOtpVerified,
    required this.otpExpiresAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic value) {
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return User(
      id: parseInt(json["id"]),
      name: json["name"] as String? ?? "",
      email: json["email"] as String? ?? "",
      phone: parseInt(json["phone"]),
      otpCode: parseInt(json["otp_code"]),
      isOtpVerified: parseInt(json["is_otp_verified"]),
      otpExpiresAt: json["otp_expires_at"] as String? ?? "",
    );
  }
}
