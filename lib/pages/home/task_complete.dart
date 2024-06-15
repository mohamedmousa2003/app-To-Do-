import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/core/custom_extension.dart';

import '../../core/app_colors.dart';
import '../../firebase/firebase_manager.dart';
import '../../models/task_model.dart';

class TaskComplete extends StatelessWidget {
  TaskComplete({
    required this.task,
    super.key,
  });

  TaskModel task;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      height: 128,
      width: double.infinity,
      decoration: BoxDecoration(
        color: yellowColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.3,
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          // All actions are defined in the children parameter.
          children: [
            SlidableAction(
              onPressed: (context) {
                flex:
                2;
                FirebaseManager.deleteTask(task.id ?? "");
              },
              backgroundColor: yellowColor,
              foregroundColor: whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.width,
                Text(
                  task.title ?? "",
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
                      "${task.startTime} - ${task.endTime}",
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
                Text(
                  task.description ?? "",
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

/*
InkWell(
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
                      onTap: () {
                        // FirebaseManager.deleteTask(task?.id ?? "");
                      },
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
      child:
 */
