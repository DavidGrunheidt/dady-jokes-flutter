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

# CI Tests
ci-tests:
	flutter format --set-exit-if-changed -n . -l 120
	flutter analyze
	flutter test -r expanded
