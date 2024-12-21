.PHONY: help

all: lint format run-dev

run-dev: ## Run for dev env
	@echo "Running app on development environment..."
	flutter run --target lib/main_dev.dart --flavor development

run-web-dev: ## Run for stg env
	@echo "Running app on staging environment..."
	flutter run --target lib/main_dev.dart --flavor development -d chrome --web-renderer html

run-stg: ## Run for stg env
	@echo "Running app on staging environment..."
	flutter run --target lib/main_stg.dart --flavor staging

run-web-stg: ## Run for stg env
	@echo "Running app on staging environment..."
	flutter run --target lib/main_stg.dart --flavor staging -d chrome --web-renderer html

run-prod: ## Run for prod env
	@echo "Running app on production environment..."
	flutter run --target lib/main.dart --flavor production

run-web-prod: ## Run for stg env
	@echo "Running app on staging environment..."
	flutter run --target lib/main.dart -d chrome --web-renderer html


build-apk-dev: ## Build flutter apk file (dev)
	@echo "Building apk (dev) file..."
	flutter build apk --target lib/main_dev.dart --flavor development --no-tree-shake-icons

build-apk-stg: ## Build flutter apk file (stg)
	@echo "Building apk (stg) file..."
	flutter build apk --target lib/main_stg.dart --flavor staging --no-tree-shake-icons

build-apk-prod: ## Build flutter apk file (prod)
	@echo "Building apk (prod) file..."
	flutter build apk --target lib/main.dart --flavor production --no-tree-shake-icons

build-bundle-dev: ## Build flutter app bundle file (dev)
	@echo "Building app bundle (dev) file..."
	flutter build appbundle --target lib/main_dev.dart --flavor development --no-tree-shake-icons

build-bundle-stg: ## Build flutter app bundle file (stg)
	@echo "Building app bundle (stg) file..."
	flutter build appbundle --target lib/main_stg.dart --flavor staging --no-tree-shake-icons

build-bundle-prod: ## Build flutter app bundle file (prod)
	@echo "Building app bundle (prod) file..."
	flutter build appbundle --target lib/main.dart --flavor production --no-tree-shake-icons

build-web-stg:
	@echo "Building WEB app (stg)..."
	flutter build web --target lib/main_stg.dart --no-tree-shake-icons --web-renderer html

build-web-prod:
	@echo "Building WEB app (prod)..."
	flutter build web --target lib/main.dart --no-tree-shake-icons --web-renderer html



gen-code: ## Generate code
	@echo "Generating code..."
	@flutter packages pub run build_runner build --delete-conflicting-outputs

gen-appicon: ## Generate app icon
	@echo "Generating app icon..."
	@echo "Note: To create app icon you need to upload image into assets/images/ and set the path in yaml file"
	@echo "For more information read README.md file"
	@flutter clean
	@flutter pub get
	@flutter pub run flutter_launcher_icons:main

gen-splashscreen: ## Generate app splashscreen
	@echo "Generating splashscreen..."
	@echo "Note: To create app splash screen you need to upload image into assets/images/ and set the path in yaml file"
	@echo "For more information read README.md file"
	@flutter clean
	@flutter pub get
	@flutter pub run flutter_native_splash:create

init-app: ## Rebuild app from scratch
	@echo "Rebuilding application..."
	@echo "For more information read README.md file"
	@flutter clean
	@flutter pub get
	@flutter packages pub run build_runner build --delete-conflicting-outputs
	@cd ios && pod install && cd ..

format: ## Format the code
	@echo "╠ Formatting the code"
	@dart format .

lint: ## Verify the code
	@echo "╠ Verifying code..."
	@dart analyze .

.DEFAULT_GOAL := help

# Adding a help file: https://gist.github.com/prwhite/8168133#gistcomment-1313022
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done
