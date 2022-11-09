import 'package:flutter/material.dart';

typedef GetDropdownValue = Function(dynamic value);

class Dropdown extends StatefulWidget {
  const Dropdown(
      {Key? key,
      //required this.title,
      required this.hint,
      required this.listItem,
      required this.callback,
      this.initValue,
      this.value,
      this.type = 1,
      this.icon})
      : super(key: key);

  //final String title;
  final String hint;
  final List<dynamic> listItem;
  final GetDropdownValue callback;
  final dynamic initValue;
  final dynamic value;
  final int type;
  final IconData? icon;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  dynamic dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.icon != null)
          Row(
            children: [
              Icon(
                widget.icon,
                color: const Color.fromARGB(255, 126, 126, 126),
              ),
              const SizedBox(width: 15),
            ],
          ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   widget.title,
              //   style: widget.type == 2
              //       ? const TextStyle(
              //           fontWeight: FontWeight.bold,
              //         )
              //       : const TextStyle(fontSize: 14),
              // ),
              DropdownButton<dynamic>(
                elevation: 3,
                hint: Text(widget.hint,
                    style: const TextStyle(color: Colors.grey)),
                value: widget.value ?? dropdownValue,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                isExpanded: true,
                // style: const TextStyle(
                //   color: Colors.black,
                //   fontWeight: FontWeight.bold,
                //   fontSize: 16,
                // ),
                underline: Container(
                  height: 2,
                  color: const Color.fromARGB(255, 191, 191, 191),
                ),
                onChanged: (dynamic newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    widget.callback(newValue);
                  });
                },
                items: widget.listItem
                    .map<DropdownMenuItem<dynamic>>((dynamic value) {
                  return DropdownMenuItem<dynamic>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
