# P/ACF of pure seasonal models
# In the video, you saw that a pure seasonal ARMA time series is correlated at the seasonal lags only. Consequently, the ACF and PACF behave as the nonseasonal counterparts, but at the seasonal lags, 1S, 2S, …, where S is the seasonal period (S = 12 for monthly data). As in the nonseasonal case, you have the pure seasonal table:
#   
#   Behavior of the ACF and PACF for Pure SARMA Models
# 
#             AR(P)S	          MA(Q)S	          ARMA(P,Q)S
# ACF*	    Tails off at      Cuts off            Tails off at
#         seasonal  lags      after lag QS        seasonal lags
# 	 	
# # PACF*	  Cuts off          Tails off at        Tails off at
#         after lag PS	      seasonal lags	      seasonal lags
# 
# 
# *The values at nonseasonal lags are zero.
# 
# We have plotted the true ACF and PACF of a pure seasonal model. Identify the model with the following abbreviations SAR(P)S, SMA(Q)S, or SARMA(P,Q)S for the pure seasonal AR, MA or ARMA with seasonal period S, respectively.

# Exercise
# Fit a pure seasonal model
# As with other models, you can fit seasonal models in R using the sarima() command in the astsa package.
# 
# To get a feeling of how pure seasonal models work, it is best to consider simulated data. We generated 250 observations from a pure seasonal model given by
# which we would denote as a SARMA(P = 1, Q = 1)S = 12. Three years of data and the model ACF and PACF are plotted for you.
# 
# You will compare the sample ACF and PACF values from the generated data to the true values displayed to the right.
# 
# The astsa package is preloaded for you and the generated data are in x.
# 
# Instructions
# 100 XP
# Use acf2() to plot the sample ACF and PACF of the generated data to lag 60 and compare to actual values. To estimate to lag 60, set the max.lag argument equal to 60.
# Fit the model to generated data using sarima(). In addition to the p, d, and q arguments in your sarima() command, specify P, D, Q, and S (note that R is case sensitive).

x <- c(-3.0631,-1.9973,-3.925,5.3704,7.4704,0.5023,2.477,-10.093,-3.4621,1.8349,3.8015,1.8529,-1.9452,-1.8814,-4.7828,4.3613,7.1589,2.6985,0.2368,-9.9328,-3.4056,0.7185,2.713,2.3094,-1.308,-0.5727,-5.3703,3.0529,7.7491,3.9256,-0.3544,-10.3264,-1.3022,1.7963,1.5369,4.5959,-0.9381,-0.7533,-5.0594,3.346,7.3187,2.8015,0.2365,-9.541,-1.4664,3.8292,1.562,3.9342,-0.7946,-0.3197,-4.6069,2.9466,6.4785,0.4027,0.4128,-8.0693,-2.5118,4.1046,0.4488,1.2739,-0.5609,-0.3457,-2.9327,2.5254,5.8761,-1.3741,-0.8331,-8.1928,-1.4646,5.5017,0.1454,1.3365,-0.0972,0.8928,-2.4465,2.8685,4.5219,-1.1334,-0.9606,-8.4297,-1.3245,6.8565,0.5606,1.8421,-0.4535,2.7858,-4.9083,2.9095,3.6501,-0.6813,-1.0642,-6.4749,0.3132,6.8491,2.6048,3.129,-0.6266,2.9043,-6.0233,1.9755,3.7448,-1.2074,-0.2315,-5.5687,0.1164,4.8737,3.7485,4.2162,-0.8012,2.669,-3.8665,3.5259,3.61,-0.2982,-0.3655,-5.1481,-1.4649,2.2592,3.2143,4.7886,-0.7837,2.8582,-3.7644,3.8847,2.7254,1.2969,-1.5343,-4.081,-2.0806,-0.0502,1.18,4.5816,-2.7415,1.9899,-2.8283,4.1692,0.753,2.1895,-1.8383,-2.8212,-4.0667,-1.3797,0.9833,4.5612,-3.0114,0.5685,-3.2547,2.0118,-0.3963,1.6303,-1.766,-2.1874,-2.507,-1.2956,1.7447,4.9749,-3.1017,1.36,-2.6113,-0.109,1.3876,1.7271,-2.4901,-3.8135,-1.9575,-0.5715,2.3792,5.92,-5.0541,1.698,-2.6214,-1.5388,1.8016,1.9317,-1.4056,-5.8387,-3.0108,-0.7902,2.0804,4.1437,-6.0719,2.3743,-2.6587,-2.0977,0.722,2.443,-1.1222,-5.9795,-4.8498,-0.7125,1.8683,2.1274,-6.8544,1.9099,-3.2052,-1.1395,0.581,1.5265,-2.0508,-6.7241,-4.6124,-1.2356,0.5896,0.828,-7.4342,0.6021,-4.2877,-1.8247,-0.2418,0.107,-2.5409,-7.6183,-4.066,0.3232,0.1666,0.145,-6.4042,0.5848,-3.0747,-3.8121,-2.4838,0.7831,-2.5119,-7.7701,-4.3893,2.4261,0.6071,0.4702,-5.9338,1.5506,-1.2883,-3.3124,-3.3211,2.4784,-1.3513,-10.6929,-5.3753,3.1613,-0.4737,2.1103,-6.4529,0.9986,-0.4725,-2.4418,-3.7398,3.2706,-2.5703,-10.6444,-3.9719,2.4082,0.0678,3.3746)
  

