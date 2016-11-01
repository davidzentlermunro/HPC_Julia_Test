println("Hello Hello. I am running on HPC and my ID is ", ENV["SGE_TASK_ID"])

push!(LOAD_PATH, "//data/uctpdtz/Julia/Code")

@everywhere using TestModule

y=fsq(int(ENV["SGE_TASK_ID"]))

println("The square of ", ENV["SGE_TASK_ID"], " is ", y)