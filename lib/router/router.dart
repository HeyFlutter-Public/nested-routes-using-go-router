import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/layout_scaffold.dart';
import 'package:flutter_go_router/models/user.dart';
import 'package:flutter_go_router/pages/pages.dart';
import 'package:flutter_go_router/router/routes.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.homePage,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => LayoutScaffold(
        navigationShell: navigationShell, 
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.homePage,
              builder: (context, state) => const HomePage(), 
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.explorePage,
              builder: (context, state) => const ExplorePage(), 
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.settingsPage,
              builder: (context, state) => const SettingsPage(),
              routes: [
                GoRoute(
                  path: Routes.profilePage,
                  builder: (context, state) => ProfilePage(
                    user: state.extra as User,
                  )
                ),
              ], 
            ),
          ],
        ),
      ],
    ),
  ],
);
