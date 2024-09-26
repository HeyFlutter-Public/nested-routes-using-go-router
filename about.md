##  1.  Research Title
-   Keywords:
    -   flutter go router
    -   flutter go_router
    -   go_router
    -   go router
    -   go router redirect
    -   how to use flutter go_router
    -   flutter go router bottom navigation
    -   go_router flutter
    -   go_router flutter github
    -   go_router flutter example
    -   go router documentation
    -   go_router tutorial
    -   go_router example
    -   go_router builder
    -   go router builder
    -   flutter go router path parameters
    
-   Video Title: Go Router in Flutter the Right Way [2024]

##  2.  Research Competitors
**Flutter Articles/Videos**
-   https://pub.dev/packages/go_router → Official Documentation
-   https://pub.dev/documentation/go_router/latest/ → Official Documentation
-   https://medium.com/@vimehraa29/flutter-go-router-the-crucial-guide-41dc615045bb
-   https://blog.codemagic.io/flutter-go-router-guide/
-   https://medium.com/@antonio.tioypedro1234/flutter-go-router-the-essential-guide-349ef39ec5b3
-   https://codewithandrea.com/articles/flutter-navigation-gorouter-go-vs-push/
-   https://canopas.com/how-to-implement-type-safe-navigation-with-go-router-in-flutter-b11315bd183b
-   https://medium.com/@chuntdevnx/go-router-routing-in-flutter-bc3c69e85786
-   https://www.cybrosys.com/blog/how-to-use-gorouter-for-efficient-navigation-in-flutter
-   https://medium.flutterdevs.com/navigate-with-gorouter-in-flutter-4a135f813d98
-   140K - https://youtu.be/b6Z885Z46cU?si=63fWc-Q0WgNS6Gxn
-   45K - https://youtu.be/QwlrHjBYQ2M?si=lrbyazka3aotsLKS
-   19K - https://youtu.be/BgcXHA3EHJU?si=JTVdCjKxYwyaWgZh
-   14K - https://www.youtube.com/watch?v=AKJ-k5yAXxE&list=PLCaS22Sjc8YTQCxP0of90oatXiAei6vTT
-   7K - https://youtu.be/fqGlaXpyWvM?si=h_0PUXGlM7Npiwru
-   5K - https://youtu.be/h_zfsFKm5MY?si=b92BfEQfzriHkxDS
-   1.9K - https://www.youtube.com/watch?v=bdH8hFRJFNI
-   1.5K - https://youtu.be/xKKIOVqMmcE?si=0BqVnOO0FMfOzxdN  

**Android/Swift/React Videos**
-   N/A

**Great Features**
-   N/A

