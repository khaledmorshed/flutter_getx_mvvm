
class ClientListResponse {
  String? message;
  ClientResults? results;

  ClientListResponse({this.message, this.results});

  ClientListResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    results = json['results'] != null ? ClientResults.fromJson(json['results']) : null;
  }
}

class ClientResults {
  List<ClientData>? data;
  int? total;
  int? currentPage;
  int? lastPage;

  ClientResults({this.data, this.total, this.currentPage, this.lastPage});

  ClientResults.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClientData>[];
      json['data'].forEach((v) {
        data!.add(ClientData.fromJson(v));
      });
    }
    total = json['total'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }
}

class ClientData {
  String? id;
  String? client; 
  String? email;
  String? phone;
  String? address;
  String? currentBalance;
  String? totalDue;

  ClientData({
    this.id,
    this.client,
    this.email,
    this.phone,
    this.address,
    this.currentBalance,
    this.totalDue,
  });

  ClientData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    client = json['client'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    currentBalance = json['current_balance']?.toString();
    totalDue = json['total_due']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = client; // Simplified for create
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    return data;
  }
}