# Plot sample P/ACF to lag 60 and compare to the true values
acf2(x, max.lag = 60)

# Fit the seasonal model to x
sarima(x, p = 0, d = 0, q = 0, P = 1, D = 0, Q = 1, S = 12)


# Exercise
# Fit a mixed seasonal model
# Pure seasonal dependence such as that explored earlier in this chapter is relatively rare. Most seasonal time series have mixed dependence, meaning only some of the variation is explained by seasonal trends.
# 
# Recall that the full seasonal model is denoted by SARIMA(p,d,q)x(P,D,Q)S where capital letters denote the seasonal orders.
# 
# As before, this exercise asks you to compare the sample P/ACF pair to the true values for some simulated seasonal data and fit a model to the data using sarima(). This time, the simulated data come from a mixed seasonal model, SARIMA(0,0,1)x(0,0,1)12. The plots on the right show three years of data, as well as the model ACF and PACF. Notice that, as opposed to the pure seasonal model, there are correlations at the nonseasonal lags as well as the seasonal lags.
# 
# As always, the astsa package is preloaded. The generated data are in x.
# 
# Instructions
# 100 XP
# Plot the sample ACF and PACF of the generated data to lag 60 (max.lag = 60) and compare them to the actual values.
# Fit the model to generated data (x) using sarima(). As in the previous exercise, be sure to specify the additional seasonal arguments in your sarima() command.

x <- x(-1.2426,-0.6801,1.3562,0.8431,-0.4088,1.0619,-1.0802,3.0016,0.8125,-0.3884,-1.7883,2.3206,-3.2641,0.866,-0.004,0.2885,0.8551,1.4448,-1.0848,2.4257,-2.2007,-1.0135,0.1272,1.3261,-2.958,2.6348,-1.2087,0.2877,0.0246,2.2245,-0.7922,2.5797,-2.4399,-1.9613,1.7323,-0.62,-1.0626,1.1476,-0.5529,1.1919,-1.6423,0.8361,1.0217,0.844,0.4072,-1.2393,-0.0928,-0.9175,-0.5435,0.0172,0.2178,1.8945,-1.6283,1.0916,1.4246,-0.9616,-1.4071,0.5803,0.1282,-0.509,-0.3799,0.8861,-1.1345,2.3185,-1.1985,2.7003,0.3399,-1.3933,-1.5535,1.1494,1.9496,-0.5625,-1.7461,2.4397,-1.4489,0.3057,0.4947,2.1695,1.0352,0.1864,0.0435,0.9723,-1.7242,1.3145,-1.9123,1.81,1.1106,-1.5175,2.9504,-1.6819,2.4225,-1.5255,0.3721,-0.5025,-0.1602,-1.42,-0.8262,1.2013,1.7642,-1.7585,3.3917,-0.8729,1.4888,-2.7675,0.4421,0.1706,-1.1175,-0.7566,0.7555,0.9307,-0.8323,1.0285,1.176,-0.2703,0.8184,-2.0964,-0.2337,0.3099,-1.0178,2.8832,-1.1191,0.2014,-0.4954,1.5064,-0.6958,0.0209,0.4609,-2.8169,0.6651,-0.7699,2.2834,0.6351,-2.8755,-0.2008,1.1095,0.666,0.0958,-0.7756,-2.0219,2.1014,-0.8612,-1.659,3.3241,-0.4277,0.0025,-0.0629,0.081,-0.0341,-1.0221,0.2473,-2.8324,4.967,-2.3484,-1.9634,2.9661,0.3167,0.6782,-1.1455,-0.2787,1.6322,-3.3082,1.1827,0.8752,1.9412,-1.4267,-1.0359,1.1955,1.4254,1.1264,-3.3538,1.0246,0.9758,-1.0096,-1.4369,2.349,-0.4515,0.269,-0.2448,-1.1074,2.4423,-0.5441,-0.1136,-0.1208,1.0169,-1.1073,-0.6785,0.3563,-0.5354,0.5842,1.0747,-1.7299,1.3211,-1.5029,0.7968,-0.713,1.5986,-1.5512,1.4622,-1.5657,-2.0941,1.159,1.5203,0.5277,-0.4795,0.0197,-0.3575,1.0882,-0.9355,2.7071,-0.0528,-1.8764,-1.1624,2.7192,-0.818,-0.3507,0.4589,0.6501,-0.7353,2.805,-1.1531,2.1709,-0.0075,-0.5398,-1.1861,1.6939,0.4912,-3.2699,1.6051,-0.2563,0.2354,2.3343,1.164,-2.0238,-0.1743,1.5875,-3.0794,-1.2856,2.6796,-2.6247,0.28,-0.9105,0.7893,1.6772,1.2914,-2.9352,0.587,0.7829,-0.7485,-0.4551,1.1813,-0.2213,-1.7128
)

