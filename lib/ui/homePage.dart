
import 'package:bloc_equatable/bloc/multi_state_cubit/multi_state_cubit.dart';
import 'package:bloc_equatable/bloc/single_state_cubit/single_state_cubit.dart';
import 'package:bloc_equatable/ui/screens/multi_bloc.dart';
import 'package:bloc_equatable/ui/screens/multi_cubit.dart';
import 'package:bloc_equatable/ui/screens/single_bloc.dart';
import 'package:bloc_equatable/ui/screens/single_cubit.dart';
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
      MultiBlocScreen(),
      MultiCubitPage(),
      SingleCubitPage(),
      SingleBlocPage(),
    ];
    return Scaffold(
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
          BottomNavigationBarItem(icon: Icon(Icons.pan_tool_alt),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.pan_tool_alt),label: ""),
        ],
      ),


    );
  }
}