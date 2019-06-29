# Time-Series-Forecasting

Time Series Analysis is the act of analysing past events to forecast future outcomes.

Every Time Series data has the following 4 basic Components : 
TREND			                          (T)			 : Long Term Movement in Time Series	
SEASONALITY		                      (S)			 : Fluctuations within a year during the Season
CYCLIC VARIATIONS 	                (C)			 : Medium Term Changes in Time Series
IRREGULAR / RANDOM FLUCTUATIONS     (I) 	 : Fluctuations due to unpredictable incidences

Further, following are some of the basic Time Series Model types :

Additive Model : Adds all the 4 components :
				y = T + S + C + I

Multiplicative Model : Multiplies all the 4 components :
				y = T * S * C * I

Mixed Model : Combines rules of Additive as well as Multiplicative Model. Example :
		y = (T * S) + (C * I)
		y = (T * S) + C + I

# About Forecasting Models :
1. Simple Naïve Model : This is the simplest Time Series Forecasting Model that doesn’t requires any parameters. This model simply uses last given value and assigns this constant value as the future predictions respectively.

2.	Seasonal Naïve Model : As the name suggests, this model accounts for seasonality by simply assigning the future prediction as the most recent value observed over the same season.

3.	ARIMA (Auto Regressive Integrated Moving Average) : In ARIMA Models, a non-stationary time series is made stationary by applying finite differencing of the data points. The predictions are made on the basis of estimates of 3 parameters : p, d and q respectively.

4.	Simple Exponential Smoothing : This model is suitable for forecasting data with no clear trend or seasonal behaviour & estimates only 1 smoothing parameter for level to forecast future outcomes.

5.	Double Exponential Smoothing : This model accounts for level as well as trend component but ignores seasonality and is also known as Holt’s Linear Forecasting Model. After estimating two smoothing parameters : alpha & beta, this model predicts the future outcomes.

6.	Triple Exponential Smoothing : This model accounts for level, trend as well as seasonality & is also known as Holt Winters Forecasting Model. To predict the future outcomes, this model requires estimating 3 smoothing parameters : alpha, beta & gamma.

7.	Prophet Forecasting Model : This model accounts for level, trend, seasonality as well as holiday effects and works the best when non linear trends are fit within yearly, weekly & daily seasonality. Prophet forecasts have generally lower prediction errors than other forecasting models.

8.	TBATS Forecasting Model : This model is a generalised exponential smoothing state space model with Box-Cox transformation, ARMA errors, Trend and Seasonal components. The TBATS model is preferable when the seasonality changes over time.

9.	Neural Networks Forecasting Model : This model feeds forward neural networks with a single hidden layer and lagged inputs for forecasting univariate time series. Neural Networks have the advantage that can approximate nonlinear functions and have immense prediction power.

Clearly, for the solved case, Neural Networks Forecasting Model has the lowest error, followed closely by Prophet Modelling & Holt Winters Forecasting Model.
