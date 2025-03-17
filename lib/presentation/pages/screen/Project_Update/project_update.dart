import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/custom_drop_down.dart';
import 'package:maktrack/presentation/widgets/project_update_text_field.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';

class ProjectUpdate extends StatefulWidget {
  const ProjectUpdate({
    super.key,
    required this.selectedProgressPercentage,
    required this.selectedCommentController,
    required this.onConfirm,
  });

  final TextEditingController selectedProgressPercentage;
  final TextEditingController selectedCommentController;
  final Function(String updateName) onConfirm;

  @override
  State<ProjectUpdate> createState() => _ProjectUpdateState();
}

class _ProjectUpdateState extends State<ProjectUpdate> {
  TextEditingController percentageController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  String? selectedValue;

  @override
  void dispose() {
    percentageController.dispose();
    commentController.dispose();
    super.dispose();
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
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center horizontally
            children: [
              SizedBox(
                height: 200,
              ),
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
                onPressed: () {
                  if (selectedValue == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: TextWidget(
                            text: 'Please select an update option!',
                            size: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    );
                    return;
                  }

                  // Set the percentage and comment values
                  widget.selectedProgressPercentage.text =
                      percentageController.text;

                  // Check if the percentage is not empty or null
                  if (widget.selectedProgressPercentage.text.isNotEmpty) {
                    // Validate if the percentage is a valid number and within range
                    double? percentage =
                        double.tryParse(widget.selectedProgressPercentage.text);
                    if (percentage == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: TextWidget(
                              text:
                                  'Invalid percentage input! Please enter a valid number.',
                              size: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      );
                      return;
                    }
                    if (percentage < 0 || percentage > 100) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: TextWidget(
                              text:
                                  'Invalid percentage. The Number should be between 0 and 100',
                              size: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      );
                      return;
                    }
                  }

                  widget.selectedCommentController.text =
                      commentController.text;
                   // Check if comment is empty
                  if (widget.selectedCommentController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please type a comment!',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                    return;
                  }

                  // Call onConfirm with selected update name
                  widget.onConfirm(
                      selectedValue!); // Send selected update name back

                  // Go back to previous screen
                  Navigator.of(context).pop();
                },
                child: TextWidget(
                  text: 'Confirm',
                  size: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
