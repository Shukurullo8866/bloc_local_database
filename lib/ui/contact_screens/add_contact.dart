import 'package:bloc_equatable/bloc/contact_bloc/contact_single_bloc/single_state_bloc.dart';
import 'package:bloc_equatable/bloc/contact_bloc/get_contact_cubit/get_contact_cubit.dart';
import 'package:bloc_equatable/data/contact_data/user_contact_model.dart';
import 'package:bloc_equatable/ui/contact_screens/get_contacts.dart';
import 'package:bloc_equatable/utils/myUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}
TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AUDStateBloc,ContactsState>(builder: (context,state){
      return  Column(
        children: [
          SizedBox(height: 15,),
          TextFormField(
            controller: nameController,
            maxLength: 15,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              labelText: "Name",
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: phoneNumberController,
            maxLength: 15,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              labelText: "Phone Number",
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AUDStateBloc>(context).add(AddContact(contact: UserModel(
                  name: nameController.text,
                  phoneNumber: phoneNumberController.text,
                  createdAt: DateTime.now().toString()

              ),),);


              Future.delayed(const Duration(seconds: 3)).then((value) =>
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GetContactPage())));
            },
            child: const Text(
              "Add Contact",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          )
        ],
      );
    }
        , listener: (context,state){
          if(state.status == ContactSate.contactAdded){
            BlocProvider.of<GetUserContactsCubit>(context).fetchAllAppointments();
            MyUtils.getMyToast(message: "Qo'shish Muvaqiyatli bajarildi");
          }
        }
    );}
}
