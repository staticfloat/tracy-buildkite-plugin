using Tracy
@info("Waiting for capture client connection", port=get(ENV, "TRACY_PORT", "9000"))
Tracy.wait_for_tracy()
println("Connected!")

@tracepoint "test tracepoint" begin
    println("Hello, world!")
end

@tracepoint "Let's sleep a while" begin
    println("I'll just take a little nap, since I'm so very sleepy.")
    sleep(1)
    println("I've finished my nap!")
end
