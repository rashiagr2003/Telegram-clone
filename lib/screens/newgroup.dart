import 'package:flutter/material.dart';
import 'package:telegram_clone/screens/theme.dart';

class NewgroupScreen extends StatefulWidget {
  const NewgroupScreen({Key? key}) : super(key: key);

  @override
  State<NewgroupScreen> createState() => _NewgroupScreenState();
}

class _NewgroupScreenState extends State<NewgroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Group"),
        backgroundColor: kBlue2Color,
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Who would you like to add?",
                    border: InputBorder.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
