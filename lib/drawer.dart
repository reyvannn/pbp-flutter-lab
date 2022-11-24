import 'package:counter_7/watch_list.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/form_budget.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data_budget.dart';

Drawer buildDrawer(BuildContext context){
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('Counter'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        ListTile(
          title: const Text('Tambah Budget'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FormBudgetPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Data Budget'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DataBudgetPage()),
            );
          },
        ),
        ListTile(
          title: const Text('My Watch List'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const myWatchListPage()),
            );
          },
        ),
      ],
    ),
  );
}