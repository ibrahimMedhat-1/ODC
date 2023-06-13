import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'odc_state.dart';

class OdcCubit extends Cubit<OdcState> {
  OdcCubit() : super(OdcInitial());
  static OdcCubit get(context) => BlocProvider.of(context);
}
