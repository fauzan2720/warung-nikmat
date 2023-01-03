import 'package:flutter/material.dart';
import '/core.dart';

class FozFormTimePicker extends StatefulWidget {
  final String? label;
  final TimeOfDay? value;
  final String? hint;
  final String? Function(String?)? validator;
  final Function(TimeOfDay?) onChanged;

  const FozFormTimePicker({
    Key? key,
    this.label,
    this.value,
    this.validator,
    this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<FozFormTimePicker> createState() => _FozFormTimePickerState();
}

class _FozFormTimePickerState extends State<FozFormTimePicker> {
  TimeOfDay? selectedValue;
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
      var hh = widget.value?.hour.toString().padLeft(2, "0");
      var mm = widget.value?.minute.toString().padLeft(2, "0");
      return "$hh:$mm";
    }
    return "";
  }

  getFormattedValue() {
    if (selectedValue != null) {
      var hh = selectedValue?.hour.toString().padLeft(2, "0");
      var mm = selectedValue?.minute.toString().padLeft(2, "0");
      return "$hh:$mm";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child ?? Container(),
            );
          },
        );
        print("pickedTime: $pickedTime");
        selectedValue = pickedTime;
        controller.text = getFormattedValue();
        setState(() {});

        widget.onChanged(selectedValue);
      },
      child: AbsorbPointer(
        child: Container(
          decoration: BoxDecoration(borderRadius: radiusPrimary),
          child: TextFormField(
            controller: controller,
            readOnly: true,
            enabled: false,
            validator: (value) {
              if (widget.validator != null) {
                return widget.validator!(selectedValue.toString());
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Pilih Waktu',
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
                child: Icon(Icons.timer),
              ),
            ),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
