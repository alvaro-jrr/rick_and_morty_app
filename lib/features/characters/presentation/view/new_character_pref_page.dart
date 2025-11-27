import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:rick_and_morty_app/di.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_filter.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/api_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/api_state.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/new_preference_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/new_preference_state.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/preference_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_empty.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_failure.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_loading.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_populated.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/new_character_form_dialog.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_search_text_field.dart';

class NewCharacterPrefPage extends StatelessWidget {
  const NewCharacterPrefPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NewPreferenceCubit>(),
      child: const NewCharacterPrefView(),
    );
  }
}

class NewCharacterPrefView extends StatelessWidget {
  const NewCharacterPrefView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<NewPreferenceCubit, NewPreferenceState>(
      listener: (context, state) {
        if (state.status == NewPreferenceStatus.success) {
          // Refresh list and go back to characters.
          context.read<PreferenceCubit>().fetchCharacters(refresh: true);
          context.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.inverseSurface,
          foregroundColor: theme.colorScheme.onInverseSurface,
          title: Text('Selecciona un personaje'),
        ),
        body: Column(
          children: [
            // Search.
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CharacterSearchTextField(
                onSearch: (name) => context.read<ApiCubit>().fetchCharacters(
                  filter: CharacterFilter(name: name),
                ),
              ),
            ),
            // View.
            Expanded(
              child: BlocBuilder<ApiCubit, ApiState>(
                builder: (context, state) {
                  if (state.characters.isEmpty) {
                    if (state.status.isInitial) return CharactersEmpty();

                    if (state.status.isLoading) return CharactersLoading();

                    if (state.status.isFailure) {
                      return CharactersFailure(
                        failure: state.failure,
                        onRetry: () => context.read<ApiCubit>().retry(),
                      );
                    }
                  }

                  return CharactersPopulated(
                    characters: state.characters,
                    isLoading: context.select<ApiCubit, bool>(
                      (cubit) => cubit.state.status.isLoading,
                    ),
                    onLoadMore: () => context.read<ApiCubit>().loadNextPage(),
                    onCharacterTap: (character) =>
                        _onCharacterTap(context, character),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Handles the tap on [character].
  void _onCharacterTap(BuildContext context, Character character) async {
    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<NewPreferenceCubit>(context),
          child: NewCharacterFormDialog(character: character),
        );
      },
    );
  }
}
