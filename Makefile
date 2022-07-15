SHELL := /bin/bash
.PHONY: ci-tests

# Generate flavorizr native configurations.
# This will override app.dart, flavors.dart and all main_X.dart.
# Only run if you know what you are doing.
# After running, the cited files need to be reset to their previous state.
gen-flavors:
	flutter pub run flutter_flavorizr

gen-icons:
	flutter pub run flutter_launcher_icons:main

gen-native-splash:
	flutter pub run flutter_native_splash:create --flavor dev
	flutter pub run flutter_native_splash:create --flavor prod
	flutter pub run flutter_native_splash:create --flavor qa
	flutter pub run flutter_native_splash:create --flavor staging

# Generate code
gen-code:
	flutter pub run build_runner build --delete-conflicting-outputs
	flutter format . -l 120

# Clean before getting dependencies
clean-get:
	flutter clean && flutter pub get

# CI Tests
ci-tests:
	flutter format --set-exit-if-changed -n . -l 120
	flutter analyze
	flutter test -r expanded

# Generate firebase files for dev env
firebase-config-dev:
	flutterfire configure --project=dady-jokes-dev --out=lib/firebase_options_dev.dart \
						  --ios-bundle-id=com.dvosoftware.dadyjokes.dev \
						  --android-app-id=com.dvosoftware.dadyjokes.dev

# Generate firebase files for qa env
firebase-config-qa:
	flutterfire configure --project=dady-jokes-qa --out=lib/firebase_options_qa.dart \
						  --ios-bundle-id=com.dvosoftware.dadyjokes.qa \
						  --android-app-id=com.dvosoftware.dadyjokes.qa

# Generate firebase files for stg env
firebase-config-stg:
	flutterfire configure --project=dady-jokes-staging --out=lib/firebase_options_staging.dart \
						  --ios-bundle-id=com.dvosoftware.dadyjokes.staging \
						  --android-app-id=com.dvosoftware.dadyjokes.staging

# Generate firebase files for prod env
firebase-config-prod:
	flutterfire configure --project=dady-jokes-prod --out=lib/firebase_options_prod.dart \
						  --ios-bundle-id=com.dvosoftware.dadyjokes.prod \
						  --android-app-id=com.dvosoftware.dadyjokes.prod

# Enable firebase debugview on android (dev)
enable-debug-view-android-dev:
	adb shell setprop debug.firebase.analytics.app com.dvosoftware.dadyjokes.dev
