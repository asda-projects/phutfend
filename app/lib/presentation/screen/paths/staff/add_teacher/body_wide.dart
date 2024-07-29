

// ignore_for_file: library_private_types_in_public_api

import 'package:app/data/models/custom_claims.dart';
import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/boilerplate/dialogs.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';
import 'package:app/presentation/utils/validation.dart';
import 'package:app/settings/logs.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart'; FontAwesomeIcons.[icon-name]

class AddUserForm extends StatefulWidget {
  const AddUserForm({super.key});

  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {

  AppLogger logger = AppLogger();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _socialID = TextEditingController();



  

@override
  Widget build(BuildContext context) {

  double defaultSizeOfBoxWidth = 50;
  double defaultSizeOfBoxHeight = 50;

    TextStyle defaultTextFormStyle =  TextStyle(
    fontSize: 14, color: Theme.of(context).scaffoldBackgroundColor
    );

    Color borderSideColor = Theme.of(context).scaffoldBackgroundColor;
    Color focusedBorderSideColor = Theme.of(context).colorScheme.onInverseSurface;


    return SingleChildScrollView(

        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize:  MainAxisSize.min,
        children: [
          SizedBox(height: defaultSizeOfBoxHeight),
          Row(
            mainAxisSize:  MainAxisSize.min,
            children: [
              Expanded(
                child: CustomTextFormField(
                  cursorColor:focusedBorderSideColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderSideColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: focusedBorderSideColor),
                     borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  hintStyle: defaultTextFormStyle,
                  labelStyle: defaultTextFormStyle,
                  labelText: 'Name',
                  ifIsEmptyReturn: IfIsEmptyReturn.name,
                  onChanged: (value) {},
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  validator: textFormIsName,
                ),
              ),
              SizedBox(width: defaultSizeOfBoxWidth),
              Expanded(
                child: CustomTextFormField(
                  cursorColor:focusedBorderSideColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderSideColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  focusedBorder:  OutlineInputBorder(
                     borderSide: BorderSide(color: focusedBorderSideColor),
                     borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  hintStyle: defaultTextFormStyle,
                  labelStyle: defaultTextFormStyle,
                  labelText: 'Email',
                  ifIsEmptyReturn: IfIsEmptyReturn.email,
                  onChanged: (value) {},
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: textFormIsEmail,
                ),
              ),
            ],
          ),
          SizedBox(height: defaultSizeOfBoxHeight),
          Row(
            mainAxisSize:  MainAxisSize.min,
            children: [
              Expanded(
                child: CustomTextFormField(
                  cursorColor:focusedBorderSideColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:borderSideColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: focusedBorderSideColor),
                     borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  hintStyle: defaultTextFormStyle,
                  labelStyle: defaultTextFormStyle,
                  labelText: 'Password',
                  ifIsEmptyReturn: IfIsEmptyReturn.password,
                  onChanged: (value) {},
                  controller: _passwordController,
                  obscureText: true,
                  validator: textFormIsPassword,
                ),
              ),
              SizedBox(width:defaultSizeOfBoxWidth),
              Expanded(
                child: CustomTextFormField(
                  cursorColor:focusedBorderSideColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderSideColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: focusedBorderSideColor),
                     borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  hintStyle: defaultTextFormStyle,
                  labelStyle: defaultTextFormStyle,
                  labelText: 'Phone',
                  ifIsEmptyReturn: IfIsEmptyReturn.phoneNumber,
                  onChanged: (value) {},
                  controller: _phoneController,
                  validator: textFormIsPhoneNumber,
                ),
              ),
            ],
          ),
          SizedBox(height: defaultSizeOfBoxHeight),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize:  MainAxisSize.min,
            children: [ 
             Expanded(
              child: DropList(
              items: 
                AbstractCustomClaims.genders
                , 
              onChanged: (value) => {  }, 
              labelText: 'Gender',
              hintStyle:  TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor),
              txtStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
              enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderSideColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  focusedBorder:  OutlineInputBorder(
                     borderSide: BorderSide(color: borderSideColor),
                     borderRadius: const BorderRadius.all(Radius.circular(10))
              )
              ),
              )
              ,
              SizedBox(width:defaultSizeOfBoxWidth),
             Expanded(
                child: CustomTextFormField(
                  cursorColor:focusedBorderSideColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderSideColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  focusedBorder:  OutlineInputBorder(
                     borderSide: BorderSide(color: focusedBorderSideColor),
                     borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  hintStyle: defaultTextFormStyle,
                  labelStyle: defaultTextFormStyle,
                  labelText: 'Age',
                  ifIsEmptyReturn: IfIsEmptyReturn.age,
                  onChanged: (value) {},
                  controller: _ageController,
                  validator: textFormIsAge,
          ))]),
          SizedBox(height: defaultSizeOfBoxHeight),
          
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize:  MainAxisSize.min,
            children: [ 
             Expanded(
              child: DropList(
              items: 
                AbstractCustomClaims.identificationNumberTypes
                , 
              onChanged: (value) => {  }, 
              labelText: 'Social ID type',
              hintStyle:  TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor),
              txtStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
              enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderSideColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  focusedBorder:  OutlineInputBorder(
                     borderSide: BorderSide(color: borderSideColor),
                     borderRadius: const BorderRadius.all(Radius.circular(10))
              )
              )),
              SizedBox(width:defaultSizeOfBoxWidth),
             Expanded(
                child: CustomTextFormField(
                  cursorColor:focusedBorderSideColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderSideColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  focusedBorder:  OutlineInputBorder(
                     borderSide: BorderSide(color: focusedBorderSideColor),
                     borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  hintStyle: defaultTextFormStyle,
                  labelStyle: defaultTextFormStyle,
                  labelText: 'Social ID number',
                  ifIsEmptyReturn: IfIsEmptyReturn.age,
                  onChanged: (value) {},
                  controller: _socialID,
                  validator: textFormIsOnlyNumber,
          ))]),
          SizedBox(height: defaultSizeOfBoxHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomIconAndTextButton(
              icon: Icons.check_circle,
              iconColor: Theme.of(context).colorScheme.onTertiary,
             onPressed: () {
                  // Handle adding user logic here
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  String phone = _phoneController.text;
                  String age = _ageController.text;
                  logger.debug('User Added: Name - $name, Email - $email, Password - $password, Phone - $phone, Age - $age');

                  // Close the dialog
                  Navigator.of(context).pop();
                },
              text: "Confirm",
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              switchToColumn: false,
              
              txtStyle:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor),
              btnStyle:  TextButton.styleFrom( 
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:   const EdgeInsets.symmetric(horizontal: 20, vertical: 15))),
              SizedBox(width:defaultSizeOfBoxWidth),
              CustomIconAndTextButton(
              icon: Icons.cancel,
              iconColor: Theme.of(context).colorScheme.onInverseSurface,
             onPressed: () {
                  Navigator.of(context).pop();
                },
              text: "Cancel",
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              switchToColumn: false,
              txtStyle:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor))
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}

