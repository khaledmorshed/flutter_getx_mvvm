class TenantModel {
  String? key;
  String? message;
  Results? results;
  String? timestamp;

  TenantModel({this.key, this.message, this.results, this.timestamp});

  TenantModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    message = json['message'];
    results =
    json['results'] != null ?  Results.fromJson(json['results']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['key'] = key;
    data['message'] = message;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Results {
  String? name;
  bool? trialMode;
  String? trialModeEndDays;
  String? message;
  String? companyName;
  String? companyShortName;
  String? companyLogo;

  Results(
      {this.name,
        this.trialMode,
        this.trialModeEndDays,
        this.message,
        this.companyName,
        this.companyShortName,
        this.companyLogo});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    trialMode = json['trial_mode'];
    trialModeEndDays = json['trial_mode_end_days'].toString();
    message = json['message'].toString();
    companyName = json['company_name'];
    companyShortName = json['company_short_name'];
    companyLogo = json['company_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['trial_mode'] = trialMode;
    data['trial_mode_end_days'] = trialModeEndDays;
    data['message'] = message;
    data['company_name'] = companyName;
    data['company_short_name'] = companyShortName;
    data['company_logo'] = companyLogo;
    return data;
  }
}