# MasterPie

MasterPie is a food portion calculator and macro-planning app. Users can choose the foods they want to eat during the day, enter their macro goals, and let the app calculate suggested serving amounts for each food so the full meal plan gets as close as possible to the target calories, protein, carbohydrates, and fat.

The app also supports food search, recipe search, saved favorites, a personal cookbook, daily food logging, profile-based macro goal calculation, subscription plans, and AI-assisted meal suggestions.

## Architecture

The project follows a feature-first Clean Architecture style. Most application code is organized by feature under `lib/feature`, with separate presentation, domain, and data layers.

### Presentation layer

- Flutter screens and reusable UI helpers live under each feature's `presentation` folder.
- State management uses `bloc` and `flutter_bloc`.
- BLoCs receive UI events, call domain use cases, and emit loading, success, and error states.
- Freezed is used for generated state/event unions and immutable models.

### Domain layer

- Domain models, repository contracts, and use cases live in each feature's `domain` folder.
- Use cases provide the app-facing operations, such as searching groceries, suggesting meals, logging foods, retrieving recipes, and calculating suggested food portions.
- Repository interfaces keep the presentation/domain code independent from the concrete API, database, and storage implementations.

### Data layer

- Repository implementations live in `data/repository_impl`.
- Remote data sources handle Supabase, FatSecret, OpenAI, and MasterPie API calls.
- Local data sources handle encrypted SQLite persistence.
- Mapper classes convert between remote/local DTOs and domain models.
- API and database failures are returned through `dartz` `Either<Failure, Success/Data>` instead of throwing directly through the layers.

### Dependency injection

Dependencies are registered in `lib/util/core/di/service_locator.dart` using `get_it`. BLoCs and repositories resolve use cases, repositories, data sources, mappers, and helpers through the service locator.

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State management:** BLoC / Flutter BLoC
- **Dependency injection:** GetIt
- **Networking:** Dio, HTTP, OAuth2
- **Functional result handling:** Dartz `Either`
- **Model generation:** Freezed, JSON Serializable, Build Runner
- **Local database:** `sqflite_sqlcipher` for encrypted SQLite storage
- **Local key-value storage:** Hive / Hive Flutter and Shared Preferences
- **Backend/auth/database:** Supabase
- **Crash reporting and analytics:** Firebase Crashlytics and Firebase Analytics
- **Authentication:** Supabase email/password auth and Google Sign-In
- **Payments:** Flutter in-app purchases with StoreKit and Android billing packages
- **Environment configuration:** Flutter Config

## Macro and Food Data APIs

The app uses several remote services for nutrition and macro-related features:

- **FatSecret Platform API:** Used for grocery and recipe nutrition data. The app authenticates through FatSecret OAuth client credentials and calls methods such as `foods.search.v3`, `recipes.search.v3`, `recipe.get.v2`, and `food.get.v4`.
- **MasterPie portion recommendation API:** `https://us-central1-masterpie-389519.cloudfunctions.net/portionRecommendation` receives selected foods, serving ranges, macro limits, restrictions, and macro percentages, then returns recommended portions.
- **Macro goal calculation API:** The app reads `CALCULATE_MACRO_GOAL_API` from environment configuration and posts profile data such as age, gender, weight, height, activity level, goal weight, and weekly weight-change target to calculate daily calorie, protein, carbohydrate, and fat goals.
- **OpenAI API:** Used for AI meal suggestions and generated recipe/nutrition details when suggesting meals or creating recipe-style food data.
- **Supabase:** Used for user accounts, profiles, subscription plans, favorites, cookbook entries, suggested foods, and logged foods.

The codebase also contains constants for USDA FoodData Central and includes an `openfoodfacts` dependency, but the active food-search data source currently wired through the food repository is FatSecret.

## App Startup

Application startup is handled through `lib/app/app_flavour.dart`:

- Loads environment variables with Flutter Config.
- Registers dependencies with GetIt.
- Initializes Hive.
- Initializes Supabase.
- Initializes Firebase.
- Configures Firebase Crashlytics error reporting.
- Runs the Flutter app.

## Local Storage

The app stores local food, profile, logged-food, cookbook, and favorite-food data in an encrypted SQLite database created through `sqflite_sqlcipher`. Hive is used for lightweight user/session values such as authentication-related keys.

## Main Features

- Search grocery foods and recipes.
- Calculate suggested portions based on daily macro goals.
- Save favorite foods.
- Build and manage a personal cookbook.
- Log foods by date.
- Calculate user macro goals from profile information.
- Suggest meals using AI prompts, ingredients, diet preferences, nationality, and allergies.
- Manage subscriptions and purchase flows.
