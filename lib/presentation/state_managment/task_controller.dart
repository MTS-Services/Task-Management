import 'package:get/get.dart';
import 'package:maktrack/database/database_helper.dart';
import 'package:maktrack/model/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTaskList();
    super.onReady();
  }

  var taskList = <Task>[].obs;


  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }


  void getTaskList()async{
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }


  Future<int> deleteTask(int id) async {
    return await DBHelper.delete(id);
  }


}
