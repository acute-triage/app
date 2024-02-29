# flutter_starter

A general purpose boilerplate project for Flutter with some of the best packages and practices. This project is meant to be a starting point for new projects and should be customized to fit the needs of the project.

## Getting Started
1. Copy `.env.example` to `.env` and fill in the values (if needed)
2. Run `flutter pub get` to install dependencies
3. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate code
4. Run `flutter run` to start the app (or preferably use your IDE)

## Features

### GraphQL
Using [ferry](https://ferrygraphql.com/) for a type-safe GraphQL client for Dart and Flutter.

Remember to keep your schema in sync (you can use this npm package `npm install -g get-graphql-schema`). When it changes, run:

```bash
get-graphql-schema https://pokeapi.dev > lib/schema.graphql
```

### Pluralization (slang)
We use [slang](https://pub.dev/packages/slang) for pluralization and other string manipulation.

When you add a new word, run `dart run slang`

### Router (auto_route)
We use [auto_route](https://pub.dev/packages/auto_route) for type-safe routing.

To [add a new route](https://pub.dev/packages/auto_route#setup-and-usage), prepend `@RoutePage()` to any widget, then run `flutter pub run build_runner build --delete-conflicting-outputs` to generate the code, and lastly add the route to the `lib/common/application/router.dart` file.

### awesome_flutter_extensions
We use [awesome_flutter_extensions](https://pub.dev/packages/awesome_flutter_extensions) to add some useful extensions to the Flutter framework.

```dart
// Before
Container(
	width: MediaQuery.of(context).size.width,
	height: MediaQuery.of(context).size.width,
)

// After
Container(
	width: context.width,
	height: context.width,
)
```

### Niddy Griddy
We have a few niddy griddy (mostly DX) features that may be useful.

#### Logging levels
TODO

#### Delayed network requests
A quick way to delay network requests to simulate a slow network.


# Todo
- [x] https://github.com/gql-dart/ferry
- [x] https://fluttergems.dev/packages/riverpod/
- [x] https://pub.dev/packages/slang
- [x] AutoRoute (https://pub.dev/packages/auto_route)
- [x] Generic Debugging / Logging tools
- [ ] https://fluttergems.dev/packages/flutter_native_splash/
- [ ] Dark theme support
- [ ] Custom theme file
- [ ] https://fluttergems.dev/packages/freezed/
- [ ] Error reporting (Firebase Crashalytics?)
- [ ] Performance monitoring (Firebase Performance?)
- [ ] Setup firebase authentication
- [ ] RevenueCat for in-app purchases
- [ ] In-App messaging (store tokens in firestore or supabase)
- [ ] https://fluttergems.dev/packages/convenient_test/
- [ ] https://fluttergems.dev/packages/flutter_launcher_icons/
- [ ] https://fluttergems.dev/packages/rename/
- [ ] https://pub.dev/packages/flutter_dotenv
- [ ] Toast / Notifications
- [ ] flutter_animate for easy animations (including base extensions for animation e.g. ListView builder)
- [ ] collection
- [ ] Scaffold with Appbar / Drawer / BottomNavigationBar
- [ ] Flavour support


## Known Issues

### Environment variables changes in .env is not registered envied
When modifying the .env file, the generator might not pick up the change due to [dart-lang/build#967](https://github.com/dart-lang/build/issues/967). If that happens simply clean the build cache and run the generator again.

```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

# Common Providers
- [ ] Enable app-check boolean for network requests
- [ ] Create a local storage provider that uses hive as database
- [ ] Create a locale provider that stores the current locale and updates the app when it changes
- [ ] Keyboard visibility provider