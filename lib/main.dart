import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/utils/app_colors.dart';
import 'package:notes_app/core/utils/app_constants.dart';
import 'package:notes_app/core/utils/app_routes.dart';
import 'package:notes_app/features/home/data/note_modal.dart';
import 'package:notes_app/features/home/presentation/views/home_view.dart';
import 'package:notes_app/features/home/states_manager/edit_confrmation/edit_confirmation_cubit.dart';
import 'package:notes_app/features/home/states_manager/get_notes/get_notes_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModalAdapter());
  await Hive.openBox<NoteModal>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetNotesCubit(),
        ),
        BlocProvider(
          create: (context) => EditConfirmationCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.primaryColor,
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        initialRoute: HomeView.id,
        routes: AppRoutes.routes,
      ),
    );
  }
}
