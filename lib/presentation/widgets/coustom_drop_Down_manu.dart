import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/custom_drop_down.dart';
import 'package:maktrack/presentation/widgets/role_drop_down.dart';

class CustomDropDownMenu extends StatefulWidget {
  final Function(dynamic value) onChanged; // Add this field
  final String selectedValue;

  const CustomDropDownMenu({
    super.key,
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String? selectedValue;
  String? selectedRole;

  List<String> items = ['Flutter', 'MERN', 'Laravel', 'PHP'];
  List<String> roleItems = [
    'Boss',
    'Head of Department',
    'Leader',
    'Co-leader',
  ];

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue; // Initialize the selected value
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdown(
          items: items,
          hint: "Select Technology",
          selectedValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            widget.onChanged(value);
          },
        ),
        SizedBox(height: 20),
        RoleDropdown(
          items: roleItems,
          hint: "Role",
          selectedValue: selectedRole,
          onChanged: (value) {
            setState(() {
              selectedRole = value;
            });
            widget.onChanged(value);
          },
        ),
      ],
    );
  }
}
