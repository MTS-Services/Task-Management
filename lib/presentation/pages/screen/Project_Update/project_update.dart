import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/custom_drop_down.dart';
import 'package:maktrack/presentation/widgets/project_update_text_field.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';

class ProjectUpdate extends StatefulWidget {
  const ProjectUpdate({
      super.key,
      required this.selectedUpdateOption,
      required this.selectedProgressPercentage,
      required this.selectedUpdateComment});

  final String selectedUpdateOption;
  final String? selectedProgressPercentage;
  final String selectedUpdateComment;

  @override
  State<ProjectUpdate> createState() => _ProjectUpdateState();
}

class _ProjectUpdateState extends State<ProjectUpdate> {
  late TextEditingController percentageController;
  late TextEditingController commentController;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    percentageController = TextEditingController(text: widget.selectedProgressPercentage);
    commentController = TextEditingController(text: widget.selectedUpdateComment);
    selectedValue = widget.selectedUpdateOption;
  }

  void updateDetails() {
    Navigator.pop(context, {
      'selectedUpdateOption': selectedValue ?? widget.selectedUpdateOption,
      'selectedProgressPercentage': percentageController.text,
      'selectedUpdateComment': commentController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> item = [
      'Clarification Miss',
      'Initial Update',
      'Follow Up',
      'Extension',
      'Client Modification',
      'Modification Feed',
      'Delivery',
      'Project Type',
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              TextWidget(
                text: 'Project Update',
                size: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              CustomDropdown(
                items: item,
                hint: "Select Option",
                selectedValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              const SizedBox(height: 15),
              ProjectUpdateTextField(
                hintText: 'Progress Percentage',
                controller: percentageController,
              ),
              const SizedBox(height: 15),
              ProjectUpdateTextField(
                hintText: 'Comment',
                controller: commentController,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: updateDetails,
                child: TextWidget(
                  text: 'Confirm',
                  size: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
