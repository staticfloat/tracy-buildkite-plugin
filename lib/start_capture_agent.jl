using TracyProfiler_jll

trace_path = get(ENV, "BUILDKITE_PLUGIN_TRACY_TRACE", "out.trace")
port = parse(Int64, get(ENV, "TRACY_PORT", "9000"))
@info("Starting capture agent", trace_path, port)
run(`$(TracyProfiler_jll.capture()) -o $(trace_path) -p $(port) -f`)
