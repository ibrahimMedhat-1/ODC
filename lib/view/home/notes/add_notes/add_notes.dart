import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view_model/bloc/home/notes/add_notes/add_notes_cubit.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocBuilder<AddNotesCubit, AddNotesState>(
        builder: (context, state) {
          return BlocConsumer<AddNotesCubit, AddNotesState>(
            listener: (context, state) {

            },
            builder: (context, state) {
               AddNotesCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'Add Note',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                body: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Title',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xE70ECFD7),
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Date',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Color(0xE70ECFD7),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          minLines: 5,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: 'Note',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: Color(0xE70ECFD7),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              color: Color(0xFFA5BDBE),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.add),
                                  Text(
                                    'Add',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
