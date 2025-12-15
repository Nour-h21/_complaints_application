// presentation/bloc/complaints_bloc.dart
import 'package:bloc/bloc.dart';

import '../../domain/usecase/my_complaints_usecase.dart';
import 'my_complaint_event.dart';
import 'my_complaint_state.dart';


class ComplaintsBloc extends Bloc<ComplaintsEvent, ComplaintsState> {
  final GetMyComplaintsUseCase getMyComplaintsUseCase;

  ComplaintsBloc(this.getMyComplaintsUseCase) : super(ComplaintsInitial()) {
    on<LoadComplaintsEvent>((event, emit) async {
      emit(ComplaintsLoading());
      try {
        final list = await getMyComplaintsUseCase();
        emit(ComplaintsLoaded(list));
      } catch (e) {
        emit(ComplaintsFailure(e.toString()));
      }
    });

    on<RefreshComplaintsEvent>((event, emit) async {
      // behave same as load but keep it separate
      try {
        final list = await getMyComplaintsUseCase();
        emit(ComplaintsLoaded(list));
      } catch (e) {
        emit(ComplaintsFailure(e.toString()));
      }
    });
  }
}