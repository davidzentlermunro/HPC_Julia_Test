println("Hello Hello. I am running on HPC and my ID is ", ENV["SGE_TASK_ID"])
push!(LOAD_PATH, "/share/apps/julia-pkg/v0.5")
using JLD
push!(LOAD_PATH, "/home/uctpdtz/HPC_Julia_Test")
using TestModule
y=fsq(parse(Int64,ENV["SGE_TASK_ID"]))

println("The square of ", ENV["SGE_TASK_ID"], " is ", y)

save("/home/uctpdtz/Output", "solcentral", y)
