library("tidyverse")

# simulated data
n <- 100
x <- seq(0, 10, length.out = n)
y <- (x - 4)^2 + 2 + rnorm(n)

# data frame
X <- data.frame(y = y, x = x)

# linear regression model
mod <- lm(y ~ x + I(x^2), data = X)

# predictions
yhat <- predict(mod)

# plot measurements and predictions
colors = c('Measurement' = 'blue',
           'Prediction' = 'red')
p <- ggplot() +
    geom_point(data = X, aes(x = x, y = y,
                             color = 'Measurement')) +
    geom_line(aes(x = x, y = yhat,
                  color = 'Prediction')) +
    xlab('x values') +
    ylab('y values') +
    scale_color_manual(name = '', values = colors) +
    theme(legend.position = 'top')
print(p)
