text = "Hello world"
println(text)

using Pkg
Pkg.add("Plots")
Pkg.add("GR")
using Plots

# plot some data
plot([cumsum(rand(500) .- 0.5), cumsum(rand(500) .- 0.5)])