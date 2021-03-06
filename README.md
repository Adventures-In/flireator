# flireator

A project creation tool for Flutter projects with a Firebase backend, stored on GitHub.

[Notes](https://docs.google.com/document/d/1zhhfxnetfFxlGYBYFOT-gAY6V_aKmjVbE18K_xcyXbU/edit?usp=sharing)

## Sections

### GitHub

- create a github repo
- create a commit for each flutter and firebase component

### Flutter

- create a Flutter project
- download dependencies

### Firebase

- create a project
- add backend components (auth, database, cloud functions, etc)
- download config files

## Common Commands

```sh
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch --delete-conflicting-outputs
redux-devtools --open
flutter drive --dart-define=RDT=true --target=test_driver/app.dart
firebase emulators:start --project flireator --import=test/data
http://localhost:4000
```
