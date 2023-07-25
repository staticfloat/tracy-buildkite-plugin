using TracyProfiler_jll

trace_prefix = ENV["BUILDKITE_PLUGIN_TRACY_TRACE"]
num_traces = parse(Int64, ENV["BUILDKITE_PLUGIN_TRACY_NUM_TRACES"])
port = parse(Int64, ENV["TRACY_PORT"])

trace_idx = 0
while trace_idx < num_traces
    trace_path = "$(trace_prefix).$(trace_idx).trace"
    @info("Starting capture agent", trace_path, port)
    run(`$(TracyProfiler_jll.capture()) -o $(trace_path) -p $(port) -f`)
    global trace_idx += 1
end
