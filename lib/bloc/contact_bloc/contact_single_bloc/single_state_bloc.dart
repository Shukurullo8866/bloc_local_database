import 'package:bloc/bloc.dart';
import 'package:bloc_equatable/data/contact_data/user_contact_model.dart';
import 'package:bloc_equatable/data/repository/user_contact_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'single_state_event.dart';
part 'single_state_state.dart';

class AUDStateBloc extends Bloc<ContactsEvent, ContactsState> {
  AUDStateBloc(this.contactRepository)
      : super(
    ContactsState(status: ContactSate.pure, contact: [], statusText: "")
        ) {
    on<AddContact>(_addContact);
    on<UpdateContact>(_updateContact);
    on<DeleteContact>(_deleteContact);

  }
   ContactRepository contactRepository;

  _addContact(AddContact event, Emitter<ContactsState> emit) async{
    emit(state.copyWith(status: ContactSate.loading));
    var newContact = contactRepository.addContact(userModel: event.contact);
    if(newContact != null){
      emit(state.copyWith(status: ContactSate.contactAdded));
    }
  }
  _updateContact(UpdateContact event, Emitter<ContactsState> emit) async{
    emit(state.copyWith(status: ContactSate.loading));
    contactRepository.updateContacts(userModel: event.contact);
    emit(state.copyWith(status: ContactSate.contactUpdate));
  }
  _deleteContact(DeleteContact event,Emitter<ContactsState> emit) async{
    emit(state.copyWith(status: ContactSate.loading));
    var deleteId = contactRepository.deleteContactById(id: event.contactId);
    if( deleteId != -1){
      emit(state.copyWith(status: ContactSate.contactDelete));
    }
  }

}

enum MyStatus {
  ERROR,
  SUCCESS,
  LOADING,
  PURE,
}
