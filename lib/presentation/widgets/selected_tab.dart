import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';

class SelectedTab extends StatefulWidget {
  const SelectedTab({super.key});

  @override
  State<SelectedTab> createState() => _SelectedTabState();
}

class _SelectedTabState extends State<SelectedTab> {
  int selectedIndex = 0;

  void changedColor(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabName = [
      'All',
      'InPrograms ',
      'Completed',
    ];
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            child: GestureDetector(
              onTap: () => changedColor(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.linearToEaseOut,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: selectedIndex == index
                      ? RColors.blueButtonColors
                      : Colors.white,
                ),
                child: TextWidget(
                  text: tabName[index],
                  size: 15,
                  fontWeight: FontWeight.normal,
                  color: selectedIndex == index
                      ? Colors.white
                      : RColors.blueButtonColors,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
