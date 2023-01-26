import 'package:bloc_equatable/bloc/contact_bloc/contact_single_bloc/single_state_bloc.dart';
import 'package:bloc_equatable/ui/contact_screens/update_contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact_bloc/get_contact_cubit/get_contact_cubit.dart';
import '../../bloc/contact_bloc/get_contact_cubit/get_contact_state.dart';

class GetContactPage extends StatefulWidget {
  const GetContactPage({Key? key}) : super(key: key);

  @override
  State<GetContactPage> createState() => _GetContactPageState();
}

class _GetContactPageState extends State<GetContactPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserContactsCubit, UserContactState>(
      builder: (context, state) {
        return Scaffold(

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              state is LoadGetContactsInProgress
                  ? const Center(child: CircularProgressIndicator())
                  : state is LoadGetContactsInSuccess
                  ? Expanded(
                child: ListView.builder(
                  itemCount: state.userModel.length,
                  itemBuilder: (context, index) {
                    debugPrint("Length : ${state.userModel.length}");
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        title: Column(
                          children: [
                            Text(state.userModel[index].name),
                            Text(state.userModel[index].phoneNumber),
                            Text(state.userModel[index].createdAt),

                          ],
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UpdateContactPage(
                                          userModel: state.userModel[index],
                                        )
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<AUDStateBloc>(context,).add(DeleteContact(contactId: state.userModel[index].id!));
                                    //
                                    // print("DELETING ID:${students.studentId}");
                                  },


                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
                  : state is LoadGetContactsInFailure
                  ? Center(child: Text(state.error))
                  : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
