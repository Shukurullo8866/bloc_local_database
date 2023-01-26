part of 'single_state_bloc.dart';

@immutable
abstract class ContactsEvent{}

class AddContact extends ContactsEvent{
  AddContact({required this.contact});
  final UserModel contact;
}
class UpdateContact extends ContactsEvent{
  UpdateContact({required this.contact});
  final UserModel contact;
}

class DeleteContact extends ContactsEvent{
   DeleteContact({required this.contactId});
  final int contactId;
}
