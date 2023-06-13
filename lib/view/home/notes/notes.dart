import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view/home/notes/add_notes/add_notes.dart';
import 'package:odc_project/view_model/bloc/home/notes/notes_cubit.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          return BlocConsumer<NotesCubit, NotesState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              NotesCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text(
                    'Notes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'There\'s No Data To Show',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddNotes()));
                  },
                  backgroundColor: Colors.blueGrey[200],
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
