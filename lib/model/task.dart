// json serialization

import 'dart:ui';

class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  Color? color;
  int? reminder;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.reminder,
    this.repeat,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    note = json["note"];
    isCompleted = json["isCompleted"];
    date = json["date"];
    startTime = json["startTime"];
    endTime = json["endTime"];
    color = json["color"];
    reminder = json["reminder"];
    repeat = json["repeat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["note"] = this.note;
    data["isCompleted"] = this.isCompleted;
    data["date"] = this.date;
    data["startTime"] = this.startTime;
    data["endTime"] = this.endTime;
    data["color"] = this.color;
    data["reminder"] = this.reminder;
    data["repeat"] = this.repeat;
    return data;
  }
}