**Problems from Videos**
-   [https://youtu.be/b6Z885Z46cU?si=63fWc-Q0WgNS6Gxn] → @jaygediayou said, "One thing to note is it does not send any value back to the previous widget if current one is popped."
    
    **Answer:**

    You can send back data to the previous page using the following syntax:
    ```dart
    context.pop(true) // Sends back a boolean
    context.pop('Page has been popped') // Sends back a String
    context.pop(user) // Sends back a User object
    ```

**Problems from Flutter StackOverflow**
-   https://stackoverflow.com/questions/71359432/flutter-go-router-how-to-return-result-to-previous-page **[Answered]**

##  3.  Video Structure
**Main Points/Purpose Of Lesson**
-   What is an Go Router?
-   Why Go Router? 
-   How to use Go Router?

**The Structured Main Content**
1.  Go Router is a great tool in Flutter that helps you navigate between screens in your Flutter app using a URL-based API.

2.  Go Router is one of the best tools for handling navigation because:
    -   it is easy to use,
    -   it uses URL-based API which is useful for web applications,
    -   it supports Deep Linking allowing users open specific screens directly via a URL
    -   you can easily create nested routes, and
    -   it also provides stateful navigation keeping the state of each route.

3.  **Getting Started**
    Install the `go_router` package into your Flutter project
    ```yaml
    dependencies:
      go_router: ^14.2.3
    ```

4.  **Initializing the Go Router**
    Define a router using the `GoRouter` class
    ```dart
    final router = GoRouter();
    ```

    To define a route, you add one to the `routes` value using the `GoRoute` class and supply the `path` and `builder` call back
    ```dart
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
      ],
    );
    ```

    After that, in the main app widget, you can use the `MaterialApp.router` class and supply the router instance
    ```dart
    class MainApp extends StatelessWidget {
      const MainApp({super.key});

      @override
      Widget build(BuildContext context) => MaterialApp.router(
            routerConfig: router,
            // ...
          );
    }
    ```

5.  You can also use Go Router with your bottom navigation bar.
    To do this, you can use the `StatefulShellRoute.indexedStack`
    ```dart
    final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
    
    final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: HomePage.path,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => LayoutScaffold(
            navigationShell: navigationShell,
          ),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: HomePage.path,
                  builder: (context, state) => const HomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ExplorePage.path,
                  builder: (context, state) => const ExplorePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: SettingsPage.path,
                  builder: (context, state) => const SettingsPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
    ```

    After that, we create a `LayoutScaffold` that will hold the bottom navigation bar in a shell to prevent it from rebuilding constantly
    ```dart
    class LayoutScaffold extends StatelessWidget {
      const LayoutScaffold({
          required this.navigationShell,
          Key? key,
      }) : super(key: key ?? const ValueKey<String>('LayoutScaffold'));

       final StatefulNavigationShell navigationShell;

       @override
      Widget build(BuildContext context) => Scaffold(
              body: navigationShell,
              bottomNavigationBar: NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: navigationShell.goBranch,
              indicatorColor: Theme.of(context).primaryColor,
              destinations: destinations
                  .map((destination) => NavigationDestination(
                          icon: Icon(destination.icon),
                          label: destination.label,
                          selectedIcon: Icon(destination.icon, color: Colors.white),
                      ))
                  .toList(),
              ),
          );
      }
    ```

6.  You can also have nested routes within the stateful shell routes
    ```dart
    final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: HomePage.path,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => LayoutScaffold(
            navigationShell: navigationShell,
          ),
          branches: [
            // ...
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: SettingsPage.path,
                  builder: (context, state) => const SettingsPage(),
                  routes: [
                    GoRoute(
                      path: ProfilePage.path,
                      builder: (context, state) => const ProfilePage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    ```

    To navigate to the nested route we can use:
    ```dart
    context.push('/settings/profile');
    ```

7.  To pass parameters between pages, we can add one to the constructor of the `ProfilePage`
    ```dart
    class ProfilePage extends StatelessWidget {
      const ProfilePage({super.key, required this.user});
      final User user;

      static const String path = 'profile';

      @override
      Widget build(BuildContext context) => Scaffold(
            appBar: AppBar(title: const Text('Profile')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    child: Icon(Icons.person_outlined, size: 80),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(user.email),
                  ],
              ),
            ),
          );
    }
    ```

    Back in the router configuration, we can then do this:
    ```dart
    final router = GoRouter(
      // ...
      routes: [
        StatefulShellRoute.indexedStack(
          // ...
           branches: [
            // ...
            StatefulShellBranch(
              routes: [
                GoRoute(
                  // ...
                   routes: [
                    GoRoute(
                      path: ProfilePage.path,
                      builder: (context, state) => ProfilePage(
                        user: state.extra as User,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    ```
    
    To pass the user data to the profile page, we can do this:
    ```dart
    class SettingsPage extends StatelessWidget {
      const SettingsPage({super.key});

      static const String path = '/settings';
      static const String _profilePath = '/settings/profile';

      @override
      Widget build(BuildContext context) {
        final user = User(name: 'John Doe', email: 'john@heyflutter.com');

        return Scaffold(
          // ...
          body: Center(
            child: Column(
              // ...
              children: [
                // ...
                FilledButton(
                  onPressed: () => context.push(_profilePath, extra: user),
                  child: const Text('View Profile Page'),
                ),
              ],
            ),
          ),
        );
      }
    }
    ```
    