class HomeRequestModel {
  int? sol;
  String? apiKey;
  int? page;

  HomeRequestModel({
    this.sol,
    this.apiKey,
    this.page,
  });

  HomeRequestModel.fromJson(Map<String, dynamic> json) {
    sol = json['sol'];
    apiKey = json['api_key'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sol'] = sol;
    data['api_key'] = apiKey;
    data['page'] = page;
    return data;
  }
}
