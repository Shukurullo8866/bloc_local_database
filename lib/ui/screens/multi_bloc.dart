import 'package:bloc_equatable/bloc/multi_state_bloc/multi_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocScreen extends StatelessWidget {
  const MultiBlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Bloc"),
        actions: [
          InkWell(
            onTap: () {
              context.read<MultiStateBloc>().add(GetDataFromApiEvent());
            },
            child: const Icon(Icons.send_and_archive),
          )
        ],
      ),
      body: BlocConsumer<MultiStateBloc, MultiStateState>(
        builder: (context, state) {
          if (state is GettingDataInProgress) {
            return const CircularProgressIndicator();
          }
          if (state is GettingDataInSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.cards!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Center(
                        child: Image(
                      image: NetworkImage(state.cards![index].iconImage),
                      width: 150,
                    )),
                  ),
                ),
              ),
            );
          }
          if (state is GettingDataInFailury) {
            return Center(
              child: Text(
                state.errorText,
                style: const TextStyle(fontSize: 24, color: Colors.red),
              ),
            );
          }
          return const Text("dsdsds");
        },
        listener: (context, state) {},
      ),
    );
  }
}
