#!/usr/bin/env bash

# Flutter and lcov/genhtml, must be installed on you path.
flutter test --no-pub --coverage --coverage-path ./coverage/lcov.info test
genhtml coverage/lcov.info -o coverage/html

reportPath="$(pwd)/coverage/html/index.html"

echo "See the coverage here:"
echo $reportPath
open -a "Google Chrome" file:///$reportPath
