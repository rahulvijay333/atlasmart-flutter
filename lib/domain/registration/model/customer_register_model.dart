class CustomerRegisterModel {
  final String fullName;
  final String email;
  final String password;
  final String? otp;

  const CustomerRegisterModel({
    required this.fullName,
    required this.email,
    required this.password,
    this.otp,
  });

  CustomerRegisterModel copyWith({
    String? fullName,
    String? email,
    String? password,
    String? otp,
  }) {
    return CustomerRegisterModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      otp: otp ?? this.otp,
    );
  }
}
