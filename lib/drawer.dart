import 'package:flutter/material.dart';
import 'package:counter_7/form_budget.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data_budget.dart';

Drawer buildDrawer(BuildContext context){
  return Drawer(
    child: Column(
      children: [
        // Menambahkan clickable menu
        ListTile(
          title: const Text('Counter'),
          onTap: () {
            // Route menu ke halaman utama
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        ListTile(
          title: const Text('Tambah Budget'),
          onTap: () {
            // Route menu ke halaman form
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FormBudgetPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Data Budget'),
          onTap: () {
            // Route menu ke halaman form
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DataBudgetPage()),
            );
          },
        ),
      ],
    ),
  );
}