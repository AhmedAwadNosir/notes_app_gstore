import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/presentation/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/features/home/presentation/widgets/home_view_body.dart';
import 'package:notes_app/features/home/states_manager/get_notes/get_notes_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const id = "homeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<GetNotesCubit>(context).getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const HomeViewBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: const Color(0xFF2F2F2F),
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddNoteBottomSheet(),
                );
              },
            );
          },
          backgroundColor: const Color(0xFF252525),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 38,
          ),
        ),
      ),
    );
  }
}
