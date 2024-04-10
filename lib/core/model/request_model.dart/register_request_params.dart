class RegisterRequestParams {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? phoneNo;

  RegisterRequestParams(
      {this.name,
      this.email,
      this.password,
      this.passwordConfirmation,
      this.phoneNo});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    data['phone'] = this.phoneNo;
    return data;
  }
}
