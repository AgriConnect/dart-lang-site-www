#!/usr/bin/env bash
# Run all tests for validating code examples

set -u

EXIT_STATUS=0

tool/check-formatting.sh || EXIT_STATUS=1
tool/refresh-code-excerpts.sh || EXIT_STATUS=1
tool/analyze-and-test-examples.sh || EXIT_STATUS=1

printf "\n-- Done --\n\n"

if [[ $EXIT_STATUS == 0 ]]; then
  printf "\n$(blue "All tests and checks have passed!")\n\n"
else
  printf "\n$(red "
  Some tests and/or checks have failed.
  Look at the full output from this script for details.
  ")\n"
fi

exit $EXIT_STATUS
