import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/core.dart';

class FozFormDatePicker extends StatefulWidget {
  final String? label;
  final DateTime? value;
  final String? hint;
  final String? Function(String?)? validator;
  final Function(String) onChanged;

  const FozFormDatePicker({
    Key? key,
    this.label,
    this.value,
    this.validator,
    this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<FozFormDatePicker> createState() => _FozFormDatePickerState();
}

class _FozFormDatePickerState extends State<FozFormDatePicker> {
  DateTime? selectedValue;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    controller = TextEditingController(
      text: getInitialValue(),
    );
  }

  getInitialValue() {
    if (widget.value != null) {
      return DateFormat("d MMM y").format(widget.value!);
    }
    return "";
  }

  getFormattedValue() {
    if (selectedValue != null) {
      return DateFormat("d MMM y").format(selectedValue!);
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(2100),
        );
        selectedValue = pickedDate;
        controller.text = getFormattedValue();
        setState(() {});

        widget.onChanged(DateFormat('yyyy-MM-dd').format(selectedValue!));
        print(
            'Date Picker: ${DateFormat('yyyy-MM-dd').format(selectedValue!)}');
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: radiusPrimary),
        child: TextFormField(
          controller: controller,
          readOnly: true,
          enabled: false,
          decoration: InputDecoration(
            hintText: 'Pilih Tanggal',
            labelStyle: const TextStyle(
              color: Colors.blueGrey,
            ),
            filled: true,
            fillColor: whiteColor,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.calendar_month),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
