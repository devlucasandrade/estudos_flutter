class JsonPostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  JsonPostsModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory JsonPostsModel.fromJson(Map<String, dynamic> json) {
    return JsonPostsModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
