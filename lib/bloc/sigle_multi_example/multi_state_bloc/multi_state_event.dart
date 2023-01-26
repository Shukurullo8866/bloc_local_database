part of 'multi_state_bloc.dart';

@immutable
abstract class MultiStateEvent {}

class GetDataFromApiEvent extends MultiStateEvent{}