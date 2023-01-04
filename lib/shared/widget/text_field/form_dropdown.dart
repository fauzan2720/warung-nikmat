import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class FozFormDropdown extends StatefulWidget {
  const FozFormDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.initialvalue,
    this.width,
  });
  final List<String> items;
  final Function(String) onChanged;
  final String? initialvalue;
  final double? width;

  @override
  State<FozFormDropdown> createState() => _FozFormDropdownState();
}

class _FozFormDropdownState extends State<FozFormDropdown> {
  String? value;

  @override
  void initState() {
    value = widget.items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: horizontalSize),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radiusPrimarySize),
          border: Border.all(color: strokeColor, width: 1.0),
        ),
        child: SizedBox(
          height: heightButton,
          width: widget.width ?? Get.width,
          child: FormField(
            initialValue: true,
            enabled: true,
            builder: (FormFieldState<bool> field) {
              return InputDecorator(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(-10.0, 18.0, -2.0, 18.0),
                  labelStyle: TextStyle(color: whiteColor),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    value: widget.initialvalue ?? value,
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 24.0,
                      color: strokeColor,
                    ),
                    elevation: 16,
                    dropdownColor: cardColor,
                    borderRadius: BorderRadius.circular(radiusPrimarySize),
                    style: TextStyle(
                      color: secondaryColor,
                    ),
                    items: widget.items
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue;
                        widget.onChanged(newValue!);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
