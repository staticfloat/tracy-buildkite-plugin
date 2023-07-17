using Tracy, TracyProfiler_jll

trace_path = get(ENV, "BUILDKITE_PLUGIN_TRACY_TRACE", "out.trace")
port = parse(Int64, get(ENV, "TRACY_PORT", "9000"))
wait(Tracy.capture(trace_path; port))
