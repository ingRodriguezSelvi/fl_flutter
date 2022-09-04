
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String?     hintText;
  final String?     labelText;
  final String?     helperText;
  final IconData?   suffixIcon;
  final TextInputType? keyboardType;
  final bool       isPassword;

  final String formProperty;
  final Map<String,String> formValue;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.suffixIcon,
    this.keyboardType,
    this.isPassword = false,
    required this.formProperty,
    required this.formValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: isPassword,
      keyboardType: keyboardType,
      autofocus: true,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => formValue[formProperty] = value,
      validator:(value) {
        if ( value == null ) return 'This input is requeried';
        return value.length < 3 ? 'Min tree character': null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }
}
