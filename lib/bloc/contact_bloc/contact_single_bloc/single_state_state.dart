part of 'single_state_bloc.dart';

class ContactsState extends Equatable {

  final ContactSate status;
  final String statusText;
  final List<UserModel> contact;

   ContactsState({
    required this.status,
     required this.contact,
     required this.statusText
  });


  ContactsState copyWith({
     ContactSate? status,
     String? statusText,
     List<UserModel>? contact  }) =>
      ContactsState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        contact: contact ?? this.contact,

      );

  @override
  List<dynamic> get props => [
    status,
    statusText,
    contact,
  ];
}

enum ContactSate{
  loading,
  pure,
  contactAdded,
  contactUpdate,
  contactDelete,

}