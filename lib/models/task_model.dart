

class TaskModel {
  String? id;
  static const String collectionName = "tasks";
  String? title;
  String? description;
  bool? isDone;
  DateTime? date;
  String startTime;
  String endTime;
  int? color;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    this.isDone = false,
    required this.color,
    this.date,
    required this.startTime,
    required this.endTime,
  });

  // TO CONVERT object to Map<String, dynamic>
  Map<String, dynamic> toJason() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'color': color,
      'date': date?.millisecondsSinceEpoch,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  // TO CONVERT Map to object

  TaskModel.fromJson(Map<String, dynamic> data)
      : this(
    id: data['id'],
          title: data['title'],
          description: data['description'],
          isDone: data['isDone'],
          color: data['color'],
          startTime: data['startTime'],
          date: DateTime.fromMillisecondsSinceEpoch(data['date']),
          endTime: data['endTime'],
        );
}
