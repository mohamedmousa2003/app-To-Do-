import 'package:flutter/material.dart';
import 'package:todo/const/string_const.dart';
import 'package:todo/core/custom_extension.dart';

import '../../core/app_colors.dart';
import '../widget/custom_text_field.dart';

class AddTask extends StatefulWidget {
  static String routeName = "add";

  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();

  var noteController = TextEditingController();
  DateTime dataTime = DateTime.now();
  int isSelect = 1;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          addTask,
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.width,
            Text(
              title,
              style: theme.textTheme.titleSmall
                  ?.copyWith(color: whiteColor.withOpacity(.87)),
            ),
            8.height,
            CustomTextField(
              controller: titleController,
              hint: enterTitleHere,
              onValidate: (text) {
                if (text == null || text
                    .trim()
                    .isEmpty) {
                  return "please enter your Name";
                }
                return null;
              },
              keyboardType: TextInputType.text,
            ),
            24.height,
            Text(
              note,
              style: theme.textTheme.titleSmall
                  ?.copyWith(color: whiteColor.withOpacity(.87)),
            ),
            8.height,
            CustomTextField(
              controller: noteController,
              hint: enterNoteHere,
              maxLines: 3,
              onValidate: (text) {
                if (text == null || text
                    .trim()
                    .isEmpty) {
                  return "please enter your Name";
                }
                return null;
              },
              keyboardType: TextInputType.text,
            ),
            24.height,
            Text(
              date,
              style: theme.textTheme.titleSmall
                  ?.copyWith(color: whiteColor.withOpacity(.87)),
            ),
            8.height,
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: grayColorD,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: whiteColor, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${dataTime.day}/${dataTime.month}/${dataTime.year}",
                      style: theme.textTheme.titleSmall,
                    ),
                    InkWell(
                        onTap: () {
                          showCalender();
                        },
                        child: const Icon(
                          Icons.calendar_month,
                          color: whiteColor,
                        ))
                  ],
                ),
              ),
            ),
            24.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(startTime, style: theme.textTheme.titleSmall),
                      8.height,
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: grayColorD,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: whiteColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${dataTime.day}/${dataTime.month}/${dataTime.year}",
                                style: theme.textTheme.titleSmall,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.timer,
                                    color: whiteColor,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                27.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(endTime, style: theme.textTheme.titleSmall),
                      8.height,
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: grayColorD,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: whiteColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${dataTime.day}/${dataTime.month}/${dataTime.year}",
                                style: theme.textTheme.titleSmall,
                              ),
                              InkWell(
                                  onTap: () {
                                    showCalender();
                                  },
                                  child: const Icon(
                                    Icons.calendar_month,
                                    color: whiteColor,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            24.height,
            Text(
              color,
              style: theme.textTheme.titleSmall
                  ?.copyWith(color: whiteColor.withOpacity(.87)),
            ),
            8.height,
            Row(
              children: [
                buildColor(redColor, 1),
                const SizedBox(width: 15),
                buildColor(iconColorBlue, 2),
                const SizedBox(width: 15),
                buildColor(yellowColor, 3),
                const SizedBox(width: 15),
                buildColor(greenColor, 4),
              ],
            ),
            92.height,
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: iconColorBlue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    createTask.toUpperCase(),
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ),
            ),
            55.width,
          ],
        ),
      ),
    );
  }

  buildColor(Color colors, int index) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: colors,
        ),
        const Align(
          alignment: Alignment.center,
          child: Icon(Icons.check, color: whiteColor),
        ),
        Container(),
      ],
    );
  }

  showCalender() async {
    var choseData = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: iconColorBlue, // header background color
              onPrimary: whiteColor, // header text color
              onSurface: whiteColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: iconColorBlue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      firstDate: DateTime.now(),
      initialDate: dataTime,
      lastDate: DateTime.now().add(const Duration(days: 356)),
    );
    if (choseData != null) {
      dataTime = choseData;
    }
    setState(() {});
  }
}