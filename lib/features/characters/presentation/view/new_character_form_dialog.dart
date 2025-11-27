import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/core/utils/snackbar_notifier.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/unsaved_character.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/new_preference_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/new_preference_state.dart';

class NewCharacterFormDialog extends StatefulWidget {
  /// The [character] to save.
  final Character character;

  const NewCharacterFormDialog({super.key, required this.character});

  @override
  State<NewCharacterFormDialog> createState() => _NewCharacterFormDialogState();
}

class _NewCharacterFormDialogState extends State<NewCharacterFormDialog> {
  /// The form key.
  final _formKey = GlobalKey<FormState>();

  /// The name controller.
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.character.name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The form failure.
    final failure = context.select<NewPreferenceCubit, Failure?>(
      (cubit) => cubit.state.status == NewPreferenceStatus.failure
          ? cubit.state.failure ?? UnexpectedFailure()
          : null,
    );

    return BlocListener<NewPreferenceCubit, NewPreferenceState>(
      listener: (context, state) {
        // Notify success.
        if (state.status == NewPreferenceStatus.success) {
          SnackbarNotifier.success(
            context,
            message: 'Personaje guardado con éxito',
          );

          // Close the dialog.
          context.pop();
          return;
        }
      },
      child: AlertDialog(
        title: Text('Nuevo personaje'),
        content: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 16.0,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  label: Text('Nombre'),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debe ingresar un nombre';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  _nameController.text = newValue?.trim() ?? '';
                },
              ),
              if (failure != null)
                Text(
                  failure.message,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: FilledButton(onPressed: _onSave, child: Text('Guardar')),
          ),
        ],
      ),
    );
  }

  /// Handles the save form.
  void _onSave() {
    _formKey.currentState?.save();

    // Validate form.
    if (!_formKey.currentState!.validate()) return;

    // Save the character.
    final unsavedCharacter = UnsavedCharacter(
      name: _nameController.text,
      status: widget.character.status,
      species: widget.character.species,
      gender: widget.character.gender,
      image: widget.character.image,
    );

    BlocProvider.of<NewPreferenceCubit>(
      context,
    ).saveCharacter(unsavedCharacter);
  }
}
