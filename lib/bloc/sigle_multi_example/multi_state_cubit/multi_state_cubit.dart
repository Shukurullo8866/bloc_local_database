import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_data/model/my_response.dart';
import '../../../data/cart_data/services/api_service.dart';


part 'multi_state_state.dart';

class MultiStateCubit extends Cubit<MultiStateStateCubit> {
  MultiStateCubit() : super(MultiStateInitial());

  getData() async {
    emit(GettingDataInProgres());
    MyResponse myResponse = await ApiService().getAllCards();
    if(myResponse.error==""){
      emit(GettingDataInSucces(cards: myResponse.data));
    }else{
      emit(GettingDataInFailurys(error: myResponse.error));
    }
  }
}