import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty_app/di.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_filter.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/api_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/api_state.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_empty.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_failure.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_loading.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_populated.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_search_text_field.dart';

class CharactersApiPage extends StatelessWidget {
  const CharactersApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ApiCubit>()..fetchCharacters(),
      child: CharactersApiView(),
    );
  }
}

class CharactersApiView extends StatelessWidget {
  const CharactersApiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/rick_and_morty_logo.png',
          fit: BoxFit.contain,
          height: kToolbarHeight * 0.6,
        ),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Color(0xFF27272a),
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // Search.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CharacterSearchTextField(
              onSearch: (name) => context.read<ApiCubit>().fetchCharacters(
                CharacterFilter(name: name),
              ),
            ),
          ),
          // View.
          Expanded(
            child: BlocBuilder<ApiCubit, ApiState>(
              builder: (context, state) {
                if (state.status.isInitial) return CharactersEmpty();

                if (state.status.isFailure && state.characters.isEmpty) {
                  return CharactersFailure(
                    failure: state.failure,
                    onRetry: () => context.read<ApiCubit>().retry(),
                  );
                }

                if (state.status.isLoading && state.characters.isEmpty) {
                  return CharactersLoading();
                }

                return CharactersPopulated(
                  characters: state.characters,
                  onLoadMore: () => context.read<ApiCubit>().loadNextPage(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
