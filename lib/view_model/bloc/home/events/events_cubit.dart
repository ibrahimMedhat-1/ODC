import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());
  static EventsCubit get(context) => BlocProvider.of(context);
}
