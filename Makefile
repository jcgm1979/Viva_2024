ipa:
	fvm flutter build ipa -t lib/main_dev.dart --dart-define=devTools=false

ipa_dev:
	fvm flutter build ipa -t lib/main_prod.dart --dart-define=devTools=false

aab:
	fvm flutter build appbundle -t lib/main_prod.dart --dart-define=devTools=false

aab_dev:
	fvm flutter build appbundle  -t lib/main_dev.dart -dart-define=devTools=false

apk_dev:
	fvm flutter build apk -t lib/main_dev.dart --dart-define=devTools=false

apk_prod:
	fvm flutter build apk -t lib/main_prod.dart --dart-define=devTools=false

apk_release_dev:
	fvm flutter build apk --release -t lib/main_dev.dart --dart-define=devTools=false
	
apk_release_prod:
	fvm flutter build apk --release -t lib/main_prod.dart --dart-define=devTools=false

open_apk:
	open build/app/outputs/flutter-apk/

analyze:
	fvm flutter analyze

clubAL_build:
	fvm flutter clean && flutter pub get packages && flutter pub upgrade && flutter pub run build_runner build --delete-conflicting-outputs

clubAL_soft_build:
	fvm flutter pub get packages && flutter pub run build_runner build --delete-conflicting-outputs

coreAL_build:
	fvm flutter clean && flutter pub get && flutter pub upgrade && flutter pub run build_runner build --delete-conflicting-outputs

iconApp:
	fvm flutter pub run flutter_launcher_icons

b:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

init:
	fvm flutter clean && fvm flutter pub get packages && fvm flutter pub upgrade && fvm flutter pub run build_runner build --delete-conflicting-outputs
