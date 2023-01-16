import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/account/view/account_page.dart';
import 'package:my_app/main/cubit/main_page_cubit.dart';
import 'package:my_app/noteWrite/cubit/note_cubit.dart';
import 'package:repository/repository.dart';

class NoteWritePage extends HookWidget {
  const NoteWritePage({required this.noteId, super.key});

  final int? noteId;

  static Route<NoteWritePage> route({int? id}) {
    return MaterialPageRoute(
      builder: (context) => NoteWritePage(
        noteId: id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NoteCubit(context.read<Repository>())..clearNote(noteId),
      child: NoteWriteView(
        noteId: noteId,
      ),
    );
  }
}

class NoteWriteView extends HookWidget {
  const NoteWriteView({
    super.key,
    required this.noteId,
  });

  final int? noteId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();
    final state = context.watch<NoteCubit>().state;

    final titleController = useTextEditingController();
    final contentController = useTextEditingController();

    useEffect(() {
      cubit.init(noteId).then((note) {
        titleController.text = note.title;
        contentController.text = note.body;
      });
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();

            context.read<MainPageCubit>().getNotes();
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          GestureDetector(
            onTap: cubit.saveNote,
            child: const ColoredBox(
              color: Colors.transparent,
              child: Icon(Icons.check),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              context.read<MainPageCubit>().getNotes();
              Navigator.of(context).push(
                AccountPage.route(),
              );
            },
            child: const ColoredBox(
              color: Colors.transparent,
              child: Icon(Icons.account_circle_outlined),
            ),
          ),
          const SizedBox(width: 20),
        ],
        centerTitle: true,
        title: const Text(
          'FastNote',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(hintText: 'Title'),
                    controller: titleController,
                    onChanged: cubit.titleChanged,
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      decoration: const InputDecoration(hintText: 'Content'),
                      controller: contentController,
                      onChanged: cubit.bodyChanged,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
