import 'package:flutter/material.dart';
import 'package:todo/const/string_const.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: theme.textTheme.titleSmall
                  ?.copyWith(color: whiteColor.withOpacity(.87)),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: titleController,
              hint: enterTitleHere,
              onValidate: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "please enter your Name";
                }
                return null;
              },
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              note,
              style: theme.textTheme.titleSmall
                  ?.copyWith(color: whiteColor.withOpacity(.87)),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: noteController,
              hint: enterNoteHere,
              maxLines: 3,
              onValidate: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "please enter your Name";
                }
                return null;
              },
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              date,
              style: theme.textTheme.titleSmall
                  ?.copyWith(color: whiteColor.withOpacity(.87)),
            ),
            const SizedBox(
              height: 8,
            ),
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
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(startTime, style: theme.textTheme.titleSmall),
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
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(endTime, style: theme.textTheme.titleSmall),
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
            const SizedBox(height: 5),
          ],
        ),
      ),
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
