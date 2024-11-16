// models/post_model.dart

class PostModell {
  bool status;
  String message;

  PostModell({
    required this.status,
    required this.message,
  });

  factory PostModell.fromJson(Map<String, dynamic> json) => PostModell(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}

