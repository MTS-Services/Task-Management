import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/custom_drop_down.dart';
import 'package:maktrack/presentation/widgets/role_drop_down.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({super.key});

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String? selectedValue;
  String? selectedRole;

  List<String> items = ['Flutter', 'MERN', 'Laravel', 'PHP'];
  List<String> roleitems = ['Head of department', 'Leader', 'Co-leader', 'Elder'];

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
          },
        ),
        SizedBox(height: 20),
        RoleDropdown(
          items: roleitems,
          hint: "Role",
          selectedValue: selectedRole,
          onChanged: (value) {
            setState(() {
              selectedRole = value;
            });
          },
        ),
      ],
    );
  }
}