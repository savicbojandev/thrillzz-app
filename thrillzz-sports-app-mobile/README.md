# Thrillzz Sports App (Flutter)

Simple sports browser that consumes the local Node.js API and showcases layered Flutter architecture
with `bloc` cubits, `get_it` DI, and GoRouter navigation.

## Run the stack

```bash
# backend
cd ../thrillzz-sports-app-backend
npm install
npm run dev    # http://localhost:3001

# mobile (new shell)
cd ../thrillzz-sports-app-mobile
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run    # main.dart
```

The Flutter app points to `http://localhost:3001/api/` (see
`lib/infrastructure/infrastructure_const.dart` if you need to change it).

## Lokalne verzije / konfiguracija (mobile)

- Flutter: 3.38.3 (from `/Users/nikola/fvm/versions/3.38.3`)
- API base domain: `http://10.0.2.2:3001/api/` on Android emulator, `http://localhost:3001/api/`
  elsewhere (configured in `lib/infrastructure/infrastructure_const.dart`).
- Android: run against an emulator/simulator with the backend running locally; no extra native
  config required beyond `flutter run` once the base domain resolves.

## Features

- Browse sports → leagues → games from the mock dataset.
- Search by team, league name, or date range through `SportsSearchCubit` (`GET /api/sports/search`).
- Game details screen pulls `GET /api/games/:id` and renders players/metadata.

## Architecture highlights

- `core`: bootstrap (`bootstrap.dart`), `get_it` registrations, logging via a thin `LogService`.
- `domain`: value objects and ports for sports + game details, with lightweight validation and
  `multiple_result` for success/error.
- `application`: use cases (`LoadSports`, `SearchGames`, `GetGameDetails`) and cubits with
  `equatable` states.
- `infrastructure`: `dio`-based `Api`, API adapters (`SportsApi`, `GameDetailsApi`), and
  repositories that map network errors into domain errors.
- `presentation`: GoRouter routes, registry widgets that provide cubits, and simple screens/forms
  for browse, search, and details.

## Testing

Unit tests live under `test/unit_tests/...` with fakes in `test/helpers`. Run `flutter test`.

## Assumptions

- Backend runs locally on port 3001; no offline cache or retry logic.
- Mock data is authoritative (no pagination/auth); validation is intentionally light for the
  exercise.

## What I'd improve with more time

- Add widget/golden tests for `SportsPage`, search bar, and game details states; expand bloc tests for edge errors/loading.
- Add integration/contract tests against the local API (happy path + malformed payloads) to lock the DTO/parsing layer.
- Implement retry/backoff + offline cache (Hive/SQLite) in the repositories with a simple connectivity indicator and “try again” UI.
- Add loading skeletons and error banners on the sports/catalog screens to make network failures explicit.
