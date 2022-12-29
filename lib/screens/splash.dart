import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telegram_clone/screens/phone.dart';
import 'package:telegram_clone/screens/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 180,
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.38,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      child: Image(
                        image: AssetImage("assets/icon256.png"),
                        fit: BoxFit.cover,
                      )),
                  Text(
                    "Telegram",
                    style: GoogleFonts.lato(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 280,
                    child: Text(
                      "The world's fastest messaging app. it is free and secure.",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff3C3C43).withOpacity(0.6)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.blue,
                        ),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Color(0xff3C3C43).withOpacity(0.3),
                        ),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Color(0xff3C3C43).withOpacity(0.3),
                        ),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Color(0xff3C3C43).withOpacity(0.3),
                        ),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Color(0xff3C3C43).withOpacity(0.3),
                        ),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Color(0xff3C3C43).withOpacity(0.3),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PhoneScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 50),
              width: 328,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: kBlue3Color),
              child: Center(
                child: Text(
                  "Start Messaging",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
