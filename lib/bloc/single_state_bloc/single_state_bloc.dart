import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../data/model/my_response.dart';
import '../../data/services/api_service.dart';

part 'single_state_event.dart';
part 'single_state_state.dart';

class SingleStateBloc extends Bloc<GetDataEvent, SingleState> {
  SingleStateBloc() : super(SingleState(status: Status.LOADING, error: '', cards: [])) {
    on<GetDataEvent>(getData);
  }

  getData(GetDataEvent event, emit) async {
    emit(SingleState(status: Status.LOADING, error: '', cards: []));
    MyResponse myResponse = await ApiService().getAllCards();
    if(myResponse.error==""){
      emit(SingleState(cards: myResponse.data, status: Status.ERROR , error: ''));

    }else{
      emit(SingleState(error: myResponse.error, status: Status.SUCCESS, cards: []));

    }

  }
}