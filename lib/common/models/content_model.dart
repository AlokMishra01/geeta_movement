class ContentModel {
  String content = '';

  ContentModel({required this.content});

  ContentModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = this.content;
    return data;
  }
}
