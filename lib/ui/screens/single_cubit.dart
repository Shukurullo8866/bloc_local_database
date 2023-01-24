import 'package:bloc_equatable/bloc/single_state_cubit/single_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/single_state_bloc/single_state_bloc.dart';



class SingleCubitPage extends StatefulWidget {
  const SingleCubitPage({Key? key}) : super(key: key);

  @override
  State<SingleCubitPage> createState() => _SingleCubitPageState();
}

class _SingleCubitPageState extends State<SingleCubitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Single Cubit"),
          actions: [
            InkWell(
              onTap: () {
                context.read<SingleStateCubit>().getData();
              },
              child: Icon(Icons.send_and_archive),
            )
          ],
        ),
        body: Center( child: BlocBuilder<SingleStateCubit, CubitSingleState>(
          builder: (context, state) {
            if(state.status==Status.ERROR){
              return Text(state.error.toString());
            }
            if(state.status==Status.SUCCESS){
              return
                ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.cards!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Center(
                          child: Text(state.cards![index].bankName)),
                    ),
                  ),
                ),
              );
            }
            if(state.status==Status.LOADING){
              return CircularProgressIndicator();
            }
            return Container();
          }



        ),
        ),

    );
  }
}