class AddTeacherBodyWide extends StatelessWidget {
  
  const AddTeacherBodyWide({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: CustomIconAndTextButton(
              icon: Icons.person_add,
              iconColor: Theme.of(context).colorScheme.onTertiary,
              onPressed: () { 
                genericFormDialog(
                  context, 
                  const AddUserForm(), 
                  barrierDismissible: false);
                },
              text: "Add",
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              switchToColumn: false,
              
              txtStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              btnStyle: defaultBtnStyle(
                context, const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
            )),
            const Expanded(child: SizedBox()),
            CustomIconAndTextButton(
              icon: Icons.table_chart_outlined,
              iconColor: Theme.of(context).colorScheme.onTertiary,
              onPressed: () {},
              text: "Import",
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              switchToColumn: false,
              
              txtStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              btnStyle: defaultBtnStyle(
                context, const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
            ),
            const Expanded(child: SizedBox()),
            
            CustomIconAndTextButton(
              icon: Icons.edit_note_rounded,
              iconColor: Theme.of(context).colorScheme.onTertiary,
              onPressed: () {},
              text: "Edit",
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              switchToColumn: false,
              
              txtStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              btnStyle: defaultBtnStyle(
                context, const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
            ),
            const Expanded(child: SizedBox()),

            CustomIconAndTextButton(
              icon: Icons.person_remove,
              iconColor: Theme.of(context).colorScheme.onTertiary,
              onPressed: () {},
              text: "Delete",
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              switchToColumn: false,
              
              txtStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              btnStyle:  TextButton.styleFrom( 
                backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:   const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
            )

            ,
            const Expanded(child: SizedBox())
        ]),
        DataTable(
        columns: const [
          DataColumn(label: Text('Label 1')),
          DataColumn(label: Text('Label 2')),
          DataColumn(label: Text('Label 3')),
          DataColumn(label: Text('Label 4')),
          DataColumn(label: Text('Label 5')),
        ],
        rows: const  [
          DataRow(cells: [
            DataCell(Text('Content 1')),
            DataCell(Text('Content 2')),
            DataCell(Text('Content 3')),
            DataCell(Text('Content 4')),
            DataCell(Text('Content 5')),
          ]),
          DataRow(cells: [
            DataCell(Text('Content 6')),
            DataCell(Text('Content 7')),
            DataCell(Text('Content 8')),
            DataCell(Text('Content 9')),
            DataCell(Text('Content 10')),
          ]),
          DataRow(cells: [
            DataCell(Text('Content 11')),
            DataCell(Text('Content 12')),
            DataCell(Text('Content 13')),
            DataCell(Text('Content 14')),
            DataCell(Text('Content 15')),
          ]),
          DataRow(cells: [
            DataCell(Text('Content 16')),
            DataCell(Text('Content 17')),
            DataCell(Text('Content 18')),
            DataCell(Text('Content 19')),
            DataCell(Text('Content 20')),
          ]),
          DataRow(cells: [
            DataCell(Text('Content 21')),
            DataCell(Text('Content 22')),
            DataCell(Text('Content 23')),
            DataCell(Text('Content 24')),
            DataCell(Text('Content 25')),
          ]),
        ],
      ),
      ]);
  }
}