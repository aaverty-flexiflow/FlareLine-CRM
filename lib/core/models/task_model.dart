class TaskModel {
  final String id;
  final String image;
  final String name;
  final String task;
  final String days;
  final List<String> users;
  final String status; // 'todo', 'inprogress', 'needreview', 'done'

  TaskModel({
    required this.id,
    required this.image,
    required this.name,
    required this.task,
    required this.days,
    required this.users,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      task: json['task'] ?? '',
      days: json['days'] ?? '',
      users: List<String>.from(json['users'] ?? []),
      status: json['status'] ?? 'todo',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'task': task,
      'days': days,
      'users': users,
      'status': status,
    };
  }

  TaskModel copyWith({
    String? id,
    String? image,
    String? name,
    String? task,
    String? days,
    List<String>? users,
    String? status,
  }) {
    return TaskModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      task: task ?? this.task,
      days: days ?? this.days,
      users: users ?? this.users,
      status: status ?? this.status,
    );
  }
}
