import 'dart:developer';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'input_text_box/date_text_formatter.dart';
import 'input_text_box/validate_input.dart';
import 'package:intl/intl.dart';

typedef PickDate = Function(String value);

class DatePicker extends StatefulWidget {
  const DatePicker(
      {Key? key,
      required this.initDate,
      required this.pickDate,
      this.placeHolder = '',
      this.label = ''})
      : super(key: key);

  final String initDate;
  final PickDate pickDate;
  final String label;
  final String placeHolder;

  @override
  DatePickerState createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  late DateTime selectedDate;
  late TextEditingController dateController;

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    dateController = TextEditingController();
    setState(() {
      if (widget.initDate != '') {
        selectedDate = DateTime.parse(widget.initDate);
        DateFormat dateFormat = DateFormat('dd/MM/yyyy');
        dateController.text = dateFormat.format(selectedDate);
      } else {
        selectedDate = DateTime(1985, 1, 1);
      }
    });
  }

  bool _decideWhichDayToEnable(DateTime day) {
    // if ((day.isAfter(DateTime.now()))) {
    //   return false;
    // }
    return true;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2100),
      selectableDayPredicate: _decideWhichDayToEnable,
      locale: const Locale('vi'),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        DateFormat dateFormat = DateFormat('dd/MM/yyyy');
        dateController.text = dateFormat.format(selectedDate);
        widget.pickDate(selectedDate.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: dateController,
                //textAlign: TextAlign.center,
                keyboardType: TextInputType.datetime,
                // decoration: const InputDecoration(
                //   hintText: "Enter your birthday",
                // ),
                decoration: InputDecoration(
                  // border: const UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Color(0xFFE1E3E8)),
                  // ),
                  // enabledBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Color(0xFFE1E3E8)),
                  // ),
                  label: Text(widget.label),
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
                validator: (value) => validateInput(value, widget.label),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onSaved: (value) {
                  log('Submit');
                  List<String> split = value!.split('/');
                  int? day = int.tryParse(split[0]);
                  int? month = int.tryParse(split[1]);
                  int? year = int.tryParse(split[2]);
                  if (day == null || month == null || year == null) {
                    return;
                  }
                  setState(() {
                    selectedDate = DateTime(year, month, day);
                    widget.pickDate(selectedDate.toString());
                  });
                },
                inputFormatters: [DateTextFormatter()],
                //textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                _selectDate(context);
              },
              icon: Icon(
                Icons.calendar_today,
                color: AppColors.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
