import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telegram_clone/screens/chat.dart';
import 'package:telegram_clone/main.dart';
import 'package:telegram_clone/screens/newgroup.dart';
import 'package:telegram_clone/screens/theme.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
            backgroundColor: kBlue2Color,
            title: Text("Telegram"),
            elevation: 2,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search_rounded),
              ),
            ]),
        drawer: Drawer(
          backgroundColor: kWhiteColor,
          child: ListView(padding: EdgeInsets.zero, children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: kBlue2Color,
              ),
              accountName: Text("User 1"),
              accountEmail: Text("+91-67803586743"),
              currentAccountPicture: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")),
            ),
            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Icon(
                  Icons.group,
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewgroupScreen()));
                },
                child: Text(
                  "New Group",
                  style: GoogleFonts.sourceSerifPro(
                      fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Icon(Icons.person),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
              title: Text(
                "Contacts",
                style: GoogleFonts.sourceSerifPro(
                    fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Icon(Icons.call),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
              title: Text(
                "Calls",
                style: GoogleFonts.sourceSerifPro(
                    fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Icon(Icons.accessibility_new_sharp),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
              title: Text(
                "People Nearby",
                style: GoogleFonts.sourceSerifPro(
                    fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Icon(Icons.message_sharp),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
              title: Text(
                "Saved Messsages",
                style: GoogleFonts.sourceSerifPro(
                    fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Icon(Icons.settings),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
              title: Text(
                "Settings",
                style: GoogleFonts.sourceSerifPro(
                    fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Icon(Icons.person_add),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
              title: Text(
                "Invite Friends",
                style: GoogleFonts.sourceSerifPro(
                    fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Icon(Icons.help_center_outlined),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
              title: Text(
                "Telegram Features",
                style: GoogleFonts.sourceSerifPro(
                    fontSize: 16, color: Colors.black),
              ),
            )
          ]),
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 100),
          children: [
            ChatItem(
                widget: FlutterLogo(size: 40),
                initial: '',
                title: 'Flutter Indonesia',
                sender: 'User 3',
                message: 'Hello. Does anyone know how can i directly on/off',
                time: '22:14',
                mute: false,
                unread: 1280,
                color: Colors.transparent),
            ChatItem(
                widget: FlutterLogo(size: 40),
                initial: '',
                title: 'FlutterDev',
                sender: '',
                message: 'New post on /r/flutterdev subreddit:',
                time: '9:28',
                mute: true,
                unread: 8,
                color: Colors.transparent),
            ChatItem(
                widget: FlutterLogo(),
                initial: 'U1',
                title: 'User 2',
                sender: '',
                message: 'Hi, how are you ?',
                time: '7:34',
                mute: false,
                unread: 2,
                color: kOrangeColor),
            ChatItem(
                widget: FlutterLogo(),
                initial: 'U2',
                title: 'User 3',
                sender: '',
                message: 'Hi, how are you ?',
                time: 'Tue',
                mute: true,
                unread: 0,
                color: kGreenPeasColor),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewMessage()));
          },
          backgroundColor: kBlue3Color,
          child: const Icon(Icons.edit_rounded),
        ));
  }
}

class ChatItem extends StatelessWidget {
  final Widget widget;
  final String initial;
  final String title;
  final String sender;
  final String message;
  final String time;
  final bool mute;
  final int unread;
  final Color color;

  const ChatItem({
    Key? key,
    required this.widget,
    required this.initial,
    required this.title,
    required this.sender,
    required this.message,
    required this.time,
    required this.mute,
    required this.unread,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      leading: CircleAvatar(
        backgroundColor: color,
        radius: 25,
        child: initial.isNotEmpty
            ? Text(initial,
                style: const TextStyle(color: kWhiteColor, fontSize: 20))
            : widget,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Text(title, style: TextStyle(fontWeight: bold, fontSize: 17)),
            const SizedBox(width: 5),
            mute
                ? const Icon(Icons.volume_off, color: kGreyColor, size: 15)
                : Container(),
            const Spacer(),
            Text(time, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                sender.isNotEmpty
                    ? Text(
                        '$sender: ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            color: kBlue2Color,
                            fontWeight: semiBold),
                      )
                    : Container(),
                Expanded(
                  child: Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          unread > 9
              ? Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: kSilverColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(unread.toString(),
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: semiBold)),
                )
              : (unread > 0
                  ? CircleAvatar(
                      backgroundColor: kSilverColor,
                      child: Text(unread.toString(),
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: semiBold)),
                      radius: 12,
                    )
                  : Container()),
        ],
      ),
    );
  }
}
