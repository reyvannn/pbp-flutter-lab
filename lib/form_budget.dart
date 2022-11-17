import 'package:counter_7/drawer.dart';
import 'package:counter_7/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/data_budget.dart';

class FormBudgetPage extends StatefulWidget{
  const FormBudgetPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FormBudgetPageState();
  }
}

class _FormBudgetPageState extends State<FormBudgetPage>{
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  late int nominal;
  String jenis = "Pemasukan";
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      drawer: buildDrawer(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                //JUDUL
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Judul",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      judul = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      judul = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul lengkap tidak boleh kosong!';
                    }
                    return null;
                  },
                ),

                //NOMINAL
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nominal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onSaved: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    onChanged: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                //JENIS
                ListTile(
                  title: const Text(
                    'Pilih Jenis',
                  ),
                  trailing: DropdownButton(
                    value: jenis,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listJenis.map((String items) {
                      return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );}).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenis = newValue!;
                      });
                    },
                  ),
                ),

                //SUBMIT
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addBudget(judul, nominal, jenis);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FormBudgetPage()),
                      );
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Berhasil'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Budget berhasil dibuat!'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Kembali'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Form tidak valid!'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Isi semua field dengan lengkap.'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Kembali'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}