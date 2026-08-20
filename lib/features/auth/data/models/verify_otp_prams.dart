class VerifyOtpPrams {
  final String email;
  final String otp;

  VerifyOtpPrams({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {"email": email, "otp":otp};
  }
}
