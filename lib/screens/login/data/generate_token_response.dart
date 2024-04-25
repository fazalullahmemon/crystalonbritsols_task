class GenerateTokenResponse {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? refreshToken;
  String? expiryDatetime;

  GenerateTokenResponse(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.refreshToken,
      this.expiryDatetime});

  GenerateTokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
    expiryDatetime = json['expiry_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['refresh_token'] = refreshToken;
    data['expiry_datetime'] = expiryDatetime;
    return data;
  }
}
