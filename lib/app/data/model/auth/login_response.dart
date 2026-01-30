
class LoginResponse {
  Results? results;
  String? message;

  LoginResponse({this.results, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
    message = json['message'];
  }
}

class Results {
  String? accessToken;
  String? tokenType;
  var expiresIn;

  Results({this.accessToken, this.tokenType, this.expiresIn});

  Results.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
}
