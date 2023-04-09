class TaskModel {
  String id;
  String title;
  String describtion;
  int Date;
  bool isDone;
  TaskModel({
    required this.title,
    required this.describtion,
    required this.Date,
    this.id = '',
    this.isDone = false,
  });
  Map<String, dynamic> toJeson() {
    return {
      'title': title,
      'describtion': describtion,
      'Date': Date,
      'id': id,
      'isDone': isDone,
    };
  }

  TaskModel.fromJeson(Map<String, dynamic> jeson)
      : this(
            Date: jeson['Date'] as int,
            title: jeson['title'] as String,
            describtion: jeson['describtion'] as String,
            isDone: jeson['isDone'] as bool,
          id: jeson['id'] as String);
}
