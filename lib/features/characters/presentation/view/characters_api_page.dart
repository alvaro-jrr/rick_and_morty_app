import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty_app/features/characters/domain/entities/character_filter.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/api_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/api_state.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_empty.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_search_text_field.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/characters_failure.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/characters_loading.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/characters_populated.dart';
import 'package:rick_and_morty_app/router/app_router.dart';

class CharactersApiPage extends StatefulWidget {
  const CharactersApiPage({super.key});

  @override
  State<CharactersApiPage> createState() => _CharactersApiPageState();
}

class _CharactersApiPageState extends State<CharactersApiPage> {
  @override
  void initState() {
    super.initState();

    // Load the characters.
    context.read<ApiCubit>().fetchCharacters();
  }

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
        foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => PrefsListPageRoute().push(context),
            icon: Icon(Icons.favorite),
          ),
        ],
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
