import 'dart:convert';

List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  String name;
  String? price;
  String? brand;
  String? description;
  String imageLink;
  PostModel({
    required this.name,
    required this.price,
    required this.brand,
    required this.description,
    required this.imageLink,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    name: json["name"],
    price: json["price"],
    brand: json["brand"],
    description: json["description"],
    imageLink: json["image_link"],

  );
  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "brand": brand,
    "image_link": imageLink,
    "description": description,
  };
}