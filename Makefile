SHELL := /bin/bash
.PHONY: ci-tests

# CI Tests
ci-tests:
	flutter format --set-exit-if-changed -n . -l 120
	flutter analyze
	flutter test -r expanded
