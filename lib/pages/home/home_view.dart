import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/app_colors.dart';
import 'package:todo/core/custom_extension.dart';
import 'package:todo/pages/home/add_task.dart';

import '../../const/string_const.dart';
import '../widget/custom_button.dart';

class HomeView extends StatefulWidget {
  static String routeName = 'home';

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime dataTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat.yMMMd().format(dataTime),
          //"${dataTime.day}/${dataTime.month}/${dataTime.year}",
          style: theme.textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          20.height,
          DatePicker(
              height: 130,
              width: 80,
              DateTime.now(),
              initialSelectedDate: dataTime,
              selectionColor: calenderColor,
              monthTextStyle: const TextStyle(color: whiteColor, fontSize: 23),
              dateTextStyle: const TextStyle(color: whiteColor, fontSize: 23),
              dayTextStyle: const TextStyle(color: whiteColor, fontSize: 23),
              deactivatedColor: whiteColor,
              selectedTextColor: whiteColor, onDateChange: (date) {
            dataTime = date;
            setState(() {});
          }),
          20.height,
          // no task
          //noTaskWidget(theme),
          TaskComplete(theme: theme),
          TaskComplete(theme: theme),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTask.routeName);
        },
        child: Icon(
          Icons.add,
          color: whiteColor,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: iconColorBlue,
      ),
    );
  }

  Column noTaskWidget(ThemeData theme) {
    return Column(
      children: [
        Image.asset("assets/images/home_vector.png",
            fit: BoxFit.cover, width: 300),
        30.height,
        Text(
          whatDoYouWant,
          style: theme.textTheme.bodyMedium,
        ),
        10.height,
        Text(
          tapAppTask,
          style: theme.textTheme.titleSmall
              ?.copyWith(color: whiteColor.withOpacity(0.70)),
        ),
      ],
    );
  }
}

class TaskComplete extends StatelessWidget {
  const TaskComplete({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: showBottomColor,
          context: context,
          builder: (context) {
            return SizedBox(
              height: 240,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                child: Column(
                  children: [
                    CustomButton(
                      title: complete,
                      onTap: () {},
                    ),
                    15.height,
                    CustomButton(
                      title: delete,
                      onTap: () {},
                      colorElevatedButton: redColor,
                    ),
                    15.height,
                    CustomButton(
                      title: cancel,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        height: 128,
        width: double.infinity,
        decoration: BoxDecoration(
          color: yellowColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Task 1",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontSize: 24, color: whiteColor),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.timer,
                      color: whiteColor,
                    ),
                    8.width,
                    Text(
                      "09:33 PM - 09:48 PM",
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
                Text(
                  "Learn SQLITE ",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: whiteColor, fontSize: 24),
                ),
              ],
            ),
            Row(
              children: [
                const VerticalDivider(
                  width: 2,
                  thickness: 3,
                  color: whiteColor,
                  indent: 10,
                  endIndent: 10,
                ),
                9.width,
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    " TODO",
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: whiteColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
