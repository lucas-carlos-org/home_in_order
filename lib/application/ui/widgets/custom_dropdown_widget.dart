// ignore_for_file: library_private_types_in_public_api, must_be_immutable
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  void Function(dynamic)? onSaved;
  String? Function(dynamic)? validator;
  String? value;
  final String hintText;
  CustomDropdownWidget({Key? key, required this.value, required this.onSaved, required this.hintText})
      : super(key: key);

  @override
  _CustomDropdownWidgetState createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  String _myActivity = '';
  final formKey = GlobalKey<FormState>();

  _saveForm() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        widget.value = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DropDownFormField(
              hintText: widget.hintText,
              value: _myActivity,
              onSaved: widget.onSaved,
              onChanged: (value) {
                setState(() {
                  _myActivity = value;
                });
                _saveForm();
              },
              dataSource: const [
                {
                  "display": "Torres",
                  "value": "Torres",
                },
                {
                  "display": "Capão da Canoa",
                  "value": "Capão da Canoa",
                },
                {
                  "display": "Arroio do Sal",
                  "value": "Arroio do Sal",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),
          ],
        ),
      ),
    );
  }
}
