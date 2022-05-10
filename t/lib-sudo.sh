# Helpers for running git commands under sudo.

# Runs a scriplet passed through stdin under sudo.
run_with_sudo () {
	local ret
	local RUN="$TEST_DIRECTORY/$$.sh"
	write_script "$RUN" "$TEST_SHELL_PATH"
	sudo "$TEST_SHELL_PATH" -c "\"$RUN\""
	ret=$?
	rm -f "$RUN"
	return $ret
}
