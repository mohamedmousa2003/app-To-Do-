import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/app_colors.dart';
import 'package:todo/core/custom_extension.dart';
import 'package:todo/pages/home/add_task.dart';
import 'package:todo/pages/home/task_complete.dart';

import '../../const/string_const.dart';
import '../../firebase/firebase_manager.dart';
import '../../models/task_model.dart';

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

          // task compelet
          StreamBuilder(
            stream: FirebaseManager.getTask(dataTime),
            builder: (context, snapshot) {
              // if the data It's still coming
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: iconColorBlue,
                  ),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "error",
                    style: TextStyle(
                      color: redColor,
                      fontSize: 30,
                    ),
                  ),
                );
              }
              List<TaskModel> tasks = snapshot.data?.docs
                      .map(
                        (e) => e.data(),
                      )
                      .toList() ??
                  [];

              return tasks.isEmpty
                  ? noTaskWidget(theme)
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return TaskComplete(task: tasks[index]);
                        },
                        itemCount: tasks.length,
                      ),
                    );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _builderSowTak();
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

  _builderSowTak() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => const AddTask());
  }
}
