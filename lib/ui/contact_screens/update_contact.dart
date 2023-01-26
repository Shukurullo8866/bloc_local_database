import 'package:bloc_equatable/data/contact_data/user_contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact_bloc/contact_single_bloc/single_state_bloc.dart';
import '../../bloc/contact_bloc/get_contact_cubit/get_contact_cubit.dart';
import '../../utils/myUtils.dart';
import 'get_contacts.dart';

class UpdateContactPage extends StatefulWidget {
  UpdateContactPage({Key? key, required this.userModel}) : super(key: key);

  UserModel userModel;

  @override
  State<UpdateContactPage> createState() => _UpdateContactPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

class _UpdateContactPageState extends State<UpdateContactPage> {
  @override
  void initState() {
    nameController.text = widget.userModel.name;
    phoneNumberController.text = widget.userModel.phoneNumber;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AUDStateBloc, ContactsState>(builder: (context, state) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TextFormField(
              onSaved: (newValue) {

              },
              maxLength: 15,
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                labelText: "name",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              maxLength: 15,
              controller: phoneNumberController,
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
                BlocProvider.of<AUDStateBloc>(context).add(
                  UpdateContact(
                    contact: UserModel(
                        name: nameController.text,
                        phoneNumber: phoneNumberController.text,
                        createdAt: DateTime.now().toString()),
                  ),
                );

                Future.delayed(const Duration(seconds: 3)).then((value) =>
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => GetContactPage())));
              },
              child: const Text(
                "Update Contact",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            )
          ],
        ),
      );
    }, listener: (context, state) {
      if (state.status == ContactSate.contactUpdate) {
        BlocProvider.of<GetUserContactsCubit>(context).fetchAllAppointments();
        MyUtils.getMyToast(message: "Yangilanish Muvaqiyatli bajarildi");
      }
    });
  }
}
