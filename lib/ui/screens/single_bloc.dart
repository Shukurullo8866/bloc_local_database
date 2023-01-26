import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/sigle_multi_example/single_state_bloc/single_state_bloc.dart';

class SingleBlocPage extends StatefulWidget {
  const SingleBlocPage({Key? key}) : super(key: key);

  @override
  State<SingleBlocPage> createState() => _SingleBlocPageState();
}

class _SingleBlocPageState extends State<SingleBlocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Bolc"),
        actions: [
          InkWell(
            onTap: () {
              context.read<SingleStateBloc>().add(GetDataEvent());
            },
            child: Icon(Icons.send_and_archive),
          )
        ],
      ),
      body: Center( child: BlocConsumer<SingleStateBloc, SingleState>(
        builder: (context, state) {
          if (state.status == Status.SUCCESS) {
            return  ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.cards?.length,
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
                          image: NetworkImage(state.cards?[index].iconImage),
                          width: 150,
                        )),
                  ),
                ),
              ),
            );
          }
          if(state.status == Status.LOADING){
          return CircularProgressIndicator();
          }
          if(state.status == Status.ERROR) {
            return Text(state.error.toString());
          }
          return Container();
        },
        listener: (context, state) {},
      ),
    ));
  }
}
