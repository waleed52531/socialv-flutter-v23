class ReactionsModel {
  String? id;
  String? imageUrl;
  String? name;


  ReactionsModel({this.id, this.imageUrl, this.name});

  factory ReactionsModel.fromJson(Map<String, dynamic> json) {
    return ReactionsModel(
      id: json['id'],
      imageUrl: json['image_url'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    return data;
  }
}
