part of 'get_notes_cubit.dart';

@immutable
sealed class GetNotesState {}

final class GetNotesInitial extends GetNotesState {}

final class GetNotesSuccess extends GetNotesState {
  final List<NoteModal> notes;

  GetNotesSuccess({required this.notes});
}

final class GetNotesFailure extends GetNotesState {
  final String errorMessage;

  GetNotesFailure({required this.errorMessage});
}
