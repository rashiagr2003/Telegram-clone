import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telegram_clone/screens/theme.dart';

class SaveNumber extends StatefulWidget {
  final String firstName;
  final String lastName;

  const SaveNumber({Key? key, required this.firstName, required this.lastName})
      : super(key: key);
  //  SaveNumber( {Key? key,required TextEditingController firstName, required TextEditingController lastName}) : super(key: key);

  @override
  State<SaveNumber> createState() => _SaveNumberState();
}

class _SaveNumberState extends State<SaveNumber> {
  @override
  Widget build(BuildContext context) {
    // TextEditingController msgController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue2Color,
        title: Text(
          widget.firstName + widget.lastName,
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(FontAwesomeIcons.ellipsisVertical),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.82,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage("assets/telegram.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(19),
                      bottomRight: Radius.circular(19))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.emoji_emotions,
                      color: Colors.black12,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Message", border: InputBorder.none),
                      ),
                    ),
                    Icon(
                      Icons.attachment,
                      color: Colors.black12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.mic,
                        color: Colors.black12,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
