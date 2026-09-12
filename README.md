# First Flutter Project

A small Flutter shopping app with Firebase authentication, Firestore-backed personal information, product browsing, and English/Arabic localization.

## Included

- Email/password sign-up and login with localized validation and dialogs
- Personal information form with Firestore storage and live data display
- Product page view, responsive grid, and hot offers list
- Built-in Flutter localization using English and Arabic ARB files

## Setup

1. Install Flutter and configure a Firebase project for the target platforms.
2. Place the platform Firebase configuration files in the generated project locations.
3. Fetch dependencies and generate localization files:

```bash
flutter pub get
flutter gen-l10n
```

## Run

```bash
flutter run
```

## Quality checks

```bash
flutter analyze
flutter test
```

Translations live in `lib/l10n/app_en.arb` and `lib/l10n/app_ar.arb`. Add new user-facing text there instead of hard-coding strings in widgets.
