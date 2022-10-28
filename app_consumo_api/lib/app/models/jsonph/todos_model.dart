class JsonTodosModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  JsonTodosModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory JsonTodosModel.fromJson(Map<String, dynamic> json) {
    return JsonTodosModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      completed: json["completed"],
    );
  }
}
