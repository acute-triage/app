# flutter_starter

A very opinionated boilerplate project for Flutter with some of the best packages and practices. This project is meant to be a starting point for new projects and should be customized to fit the needs of the project.

## Getting Started
1. Copy `.env.example` to `.env` and fill in the values (if needed)
2. Run `flutter pub get` to install dependencies
3. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate code
4. Run `flutter run` to start the app (or preferably use your IDE)

### GraphQL
Using [ferry](https://ferrygraphql.com/) for a type-safe GraphQL client for Dart and Flutter.

Remember to keep your schema in sync (you can use this npm package `npm install -g get-graphql-schema`). When it changes, run:

```bash
get-graphql-schema https://pokeapi.dev > lib/schema.graphql
```

### Pluralization (slang)
We use [slang](https://pub.dev/packages/slang) for pluralization and other string manipulation.

When you add a new word, run `dart run slang`

## Todo
- [x] https://github.com/gql-dart/ferry
- [x] https://fluttergems.dev/packages/riverpod/
- [x] https://pub.dev/packages/slang
- [ ] AutoRoute (https://pub.dev/packages/auto_route)
- [ ] Custom theme file
- [ ] https://fluttergems.dev/packages/flutter_native_splash/
- [ ] https://fluttergems.dev/packages/freezed/
- [ ] Error reporting (Firebase Crashalytics?)
- [ ] Performance monitoring (Firebase Performance?)
- [ ] Setup firebase authentication
- [ ] RevenueCat for in-app purchases
- [ ] Enable app-check boolean for network requests
- [ ] In-App messaging (store tokens in firestore or supabase)
- [ ] https://fluttergems.dev/packages/convenient_test/
- [ ] https://fluttergems.dev/packages/flutter_launcher_icons/
- [ ] https://fluttergems.dev/packages/rename/
- [ ] https://pub.dev/packages/flutter_dotenv
- [ ] Create a local storage provider that uses hive as database
- [ ] Create a locale provider that stores the current locale and updates the app when it changes