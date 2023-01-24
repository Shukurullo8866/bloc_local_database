import 'package:bloc/bloc.dart';
import '../../data/model/my_response.dart';
import '../../data/services/api_service.dart';
import 'package:meta/meta.dart';

part 'multi_state_event.dart';
part 'multi_state_state.dart';


class MultiStateBloc extends Bloc<MultiStateEvent, MultiStateState> {
  MultiStateBloc() : super(MultiStateInitial()) {
    on<GetDataFromApiEvent>(getData);
  }

  getData(event, emit) async {
    emit(GettingDataInProgress());
    MyResponse myResponse = await ApiService().getAllCards();
    if(myResponse.error==""){
      emit(GettingDataInSuccess(cards: myResponse.data));
    }else{
      emit(GettingDataInFailury(errorText: myResponse.error));
    }

  }
}
