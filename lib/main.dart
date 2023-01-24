import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  runApp( App());
}
