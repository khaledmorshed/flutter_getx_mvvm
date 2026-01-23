class CreateTenantDataParam{
  String tenant;
  CreateTenantDataParam({
    this.tenant = "",
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tenant'] = tenant;
    return data;
  }
}