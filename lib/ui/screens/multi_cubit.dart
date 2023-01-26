import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/sigle_multi_example/multi_state_cubit/multi_state_cubit.dart';


class MultiCubitPage extends StatefulWidget {
  const MultiCubitPage({Key? key}) : super(key: key);

  @override
  State<MultiCubitPage> createState() => _MultiCubitPageState();
}

class _MultiCubitPageState extends State<MultiCubitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Cubit"),
        actions: [
          InkWell(
            onTap: (){context.read<MultiStateCubit>().getData();},
            child:  const Icon(Icons.send_and_archive ),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<MultiStateCubit,MultiStateStateCubit>(
          builder: (context, state) {
            if(state is GettingDataInProgres){
              return CircularProgressIndicator();
            }
            if(state is GettingDataInSucces){
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.cards.length,
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
                          child: Text(state.cards[index].cardType)),
                    ),
                  ),
                ),
              );
            }
            if(state is GettingDataInFailurys){
              return Text("Error");
            }
            return Container();
          },
        ),
      )

    );
  }
}
