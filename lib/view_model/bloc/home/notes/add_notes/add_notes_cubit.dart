import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  static AddNotesCubit get(context) => BlocProvider.of(context);
}
