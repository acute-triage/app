# flutter_starter

A new Flutter project.

## Getting Started
1. Copy `.env.example` to `.env` and fill in the values (if needed).

### GraphQL
Useing [ferry](https://ferrygraphql.com/) for a type-safe GraphQL client for Dart and Flutter.

Remember to keep your schema in sync (you can use this npm package `npm install -g get-graphql-schema`). When it changes, run:

```bash
get-graphql-schema https://pokeapi.dev > lib/schema.graphql
```

## Todo
- [x] https://github.com/gql-dart/ferry
- [x] https://fluttergems.dev/packages/riverpod/
- [ ] https://pub.dev/packages/slang
- [ ] Autoroute
- [ ] Add secure storage provider that can store e.g. auth token
- [ ] Custom theme file
- [ ] https://fluttergems.dev/packages/flutter_native_splash/
- [ ] https://fluttergems.dev/packages/freezed/
- [ ] Error reporting (Firebase Crashalytics?)
- [ ] Performance monitoring (Firebase Performance?)
- [ ] https://fluttergems.dev/packages/convenient_test/
- [ ] https://fluttergems.dev/packages/flutter_launcher_icons/
- [ ] https://fluttergems.dev/packages/rename/
- [ ] https://pub.dev/packages/flutter_dotenv