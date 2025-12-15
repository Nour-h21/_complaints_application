import 'package:bloc/bloc.dart';

import '../../domain/usecase/details_complaint_usecase.dart';
import 'details_complaint_event.dart';
import 'details_complaint_state.dart';


class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetComplaintDetailsUseCase useCase;
  DetailsBloc(this.useCase) : super(DetailsInitial()) {
    on<LoadComplaintDetails>((event, emit) async {
      emit(DetailsLoading());
      try {
        final detail = await useCase(event.id);
        emit(DetailsLoaded(detail));
      } catch (e) {
        emit(DetailsFailure(e.toString()));
      }
    });

    on<RefreshComplaintDetails>((event, emit) async {
      try {
        final detail = await useCase(event.id);
        emit(DetailsLoaded(detail));
      } catch (e) {
        emit(DetailsFailure(e.toString()));
      }
    });
  }
}