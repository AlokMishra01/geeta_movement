class CreditModel {
  List<Data> data = <Data>[];

  CreditModel({required this.data});

  CreditModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  String designation = '';
  String fullName = '';

  Data({
    required this.designation,
    required this.fullName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    designation = json['designation'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['designation'] = this.designation;
    data['full_name'] = this.fullName;
    return data;
  }
}
