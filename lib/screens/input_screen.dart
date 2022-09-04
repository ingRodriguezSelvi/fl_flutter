import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputScreen extends StatelessWidget {

  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    final Map<String, String> formValues =
        {
          'name': 'Andres',
          'lastName': 'Rodriguez',
          'email': 'andres@gmail.com',
          'password': '123456',
          'role': 'admin',
        };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input and Form Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                 CustomInputField(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  helperText: 'Min tree character',
                  suffixIcon: Icons.accessibility_new_outlined,
                  formProperty: 'name',
                  formValue: formValues,
                ),const SizedBox(height: 30),
                 CustomInputField(
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                  helperText: 'Min tree character',
                  suffixIcon: Icons.accessibility_new_outlined,
                  formProperty: 'lastName',
                  formValue: formValues,
                ),const SizedBox(height: 30),
                 CustomInputField(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  helperText: 'Min tree character',
                  suffixIcon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValue: formValues,
                ),const SizedBox(height: 30),
                 CustomInputField(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  helperText: 'Min tree character',
                  suffixIcon: Icons.lock_open,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  formProperty: 'password',
                  formValue: formValues,
                ),const SizedBox(height: 30),

                DropdownButtonFormField(
                  value: formValues['role'],
                  items: const [
                    DropdownMenuItem(
                      value: 'admin',
                      child: Text('admin'),
                    ),
                    DropdownMenuItem(
                      value: 'user',
                      child: Text('user'),
                    ),
                  ],
                  onChanged: (value) => formValues['role'] = value.toString(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                ElevatedButton(
                    onPressed: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                      if ( !_formKey.currentState!.validate() ) return;
                      //*TODO: Validate form and save data
                      print(formValues);
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text('Save', textAlign: TextAlign.center),
                    )
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

