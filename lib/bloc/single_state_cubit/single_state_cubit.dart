import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/my_response.dart';
import '../../data/services/api_service.dart';
import '../single_state_bloc/single_state_bloc.dart';


part 'single_state_state.dart';



class SingleStateCubit extends Cubit<CubitSingleState> {
  SingleStateCubit() : super(CubitSingleState());

  getData() async {
    emit(CubitSingleState(status: Status.LOADING));
    MyResponse myResponse = await ApiService().getAllCards();
    if(myResponse.error==""){
      emit(state.copyWith(cards: myResponse.data,status: Status.SUCCESS));
    }else{
      emit(state.copyWith(error: myResponse.error,status: Status.ERROR));
    }
  }
}