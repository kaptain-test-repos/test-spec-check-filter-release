#!/usr/bin/env bash
set -euo pipefail
errors=0
assert_set() { if [[ -z "${!1:-}" ]]; then echo "FAIL: $1 should be set" >&2; errors=$((errors + 1)); fi; }
assert_set VERSION
assert_set DOCKER_TAG
assert_set PROJECT_NAME
if [[ "$errors" -gt 0 ]]; then echo "FAILED: $errors assertion(s) in preDockerPrepare" >&2; exit 1; fi
echo "PASSED: preDockerPrepare validation"
