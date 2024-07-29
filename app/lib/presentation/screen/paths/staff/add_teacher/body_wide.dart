

import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:flutter/material.dart';

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
              onPressed: () {},
              text: "Add new",
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