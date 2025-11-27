import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty_app/core/utils/snackbar_notifier.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_filter.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/api_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/preference_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/preference_state.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_empty.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_failure.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_loading.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_populated.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_search_text_field.dart';
import 'package:rick_and_morty_app/router/app_router.dart';

class CharactersPrefsPage extends StatefulWidget {
  const CharactersPrefsPage({super.key});

  @override
  State<CharactersPrefsPage> createState() => _CharactersPrefsPageState();
}

class _CharactersPrefsPageState extends State<CharactersPrefsPage> {
  @override
  void initState() {
    super.initState();

    // Load the characters.
    context.read<PreferenceCubit>().fetchCharacters(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PreferenceCubit, PreferenceState>(
      listenWhen: (previous, current) {
        // Handle character deleted.
        final isCharacterDeleted =
            current.deletedCharacter != null &&
            previous.deletedCharacter != current.deletedCharacter;

        if (isCharacterDeleted) {
          SnackbarNotifier.success(
            context,
            message: 'Personaje eliminado con éxito',
          );

          return false;
        }

        return true;
      },
      listener: (context, state) {
        // Handle failure.
        if (state.status.isFailure && state.failure != null) {
          SnackbarNotifier.error(context, message: state.failure!.message);
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
          title: Text('Personajes guardados'),
          backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        ),
        body: Column(
          children: [
            // Search.
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CharacterSearchTextField(
                onSearch: (name) => context
                    .read<PreferenceCubit>()
                    .fetchCharacters(filter: CharacterFilter(name: name)),
              ),
            ),
            // View.
            Expanded(
              child: BlocBuilder<PreferenceCubit, PreferenceState>(
                builder: (context, state) {
                  if (state.characters.isEmpty) {
                    if (state.status.isLoading) return CharactersLoading();

                    if (state.status.isFailure) {
                      return CharactersFailure(
                        failure: state.failure,
                        onRetry: () => context.read<PreferenceCubit>().retry(),
                      );
                    }

                    return CharactersEmpty(
                      message: 'No se encontraron personajes',
                    );
                  }

                  return CharactersPopulated(
                    characters: state.characters,
                    isLoading: context.select<PreferenceCubit, bool>(
                      (cubit) => cubit.state.status.isLoading,
                    ),
                    onLoadMore: () =>
                        context.read<PreferenceCubit>().loadNextPage(),
                    trailing: (character) {
                      return IconButton(
                        onPressed: () {
                          context.read<PreferenceCubit>().deleteCharacter(
                            character,
                          );
                        },
                        icon: Icon(Icons.delete),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Load the characters from API.
            context.read<ApiCubit>().fetchCharacters(refresh: true);

            NewPrefsPageRoute().push(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
