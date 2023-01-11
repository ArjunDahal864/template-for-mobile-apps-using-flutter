# Clean and reset Pods for ios
nuke_ios:
	flutter clean
	cd ios && pod deintegrate
	cd ios pod cache clean --all
	cd ios && rm -rf Pods
	cd ios && rm Podfile.lock
	make build_all
	cd ios && pod install --repo-update

int_test:
	flutter test integration_test 

# Clean all packages
clean_all:
	flutter clean
	

# Fetch dependencies for all packages
get_all:
	flutter pub get
	

# Generate code for all packages
gen_all:
	flutter pub global activate intl_utils
	flutter pub global run intl_utils:generate
	flutter pub run build_runner build --delete-conflicting-outputs

# Create android artifact
assemble_android:
	flutter build appbundle

assemble_apk:
	flutter build apk


# Create ios artifact
assemble_ios:
	flutter build ios --release
	

# Run all tests
run_tests:
	flutter test

# Clean, get dependencies and generate code for all packages
clean_build:
	make clean_all
	make get_all
	make gen_all




# Get dependencies and generate code for all packages
build_all:
	make get_all
	make gen_all

fix:
	dart fix --apply

build_test:
	flutter pub run build_runner build --delete-conflicting-outputs

test_cov:
	flutter test --coverage

show_report:
	make test_cov
	genhtml coverage/lcov.info -o coverage/html
	open coverage/html/index.html
	
