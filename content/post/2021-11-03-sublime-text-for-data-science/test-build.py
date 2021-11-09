import numpy as np
import matplotlib.pyplot as plt

# simulated data
n = 100
x = np.linspace(0, 10, num=n)
y = (x - 4)**2 + 2 + np.random.normal(size=n)

# design matrix
X = np.column_stack((np.ones(n), x, x**2))

# coefficient estimate
bhat = np.linalg.solve(X.T @ X, X.T @ y)

# predictions
yhat = X @ bhat

# plot measurements and predictions
plt.plot(x, y, '.b', label='Measurement')
plt.plot(x, yhat, '-r', label='Prediction')
plt.xlabel("x values")
plt.ylabel("y values")
plt.legend()
plt.show()