x <- ts(x)

# Plot sample P/ACF pair to lag 60 and compare to actual
acf2(x, max.lag = 60)

# Fit the seasonal model to x
sarima(x, p = 0, d = 0, q = 1, P = 0, D = 0, Q = 1, S = 12)



# Exercise
# Data analysis - unemployment I
# In the video, we fit a seasonal ARIMA model to the log of the monthly AirPassengers data set. You will now start to fit a seasonal ARIMA model to the monthly US unemployment data, unemp, from the astsa package.
# 
# The first thing to do is to plot the data, notice the trend and the seasonal persistence. Then look at the detrended data and remove the seasonal persistence. After that, the fully differenced data should look stationary.
# 
# The astsa package is preloaded in your workspace.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Plot the monthly US unemployment (unemp) time series from astsa. Note trend and seasonality.
# Detrend and plot the data. Save this as d_unemp. Notice the seasonal persistence.
# Seasonally difference the detrended series and save this as dd_unemp. Plot this new data and notice that it looks stationary now.


# Plot unemp 
plot(unemp)

# Difference your data and plot it
d_unemp <- diff(unemp)
plot(d_unemp)

# Seasonally difference d_unemp and plot it
dd_unemp <- diff(d_unemp, lag = 12)  
plot(dd_unemp)


# Exercise
# Data analysis - unemployment II
# Now, you will continue fitting an SARIMA model to the monthly US unemployment unemp time series by looking at the sample ACF and PACF of the fully differenced series.
# 
# Note that the lag axis in the sample P/ACF plot is in terms of years. Thus, lags 1, 2, 3, … represent 1 year (12 months), 2 years (24 months), 3 years (36 months), …
# 
# Once again, the astsa package is preloaded in your workspace.
# 
# Instructions
# 70 XP
# Difference the data fully (as in the previous exercise) and plot the sample ACF and PACF of the transformed data to lag 60 months (5 years). Consider that, for
# the nonseasonal component: the PACF cuts off at lag 2 and the ACF tails off.
# the seasonal component: the ACF cuts off at lag 12 and the PACF tails off at lags 12, 24, 36, …
# Suggest and fit a model using sarima(). Check the residuals to ensure appropriate model fit.


# Plot P/ACF pair of fully differenced data to lag 60
dd_unemp <- diff(diff(unemp), lag = 12)
acf2(dd_unemp, max.lag = 60)

# Fit an appropriate model
sarima(unemp, p = 2, d = 1, q = 0, P = 0, D = 1, Q = 1, S = 12)


# Exercise
# Data analysis - commodity prices
# Making money in commodities is not easy. Most commodities traders lose money rather than make it. The package astsa includes the data set chicken, which is the monthly whole bird spot price, Georgia docks, US cents per pound, from August, 2001 to July, 2016.
# 
# The astsa package is preloaded in your R console and the data are plotted for you, note the trend and seasonal components.
# 
# First, you will use your skills to carefully fit an SARIMA model to the commodity. Later, you will use the fitted model to try and forecast the whole bird spot price.
# 
# After removing the trend, the sample ACF and PACF suggest an AR(2) model because the PACF cuts off after lag 2 and the ACF tails off. However, the ACF has a small seasonal component remaining. This can be taken care of by fitting an addition SAR(1) component.
# 
# By the way, if you are interested in analyzing other commodities from various regions, you can find many different time series at index mundi.
# 
# Instructions
# 100 XP
# Plot the differenced (d = 1) data diff(chicken). Note that the trend is removed and note the seasonal behavior.
# Plot the sample ACF and PACF of the differenced data to lag 60 (5 years). Notice that an AR(2) seems appropriate but there is a small but significant seasonal component remaining in the detrended data.
# Fit an ARIMA(2,1,0) to the chicken data to see that there is correlation remaining in the residuals.
# Fit an SARIMA(2,1,0)x(1,0,0)12 and notice the model fits well.



