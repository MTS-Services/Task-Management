import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/widgets/custom_app_bar.dart';
import 'package:maktrack/presentation/widgets/total_price_widget.dart';

class CreateNewProject extends StatefulWidget {
  const CreateNewProject({super.key});

  @override
  State<CreateNewProject> createState() => _CreateNewProjectState();
}

class _CreateNewProjectState extends State<CreateNewProject> {
  final List<Map<String, dynamic>> tasks = [
    {
      "title": "Create a new project",
      "Total": "Project Details",
    },
  ]
      .map((task) => {
    ...task,
    "Project Name": "",
    "Project Type": "",
    " Project Progress (%) ": "",
    " Assign Date": "",
    "Project Timeline": "",
    "amountController": TextEditingController(),
    "projectsController": TextEditingController(),
  })
      .toList();

  InputDecoration customInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade600),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
    );
  }

  @override
  void dispose() {
    for (var task in tasks) {
      task['amountController'].dispose();
      task['projectsController'].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                text: "Back",
                images: AssetPath.logoPng,
                onPressed: () {
                  Get.back();
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: RColors.bgColorColorS,
                      elevation: 10,
                      shadowColor: Colors.grey.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tasks[index]["title"],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TotalPriceWidget(
                              text: tasks[index]["Total"] ?? "Unknown",
                            ),
                            const SizedBox(height: 10),
                            Column(
                              spacing: 10,
                              children: [
                                TextFormField(
                                    controller: tasks[index]
                                    ['amountController'],
                                    keyboardType: TextInputType.number,
                                    decoration: customInputDecoration("Project Name"),
                                    onChanged: (value) {
                                      tasks[index]['Project Name'] = value;
                                    },
                                  ),
                                TextFormField(
                                  controller: tasks[index]
                                  ['amountController'],
                                  keyboardType: TextInputType.number,
                                  decoration: customInputDecoration( "Project Type"),
                                  onChanged: (value) {
                                    tasks[index][' "Project Type'] = value;
                                  },
                                ),
                                TextFormField(
                                  controller: tasks[index]
                                  ['amountController'],
                                  keyboardType: TextInputType.number,
                                  decoration: customInputDecoration( "Project Progress (%)"),
                                  onChanged: (value) {
                                    tasks[index]['Project Progress (%)'] = value;
                                  },
                                ),
                                TextFormField(
                                  controller: tasks[index]
                                  ['amountController'],
                                  keyboardType: TextInputType.number,
                                  decoration: customInputDecoration(" Assign Date"),
                                  onChanged: (value) {
                                    tasks[index]['" Assign Date"'] = value;
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the next screen where the dashboard is
                  },
                  child: const Text("Proceed to Dashboard"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
