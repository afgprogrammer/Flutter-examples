import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubUsers extends StatefulWidget {
  const GithubUsers({ Key? key }) : super(key: key);

  @override
  _GithubUsersState createState() => _GithubUsersState();
}

class _GithubUsersState extends State<GithubUsers> {
  var users;

  void getGithubUsers() async {
    try {
      var response = await Dio().get("https://api.github.com/users", 
        options: Options(headers: {
          "Authorization": "token ...", // your github access token
      }));

      setState(() {
        users = response.data;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    getGithubUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Github Users', style: TextStyle(color: Colors.black),),
      ),
      body: users != null ? ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(users[index]['avatar_url']),
            ),
            title: Text(users[index]['login']),
            subtitle: Text(users[index]['html_url']),
            onTap: () => _launchURL(users[index]['html_url']),
          );
        },
      ) : Center(child: CircularProgressIndicator()),
    );
  }

  void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
