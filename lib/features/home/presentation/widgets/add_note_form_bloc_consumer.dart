import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/functions/show_sanck_bar.dart';
import 'package:notes_app/features/home/presentation/widgets/add_note_form_sheet.dart';
import 'package:notes_app/features/home/states_manager/add_notes/add_notes_cubit.dart';
import 'package:notes_app/features/home/states_manager/get_notes/get_notes_cubit.dart';

class AddNoteFormBlocConsumer extends StatelessWidget {
  const AddNoteFormBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotesCubit, AddNotesState>(
      listener: (context, state) {
        if (state is AddNotesSuccess) {
          BlocProvider.of<GetNotesCubit>(context).getNotes();
          Navigator.pop(context);
        } else if (state is AddNotesFailure) {
          showSnackBar(state.errorMessage, context);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
            absorbing: state is AddNotesLoding, child: const AddNoteForm());
      },
    );
  }
}
