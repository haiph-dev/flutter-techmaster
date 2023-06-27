import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ViewDatePicker extends StatelessWidget {
  const ViewDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [BirthdaySelect()]),
      ),
    );
  }
}

class BirthdaySelect extends StatefulWidget {
  const BirthdaySelect({super.key});

  @override
  State<BirthdaySelect> createState() => _BirthdaySelectState();
}

class _BirthdaySelectState extends State<BirthdaySelect> {
  TextEditingController textDateController = TextEditingController();
  DateTime date = DateTime(
      DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);

  // DateTime date = DateTime.now().subtract(const Duration(days: 365 * 18));

  DateTime minDate = DateTime(
      DateTime.now().year - 60, DateTime.now().month, DateTime.now().day);

  void showDatePicker({required BuildContext context}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Localizations.override(
        context: context,
        locale: const Locale('vi'),
        child: Container(
            height: 300,
            color: Colors.white,
            child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                dateOrder: DatePickerDateOrder.dmy,
                initialDateTime: date,
                minimumDate: minDate,
                maximumDate: DateTime.now(),
                onDateTimeChanged: (date) {
                  // print('date: $date');
                  DateFormat dateFormat = DateFormat.yMMMMd('vi');
                  textDateController.text = dateFormat.format(date);
                  // textDateController.text =
                  //     '${date.day}/${date.month.}/${date.year}';
                })),
      ),
    );
  }

  @override
  void initState() {
    textDateController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    textDateController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: const Locale('vi'),
      child: TextField(
        onTap: () => showDatePicker(context: context),
        readOnly: true,
        controller: textDateController,
        decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today), labelText: 'Birthday'),
      ),
    );
  }
}
