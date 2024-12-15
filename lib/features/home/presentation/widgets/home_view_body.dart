import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/features/home/functions/show_app_info_dialog.dart';
import 'package:notes_app/features/home/presentation/views/search_view.dart';
import 'package:notes_app/features/home/presentation/widgets/custom_search_button.dart';
import 'package:notes_app/features/home/presentation/widgets/notes_list_view_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Notes",
                  style: TextStyle(fontSize: 43, fontWeight: FontWeight.w300)),
              const Spacer(),
              //search icon
              CustomIconButton(ontap: () {
                Navigator.pushNamed(context, SearchView.id);
              }),
              const SizedBox(width: 16),
              CustomIconButton(
                ontap: () {
                  showAppInfoDialog(context);
                },
                icon: Icons.info_outline,
              )
            ],
          ),
          const SizedBox(height: 18),
          const NotesListViewBlocBuilder()
        ],
      ),
    );
  }
}
