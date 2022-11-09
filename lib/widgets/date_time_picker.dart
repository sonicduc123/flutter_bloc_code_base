import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/app_colors.dart';
import 'input_text_box/validate_input.dart';

typedef PickDateTime = Function(String value);

class DateTimePicker extends StatefulWidget {
  const DateTimePicker(
      {Key? key,
      required this.initDate,
      required this.pickDate,
      this.placeHolder = '',
      this.label = ''})
      : super(key: key);

  final String initDate;
  final PickDateTime pickDate;
  final String label;
  final String placeHolder;

  @override
  DateTimePickerState createState() => DateTimePickerState();
}

class DateTimePickerState extends State<DateTimePicker> {
  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  late DateTime selectedDateTime;
  late TextEditingController datetimeController;
  DateFormat dateFormat = DateFormat('HH:mm dd/MM/yyyy');

  @override
  void dispose() {
    datetimeController.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    datetimeController = TextEditingController();
    setState(() {
      if (widget.initDate != '') {
        selectedDate = DateTime.parse(widget.initDate);
        datetimeController.text = dateFormat.format(selectedDate);
      } else {
        selectedDate = DateTime(1985, 1, 1);
      }
      selectedTime = const TimeOfDay(hour: 0, minute: 0);
    });
  }

  bool _decideWhichDayToEnable(DateTime day) {
    // if ((day.isAfter(DateTime.now()))) {
    //   return false;
    // }
    return true;
  }

  // select date time picker
  Future _selectDateTime(BuildContext context) async {
    // pick date
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1800, 1),
      lastDate: DateTime(2100),
      selectableDayPredicate: _decideWhichDayToEnable,
      locale: const Locale('vi'),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    // pick time
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }

    setState(() {
      selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
      datetimeController.text = dateFormat.format(selectedDateTime);
      widget.pickDate(selectedDateTime.toString());
    });
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
                controller: datetimeController,
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
                onFieldSubmitted: (value) {
                  List<String> split = value.split('/');
                  int? day = int.tryParse(split[0]);
                  int? month = int.tryParse(split[1]);
                  int? year = int.tryParse(split[2]);
                  if (day == null || month == null || year == null) {
                    return;
                  }
                  setState(() {
                    selectedDate = DateTime(year, month, day);
                    widget.pickDate(selectedDate.toString());
                    log('save date');
                  });
                },
                //textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                _selectDateTime(context);
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
