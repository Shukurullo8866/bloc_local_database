part of 'multi_state_bloc.dart';

@immutable
abstract class MultiStateState {}

class MultiStateInitial extends MultiStateState {}

class GettingDataInProgress extends MultiStateState{}

class GettingDataInSuccess extends MultiStateState{
  List cards;

  GettingDataInSuccess({required this.cards});
}

class GettingDataInFailury extends MultiStateState{
  String errorText;

  GettingDataInFailury({required this.errorText});
}