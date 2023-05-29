import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              _TopPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              ),
              const _BottomPart(),
            ]),
          ),
        ));
  }

  onHeartPressed() {
    final DateTime now = DateTime.now();
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: Colors.white,
                height: 300.0,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate,
                  maximumDate: DateTime(now.year, now.month, now.day),
                  onDateTimeChanged: (DateTime date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                )),
          );
        });
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;
  const _TopPart(
      {required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final now = DateTime.now();
    return Expanded(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "U&I",
          style: theme.headline1,
        ),
        Column(
          children: [
            Text(
              '우리 처음 만난 날',
              style: theme.bodyText1,
            ),
            Text(
              '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
              style: theme.bodyText2,
            )
          ],
        ),
        IconButton(
            onPressed: onPressed,
            iconSize: 60.0,
            icon: const Icon(Icons.favorite, color: Colors.red)),
        Text(
          'D+${DateTime(now.year, now.month, now.day).difference(selectedDate).inDays + 1}',
          style: theme.headline2,
        )
      ]),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/middle_image.png'));
  }
}
