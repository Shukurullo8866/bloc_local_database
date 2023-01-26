import '../contact_data/local_database.dart';
import '../contact_data/user_contact_model.dart';

class ContactRepository{
  Future<int> deleteAllContacts() => LocalDatabase.deleteAll();
  Future<int> deleteContactById({required int id}) => LocalDatabase.deleteContactById(id: id);

  Future<UserModel> addContact({required UserModel userModel}) =>
      LocalDatabase.insertToDatabase(userModel: userModel);

  Future<List<UserModel>> getAllContacts() => LocalDatabase.getList();

  Future<UserModel> updateContacts({required UserModel userModel}) =>
      LocalDatabase.updateTaskById(updatedContact: userModel);
}