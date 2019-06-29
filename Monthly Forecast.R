# Importing Libraries
library(tidyverse)
library(forecast)
library(Metrics)
library(prophet)

# Reading Data
data = AirPassengers
str(data)

# Splitting data in train & test
train = data[c(1:120)]    # 10 Years Data in Training Set
test = data[c(121:144)]

# Creating a TS object
ts_object <- ts(train, start = c(1949, 1), frequency = 12)
ts_object

# Simple Naive Forecasting
fit <- naive(ts_object, h = 24, level = 0.95)

# Visualization
plot(fit, xlab = "Duration", ylab = "Number of Passengers (in thousands)", col = "sky blue")
lines(fit$fit, col = "red", lty=2)
lines(fit$mean, col = "black", lty=2)

# Model Validation
mape(test, fit$mean)    # 23.6 %

# Seasonal Naive Forecasting
fit <- snaive(ts_object, h = 24, level = 0.95)

# Visualization
plot(fit, xlab = "Duration", ylab = "Number of Passengers (in thousands)",  col = "sky blue")
lines(fit$fit, col = "red", lty=2)
lines(fit$mean, col = "black", lty=2)

# Model Validation
mape(test, fit$mean)    # 15.5 %

# ARIMA Forecasting
fit = auto.arima(ts_object, seasonal = TRUE)
fcast = forecast(fit, h = 24, level = 0.95)

# Visualization
plot(fcast, xlab = "Duration", ylab = "Number of Passengers (in thousands)", col = "sky blue")
lines(fit$fitted, col = "red", lty = 2)
lines(fcast$mean, col = "black", lty = 2)

# Alternative Visualization
plot(ts_object, xlim = c(1949, 1961), col = "sky blue", ylab = "Number of Passengers(in thousands)")
lines(fit$fitted, col = "red")
lines(fcast$mean, col = "black")
lines(fcast$lower, col = "green") #95% Lower Confidence Interval
lines(fcast$upper, col = "green") #95% Upper Confidence Interval

# Model Validation
mape(test, fcast$mean)  # 14.9 %

# Simple Exponential Smoothing
fit <- ses(ts_object, h = 24, level = 0.95)

# Visualization
plot(fit, xlab="Duration", ylab="Number of Passengers (in thousands)", col = "sky blue")
lines(fit$fit, col = "red", lty=2)
lines(fit$mean, col = "black", lty=2)

# Model Validation
mape(test, fit$mean)    # 23.6 %

# Holt Linear Forecasting / Double Exponential Smoothing
fit <- holt(ts_object, h = 24, level = 0.95)

# Visualization
plot(fit, xlab="Duration", ylab="Number of Passengers (in thousands)", col = "sky blue")
lines(fit$fit, col = "red", lty=2)
lines(fit$mean, col = "black", lty=2)

# Model Validation
mape(test, fit$mean)    # 18.8 %

# Holt Winters Forecasting / Triple Exponential Smoothing
fit = hw(ts_object, h = 24, seasonal = "multiplicative")

# Visualization
plot(fit, xlab = "Duration", ylab = "Number of Passengers (in thousands)",  col = "sky blue")
lines(fit$fitted, col = "red", lty=2)
lines(fit$mean, col = "black", lty=2)

# Model Validation
mape(test,fit$mean)   # 7.3 %

# Prophet Forecasting
ds <- seq(as.Date("1949-01-01"), as.Date("1958-12-01"), by = "month")
y <- ts_object
df <- data.frame(ds, y)
m <- prophet(df, daily.seasonality = F, weekly.seasonality = F, yearly.seasonality = T, seasonality.mode = 'multiplicative')
future <- make_future_dataframe(m, periods = 24, freq = "month")
pred <- predict(m, future)

# Visualization
plot(m, pred, xlab = "Duration", ylab = "Number of Passengers (in thousands)")

# Model Validation
mape(test, pred$yhat[c(121:144)])   # 5.4 %

# Tbats Forecasting
fit <- tbats(ts_object)
pred <- forecast(fit, h = 24, level = 0.95)

# Visualization
plot(pred, xlab = "Duration", ylab = "Number of Passengers (in thousands)", col = "sky blue")
lines(fit$fitted.values, col = "red", lty = 2)
lines(pred$mean, col = "black", lty = 2)

# Model Validation
mape(test, pred$mean)     # 12.9 %

# Neural Network Forecasting
set.seed(123)
fit <- nnetar(ts_object)
fcast <- forecast(fit, level = 0.95, h = 24)

# Visualization
plot(fcast, xlab = "Duration", ylab = "Number of Passengers (in thousands)",  col = "sky blue")
lines(fit$fitted, col = "red", lty=2)
lines(fcast$mean, col = "black", lty=2)

# Model Validation
mape(test, fcast$mean)    # 5.1 %

# For the given dataset :
# Neural Network Forecasting Model has the most accurate predictions
# Followed closely by Prophet Forecasting Model & Holt Winters Model.