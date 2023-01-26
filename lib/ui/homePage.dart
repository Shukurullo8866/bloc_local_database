import 'package:bloc_equatable/ui/contact_screens/add_contact.dart';
import 'package:bloc_equatable/ui/contact_screens/get_contacts.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      GetContactPage(),
      AddContactPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          currentPage=value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.pan_tool_alt),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.pan_tool_alt),label: ""),

        ],
      ),


    );
  }
}