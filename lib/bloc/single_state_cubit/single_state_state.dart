part of 'single_state_cubit.dart';

class CubitSingleState extends Equatable {
  Status? status;
  String? error;
  List? cards;

  CubitSingleState({
    this.status,
    this.error,
    this.cards,
  });

  CubitSingleState copyWith({
    Status? status,
    String? error,
    List? cards,
  }) {
    return CubitSingleState(
        error: error ?? this.error,
        cards: cards ?? this.cards,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, error, cards];
}