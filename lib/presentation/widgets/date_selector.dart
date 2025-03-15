import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  int selectedDate = 0;

  void selectedTab(int index) {
    setState(() {
      selectedDate = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              print(index);
              return GestureDetector(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: TextWidget(
                        text: 'Today',
                        size: 16,
                        fontWeight: FontWeight.normal,
                        color: selectedDate == index
                            ? RColors.blackButtonColor3
                            : Colors.grey,
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 90,
                      color: selectedDate == index
                          ? RColors.blackButtonColor3
                          : Colors.grey,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
