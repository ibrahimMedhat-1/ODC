import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'partners_state.dart';

class PartnersCubit extends Cubit<PartnersState> {
  PartnersCubit() : super(PartnersInitial());
  static PartnersCubit get(context) => BlocProvider.of(context);
}