# Plot differenced chicken
plot(diff(chicken))

# Plot P/ACF pair of differenced data to lag 60
acf2(diff(chicken, max.lag = 60))

# Fit ARIMA(2,1,0) to chicken - not so good
sarima(chicken, p = 2, d = 1, q = 0)

# Fit SARIMA(2,1,0,1,0,0,12) to chicken - that works
sarima(chicken, 2, 1, 0, 1, 0, 0, 12)


# Exercise
# Data analysis - birth rate
# Now you will use your new skills to carefully fit an SARIMA model to the birth time series from astsa. The data are monthly live births (adjusted) in thousands for the United States, 1948-1979, and includes the baby boom after WWII.
# 
# The birth data are plotted in your R console. Note the long-term trend (random walk) and the seasonal component of the data.
# 
# Instructions
# 100 XP
# Use diff() to difference the data (d_birth). Use acf2() to view the sample ACF and PACF of this data to lag 60. Notice the seasonal persistence.
# Use another call to diff() to take the seasonal difference of the data. Save this to dd_birth. Use another call to acf2() to view the ACF and PACF of this data, again to lag 60. Conclude that an SARIMA(0,1,1)x(0,1,1)12 model seems reasonable.
# Fit the SARIMA(0,1,1)x(0,1,1)12 model. What happens?
#   Add an additional AR (nonseasonal, p = 1) parameter to account for additional correlation. Does the model fit well?
  

# Plot P/ACF to lag 60 of differenced data
d_birth <- diff(birth)
acf2(d_birth, max.lag = 60)

# Plot P/ACF to lag 60 of seasonal differenced data
dd_birth <- diff(d_birth, lag = 12)
acf2(dd_birth, max.lag = 60)

# Fit SARIMA(0,1,1)x(0,1,1)_12. What happens?
sarima(birth, 0, 1, 1, 0, 1, 1, 12)

# Add AR term and conclude
sarima(birth, 1, 1, 1, 0, 1, 1, 12)


# Exercise
# Forecasting monthly unemployment
# Previously, you fit an SARIMA(2,1,0, 0,1,1)12 model to the monthly US unemployment time series unemp. You will now use that model to forecast the data 3 years.
# 
# The unemp data are preloaded into your R workspace and plotted on the right.
# 
# Instructions
# 100 XP
# Begin by again fitting the model used earlier in this chapter (using the sarima() command). Recheck the parameter significance and residual diagnostics.
# Use sarima.for() to forecast the data 3 years into the future.

# Fit your previous model to unemp and check the diagnostics
sarima(unemp, 2, 1, 0, 0, 1, 1, 12)

# Forecast the data 3 years into the future
sarima.for(unemp, 2, 1, 0, 0, 1, 1, 12, n.ahead = 36)


# Exercise
# How hard is it to forecast commodity prices?
#   As previously mentioned, making money in commodities is not easy. To see a difficulty in predicting a commodity, you will forecast the price of chicken to five years in the future. When you complete your forecasts, you will note that even just a few years out, the acceptable range of prices is very large. This is because commodities are subject to many sources of variation.
# 
# Recall that you previously fit an SARIMA(2,1,0, 1,0,0)12 model to the monthly US chicken price series chicken. You will use this model to calculate your forecasts.
# 
# The astsa package is preloaded for you and the monthly price of chicken data (chicken) are plotted on the right.
# 
# Instructions
# 100 XP
# Refit the SARIMA model from the earlier exercise and convince yourself that it fits well. Check parameter significance and residual diagnostics.
# Use sarima.for() to forecast the data 5 years into the future.


# Fit the chicken model again and check diagnostics
sarima(chicken, 2, 1, 0, 1, 0, 0, 12)

# Forecast the chicken data 5 years into the future
sarima.for(chicken, 2, 1, 0, 1, 0, 0, 12, n.ahead = 60)



