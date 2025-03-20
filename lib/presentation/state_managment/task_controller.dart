import 'package:get/get.dart';
import 'package:maktrack/database/database_helper.dart';
import 'package:maktrack/model/task.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;

  @override
  void onReady() {
    super.onReady();
    getTaskList();
  }

  Future<int> addTask({required Task task}) async {
    await DBHelper.initDatabase();
    int taskId = await DBHelper.insert(task);
    if (taskId > 0) {
      task.id = taskId;
      taskList.insert(0, task);
    }

    return taskId;
  }

  void getTaskList() async {
    await DBHelper.initDatabase();
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((e) => Task.fromJson(e)).toList());
  }

  void deleteTask(Task task) async {
    await DBHelper.initDatabase();

    int result = await DBHelper.delete(task);
    if (result > 0) {
      taskList.removeWhere((t) => t.id == task.id);
    }
  }
}
