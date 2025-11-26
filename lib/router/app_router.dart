import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:rick_and_morty_app/features/characters/presentation/view/characters_api_page.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_prefs_page.dart';

part 'app_router.g.dart';

// API.
@TypedGoRoute<ApiListPageRoute>(path: '/api-list')
class ApiListPageRoute extends GoRouteData with $ApiListPageRoute {
  const ApiListPageRoute();

  @override
  Widget build(context, state) => const CharactersApiPage();
}

// Preferences.
@TypedGoRoute<PrefsListPageRoute>(
  path: '/prefs',
  routes: [
    TypedGoRoute<NewPrefsPageRoute>(path: 'new'),
    TypedGoRoute<PrefsDetailPageRoute>(path: ':id'),
  ],
)
class PrefsListPageRoute extends GoRouteData with $PrefsListPageRoute {
  const PrefsListPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CharactersPrefsPage();
  }
}

class NewPrefsPageRoute extends GoRouteData with $NewPrefsPageRoute {
  const NewPrefsPageRoute();
}

class PrefsDetailPageRoute extends GoRouteData with $PrefsDetailPageRoute {
  /// The detail [id].
  final int id;

  const PrefsDetailPageRoute({required this.id});
}

/// The app router handler.
final appRouter = GoRouter(
  initialLocation: ApiListPageRoute().location,
  routes: $appRoutes,
);
