import 'package:bloc_equatable/data/repository/user_contact_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/contact_data/user_contact_model.dart';
import 'get_contact_state.dart';

class GetUserContactsCubit extends Cubit<UserContactState> {
  GetUserContactsCubit({required this.userContactRepository})
      : super(InitialGetContacts());

  final ContactRepository userContactRepository;

  fetchAllAppointments() {
    emit(LoadGetContactsInProgress());
    userContactRepository
        .getAllContacts()
        .asStream()
        .listen((List<UserModel> listAppointments) {
      emit(LoadGetContactsInSuccess(userModel: listAppointments));
    });
  }
}