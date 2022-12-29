import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telegram_clone/screens/chat.dart';
import 'package:telegram_clone/screens/home.dart';
import 'package:telegram_clone/main.dart';
import 'package:telegram_clone/screens/theme.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController _PhoneNumber = TextEditingController();

  String countryName = '';
  var country_number;
  void show() {
    showCountryPicker(
      context: context,
      showPhoneCode:
          true, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        print('Select country: ${country.displayName}');
        setState(() {
          countryName = country.displayNameNoCountryCode;
          country_number = country.phoneCode;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBlue2Color,
        title: Text(
          "Your Phone",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: GestureDetector(
                onTap: () {
                  show();
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  child: Text(
                    countryName == "" ? "Country Name" : countryName.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                )
                // TextField(
                //   decoration: InputDecoration(
                //       hintText: "Choose a country",
                //       hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
                // ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "+",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: 15,
                  child: Text(
                      country_number == null ? "" : country_number.toString()),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                        controller: _PhoneNumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                        ))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Text(
              "Please confirm your country code and enter your phone number.",
              overflow: TextOverflow.clip,
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff3C3C43).withOpacity(0.6)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_PhoneNumber.text.length == 10) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage1()));
            FirebaseFirestore.instance
                .collection("phone number")
                .add({"Number": _PhoneNumber.text});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Please fill the details properly"),
              backgroundColor: Colors.black,
            ));
          }
        },
        backgroundColor: kBlue3Color,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
