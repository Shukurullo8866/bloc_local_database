import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/cart_data/model/my_response.dart';
import '../../../data/cart_data/services/api_service.dart';

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
