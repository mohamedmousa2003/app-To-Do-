import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/app_colors.dart';

import '../../const/string_const.dart';

class HomeView extends StatefulWidget {
  static String routeName = 'home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "October 2,2023",
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
              initialSelectedDate: DateTime.now(),
              selectionColor: iconColorBlue,
              monthTextStyle: const TextStyle(color: whiteColor, fontSize: 23),
              dateTextStyle: const TextStyle(color: whiteColor, fontSize: 23),
              dayTextStyle: const TextStyle(color: whiteColor, fontSize: 23),
              deactivatedColor: whiteColor,
              selectedTextColor: whiteColor,
              onDateChange: (date) {}),
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
/*
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static String routeName="home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'October 2, 2023',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Today',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.black,
                child: CalendarWidget(),
              ),
              SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/images/home_vector.png'), // replace with your local image asset
                    ),
                    SizedBox(height: 20),
                    Text(
                      'What do you want to do today?',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Tap + to add your tasks',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              return Text(
                'OCT',
                style: TextStyle(color: Colors.white),
              );
            }),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              final days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
              return Text(
                days[index],
                style: TextStyle(color: Colors.white),
              );
            }),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              final days = [1, 2, 3, 4, 5, 6, 7];
              return Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: days[index] == 2 ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '${days[index]}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

 */
