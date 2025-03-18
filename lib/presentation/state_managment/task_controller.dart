
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
    int result = await DBHelper.insert(task);
    if (result > 0) {
      taskList.insert(0, task);
    }
    return result;
  }

  void getTaskList() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((e) => Task.fromJson(e)).toList());
  }

  void deleteTask(Task task) async {
    await DBHelper.delete(task);
    getTaskList();
  }
}
