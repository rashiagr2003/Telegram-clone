import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telegram_clone/screens/savemessage.dart';
import 'package:telegram_clone/screens/theme.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _FirstName = TextEditingController();
  TextEditingController _LastName = TextEditingController();
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
        backgroundColor: kBlue2Color,
        title: Text(
          "Add Contact",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GestureDetector(
                onTap: () {
                  if (_FirstName.text.isNotEmpty &&
                      _LastName.text.isNotEmpty &&
                      _phoneNumber.text != 0) {
                    FirebaseFirestore.instance.collection("User Details").add({
                      "First Name": _FirstName.text,
                      "Last Name": _LastName.text
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SaveNumber(
                                  firstName: _FirstName.text,
                                  lastName: _LastName.text,
                                )));
                  }
                },
                child: Icon(Icons.check)),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 40,
                    child: TextField(
                        controller: _FirstName,
                        decoration: InputDecoration(
                          hintText: "First name (required)",
                          hintStyle: TextStyle(),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 40,
                    child: TextField(
                        controller: _LastName,
                        decoration: InputDecoration(
                          hintText: "Last name (optional)",
                          hintStyle: TextStyle(),
                        )),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
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
              ),
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
                  height: 20,
                  child: Text(
                      country_number == null ? "" : country_number.toString()),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.78,
                    child: TextField(
                        controller: _phoneNumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 18),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
