
import '../../../data/contact_data/user_contact_model.dart';

abstract class UserContactState {}

class InitialGetContacts extends UserContactState {}

class LoadGetContactsInProgress extends UserContactState {}

class LoadGetContactsInSuccess extends UserContactState {
  LoadGetContactsInSuccess({required this.userModel});

  final List<UserModel> userModel;
}

class LoadGetContactsInFailure extends UserContactState {
  LoadGetContactsInFailure({required this.error});

  final String error;
}