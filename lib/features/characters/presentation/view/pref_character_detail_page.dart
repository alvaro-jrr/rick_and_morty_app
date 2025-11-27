import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:rick_and_morty_app/di.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/get_preference_detail_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/get_preference_detail_state.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/preference_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_detail.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/characters_empty.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/characters_loading.dart';

class PrefCharacterDetailPage extends StatelessWidget {
  /// The [characterId].
  final int characterId;

  const PrefCharacterDetailPage({super.key, required this.characterId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<GetPreferenceDetailCubit>()..getCharacterById(characterId),
      child: PrefCharacterDetailView(),
    );
  }
}

class PrefCharacterDetailView extends StatelessWidget {
  const PrefCharacterDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Delete character button.
          BlocSelector<
            GetPreferenceDetailCubit,
            GetPreferenceDetailState,
            Character?
          >(
            selector: (state) => state.character,
            builder: (context, character) {
              if (character == null) return SizedBox();

              return IconButton(
                onPressed: () {
                  // Delete the character.
                  context.read<PreferenceCubit>().deleteCharacter(character);

                  // Go back to previous page.
                  context.pop();
                },
                icon: Icon(Icons.delete),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<GetPreferenceDetailCubit, GetPreferenceDetailState>(
        builder: (context, state) {
          final character = state.character;

          if (character == null) {
            if (state.status == GetPreferenceDetailStatus.loading) {
              return CharactersLoading();
            }

            if (state.status == GetPreferenceDetailStatus.failure) {
              return CharactersEmpty(message: state.failure?.message ?? '');
            }

            return CharactersEmpty();
          }

          return CharacterDetail(character: character);
        },
      ),
    );
  }
}
