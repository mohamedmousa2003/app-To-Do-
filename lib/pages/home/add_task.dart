import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:todo/const/string_const.dart';
import 'package:todo/core/custom_extension.dart';

import '../../core/app_colors.dart';
import '../../firebase/firebase_manager.dart';
import '../../models/task_model.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class AddTask extends StatefulWidget {
  static String routeName = "add";

  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var noteController = TextEditingController();
  DateTime dataTime = DateTime.now();
  String startDateFormat = DateFormat('hh:mm a').format(DateTime.now());
  String endDateFormat = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 60)));
  int isSelect = 0;
  Color? colorSelect;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text(
          addTask,
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    if (text == null || text.trim().isEmpty) {
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
                    if (text == null || text.trim().isEmpty) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    startDateFormat,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        startShowTimer();
                                      },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    endDateFormat,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        endShowTimer();
                                      },
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
                  ],
                ),
                24.height,
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        color,
                        style: theme.textTheme.titleSmall
                            ?.copyWith(color: whiteColor.withOpacity(.87)),
                      ),
                      8.height,
                      Expanded(
                          child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          Color getColor(index) {
                            switch (index) {
                              case 0:
                                return redColor;
                              case 1:
                                return iconColorBlue;
                              case 2:
                                return yellowColor;
                              default:
                                return greenColor;
                            }
                          }

                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: StreamBuilder<Object>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return InkWell(
                                    onTap: () {
                                      isSelect = index;
                                      setState(() {});
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: getColor(index),
                                      child: isSelect == index
                                          ? const Icon(Icons.check,
                                              color: whiteColor)
                                          : null,
                                    ),
                                  );
                                }),
                          );
                        },
                      )),
                    ],
                  ),
                ),
                92.height,
                CustomButton(
                  title: createTask.toUpperCase(),
                  onTap: () async {
                    if (formKey.currentState?.validate() == true) {
                      setState(() {});
                      TaskModel task = TaskModel(
                        title: titleController.text,
                        startTime: startDateFormat,
                        endTime: endDateFormat,
                        description: noteController.text,
                        color: colorSelect,
                      );
                      await FirebaseManager.addTask(task).timeout(
                        const Duration(milliseconds: 500),
                        onTimeout: () {
                          Fluttertoast.showToast(
                            msg: "The task was added successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            backgroundColor: whiteColor,
                            textColor: blackColor,
                            fontSize: 20,
                          );
                          Navigator.pop(context);
                          // used alert or aad package toast
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
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
  startShowTimer() async {
    TimeOfDay? choseTimer = await showTimePicker(
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
        initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (choseTimer != null) {
      startDateFormat = choseTimer.format(context);
    }
    setState(() {});
  }
  endShowTimer() async {
    TimeOfDay? choseTimer = await showTimePicker(
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
        initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (choseTimer != null) {
      endDateFormat = choseTimer.format(context);
    }
    setState(() {});
  }
}