using TracyProfiler_jll

trace_path = ENV["BUILDKITE_PLUGIN_TRACY_TRACE"]
port = parse(Int64, ENV["TRACY_PORT"])
@info("Starting capture agent", trace_path, port)
run(`$(TracyProfiler_jll.capture()) -o $(trace_path) -p $(port) -f`)
