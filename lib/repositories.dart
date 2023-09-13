import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Repositories extends StatefulWidget {
  String login;
  String avatar;
  Repositories({required this.login, required this.avatar});

  @override
  State<Repositories> createState() => _RepositoriesState();
}

class _RepositoriesState extends State<Repositories> {
  String url = '';
  dynamic dataRepositories;
  @override
  void initState() {
    super.initState();
    _loadRepositories();
  }

  void _loadRepositories() async {
    url = 'https://api.github.com/users/${widget.login}/repos';

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        dataRepositories = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Repositories of ${widget.login}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.avatar),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
        Expanded(
            child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.deepPurple,
              height: 1,
            );
          },
          itemCount: dataRepositories == null ? 0 : dataRepositories.length,
          itemBuilder: ((context, index) {
            return ListTile(
              title: Text('${dataRepositories[index]['name']}'),
            );
          }),
        ))
      ]),
    );
  }
}
