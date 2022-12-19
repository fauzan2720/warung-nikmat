import 'package:flutter/material.dart';
import '/core.dart';

class FozFormTimePicker extends StatelessWidget {
  const FozFormTimePicker({super.key});

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
      },
      child: TextFormField(
        initialValue: '',
        enabled: false,
        decoration: InputDecoration(
          hintText: 'Pilih Waktu',
          labelStyle: const TextStyle(
            color: Colors.blueGrey,
          ),
          filled: true,
          fillColor: whiteColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusPrimarySize),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.history),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
