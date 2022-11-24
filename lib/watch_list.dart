import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/watch_detail.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class myWatchListPage extends StatefulWidget {
  const myWatchListPage({Key? key}) : super(key: key);

  @override
  _MyWatchListState createState() => _MyWatchListState();
}

class _MyWatchListState extends State<myWatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),

        drawer: buildDrawer(context),
        body: FutureBuilder(
            future: fetchMywatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style:
                        TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 7),
                    ],
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: snapshot.data![index].fields.watched
                                ? Colors.blue
                                : Colors.red,
                            width: 2,
                          ),
                        ),
                        child: Row(children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: snapshot.data![index].fields.watched,
                            onChanged: (bool? value) {
                              setState(() {
                                snapshot.data![index].fields.watched =
                                !snapshot.data![index].fields.watched;
                              });
                            },
                          ),
                          Text(
                            "${snapshot.data![index].fields.title}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => myWatchDetailPage(
                                    film: snapshot.data![index])));
                      },
                    ),
                  );
                }
              }
            }));
  }
  Future<List<myWatchList>> fetchMywatchList() async {
    var url = Uri.parse('https://reyvan-pbp-tugas2.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<myWatchList> watchList = [];
    for (var item in data) {
      if (item != null) {
        watchList.add(myWatchList.fromJson(item));
      }
    }

    return watchList;
  }
}
