class DailyTask {
  String? id;
  String? task;
  String? description;
  String? difficulty;
  String? evolution;
  String? time;
  String? date;

  DailyTask(
      {this.id,
      this.task,
      this.description,
      this.difficulty,
      this.evolution,
      this.time,
      this.date});

  factory DailyTask.fromJson(Map<String, dynamic> json) {
    return DailyTask(
      id: json['id'],
      task: json['task'],
      description: json['description'],
      difficulty: json['difficulty'],
      evolution: json['evolution'],
      time: json['time'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['task'] = task;
    data['description'] = description;
    data['difficulty'] = difficulty;
    data['evolution'] = evolution;
    data['time'] = time;
    data['date'] = date;
    return data;
  }
}
