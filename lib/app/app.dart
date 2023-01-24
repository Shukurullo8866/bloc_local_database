import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/multi_state_bloc/multi_state_bloc.dart';
import '../bloc/multi_state_cubit/multi_state_cubit.dart';
import '../bloc/single_state_bloc/single_state_bloc.dart';
import '../bloc/single_state_cubit/single_state_cubit.dart';
import '../ui/homePage.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SingleStateBloc(),),
          BlocProvider(create: (context) => MultiStateBloc(),),
          BlocProvider(create: (context) => SingleStateCubit(),),
          BlocProvider(create: (context) => MultiStateCubit(),),
        ],
        child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}