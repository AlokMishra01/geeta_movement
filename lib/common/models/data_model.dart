class DataModel {
  List<Data> data = <Data>[];

  DataModel({required this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  String title = '';
  String excerpt = '';
  String file = '';
  String thumbnail = '';

  Data({
    required this.title,
    required this.excerpt,
    required this.file,
    required this.thumbnail,
  });

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    excerpt = json['excerpt'];
    file = json['file'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['excerpt'] = this.excerpt;
    data['file'] = this.file;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
