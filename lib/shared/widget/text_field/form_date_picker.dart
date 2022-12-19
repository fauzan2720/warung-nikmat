import 'package:flutter/material.dart';
import '/core.dart';

class FozFormDatePicker extends StatelessWidget {
  const FozFormDatePicker({super.key});

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
        print("pickedDate: $pickedDate");
      },
      child: TextFormField(
        initialValue: '',
        enabled: false,
        decoration: InputDecoration(
          hintText: 'Pilih Tanggal',
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
            child: Icon(Icons.calendar_month),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
