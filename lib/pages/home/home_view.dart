import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/app_colors.dart';

import '../../const/string_const.dart';

class HomeView extends StatefulWidget {
  static String routeName = 'home';

  const HomeView({super.key});

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
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          Image.asset("assets/images/home_vector.png",
              fit: BoxFit.cover, width: 300),
          const SizedBox(height: 30),
          Text(
            whatDoYouWant,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          Text(
            tapAppTask,
            style: theme.textTheme.titleSmall
                ?.copyWith(color: whiteColor.withOpacity(0.70)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
}
