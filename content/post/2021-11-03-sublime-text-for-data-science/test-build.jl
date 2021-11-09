using DataFrames, GLM
using Random, Distributions
using Plots

# simulated data
n = 100;
x = range(0, 10, length=n);
y = (x .- 4).^2 .+ 2 + rand(Normal(0, 1), n);

# data frame
X = DataFrame(x=x, y=y);

# linear regression model
mod = lm(@formula(y ~ x + x^2), X);

# predictions
yhat = predict(mod);

# plot measurements and predictions
scatter(x, y, axis="x values", yaxis="y values",
        color="blue", label="Measurement")
plot!(x, yhat, color="red", label="Prediction")
plot!(legend=:topleft)
display(plot!())

