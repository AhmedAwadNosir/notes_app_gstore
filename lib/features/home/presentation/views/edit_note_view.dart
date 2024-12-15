import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/data/note_modal.dart';
import 'package:notes_app/features/home/functions/show_confirmation_dialog.dart';
import 'package:notes_app/features/home/presentation/widgets/edit_note_view_body.dart';
import 'package:notes_app/features/home/states_manager/edit_confrmation/edit_confirmation_cubit.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModal});
  static const id = "editNoteView";
  final NoteModal noteModal;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        BlocProvider.of<EditConfirmationCubit>(context).editNoteConfrmation(
            note: noteModal, isboobConfarmation: true, context: context);
      },
      child: SafeArea(
        child: Scaffold(
          body: EditNoteViewBody(
            noteModal: noteModal,
          ),
        ),
      ),
    );
  }
}
