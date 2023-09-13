import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:two/repositories.dart';

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  dynamic data;
  TextEditingController queryTextEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String query = '';
  bool hide = true;
  int currentPage = 0;
  int totalPages = 0;
  int pageSize = 20;
  List<dynamic> items = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                'Page $currentPage of $totalPages',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      obscureText: hide,
                      controller: queryTextEditingController,
                      decoration: InputDecoration(
                        hintText: 'write a name',
                        suffixIcon: IconButton(
                          icon: Icon(hide == true
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              hide = (!hide);
                            });
                          },
                        ),
                        contentPadding: const EdgeInsets.only(left: 20),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purple,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      )),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15.5),
                ),
                onPressed: () {
                  setState(() {
                    currentPage = 0;
                    items = [];
                    query = queryTextEditingController.text;
                    _search(query);
                  });
                },
                child: const Text('search'),
              ),
              const SizedBox(width: 10),
            ],
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: items.length,
              itemBuilder: (context, index) {
                // dynamic myData = data['items'][index];
                return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Repositories(
                                    login: items[index]['login'],
                                    avatar: items[index]['avatar_url'],
                                  ))));
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(items[index]['avatar_url']),
                            ),
                            const SizedBox(width: 10),
                            Text(items[index]['login'])
                          ],
                        ),
                        CircleAvatar(
                          child: Text('${items[index]['score']}'),
                        )
                      ],
                    ));
              },
            ),
          )
        ],
      ),
    );
  }

  void _search(String query) {
    String url =
        "https://api.github.com/search/users?q=$query&per_page=$pageSize&page=$currentPage";
    http.get(Uri.parse(url)).then((value) {
      setState(() {
        data = json.decode(value.body);
        currentPage =
            (data['items'].length != 0 && currentPage == 0) ? 1 : currentPage;
        items.addAll(data['items']);
        if ((data['total_count'] as int) % pageSize == 0) {
          totalPages = data['total_count'] ~/ pageSize;
        } else {
          totalPages = (data['total_count'] ~/ pageSize) + 1;
        }
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          if (currentPage < totalPages - 1) {
            ++currentPage;
            _search(query);
          }
        });
      }
    });
  }
}
