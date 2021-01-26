# Exercise
# Fitting an AR(1) model
# Recall that you use the ACF and PACF pair to help identify the orders  and  of an ARMA model. The following table is a summary of the results:
#   
#         AR()	        MA()	        ARMA()
# ACF	  Tails off      Cuts off
#                     after lag 	  Tails off
# PACF	Cuts off
#       after lag   	Tails off	    Tails off
# In this exercise, you will generate data from the AR(1) model,

#   X(t) = 0.9X(t-1) + W(t)

# look at the simulated data and the sample ACF and PACF pair to determine the order. Then, you will fit the model and compare the estimated parameters to the true parameters.
# 
# Throughout this course, you will be using sarima() from the astsa package to easily fit models to data. The command produces a residual diagnostic graphic that can be ignored until diagnostics is discussed later in the chapter.
# 
# Instructions
# 100 XP
# The package astsa is preloaded.
# Use the prewritten arima.sim() command to generate 100 observations from an AR(1) model with AR parameter .9. Save this to x.
# Plot the generated data using plot().
# Plot the sample ACF and PACF pairs using the acf2() command from the astsa package.
# Use sarima() from astsa to fit an AR(1) to the previously generated data. Examine the t-table and compare the estimates to the true values. For example, if the time series is in x, to fit an AR(1) to the data, use sarima(x, p = 1, d = 0, q = 0) or simply sarima(x, 1, 0, 0).


# Generate 100 observations from the AR(1) model
x <- arima.sim(model = list(order = c(1, 0, 0), ar = .9), n = 100) 

# Plot the generated data 
plot(x)

# Plot the sample P/ACF pair
acf2(x)

# Fit an AR(1) to the data and examine the t-table
sarima(x, p = 1, d = 0, q = 0)


# Exercise
# Fitting an AR(2) model
# For this exercise, we generated data from the AR(2) model,

# X(t) = 1.5X(t-1) -0.75X(t-2) + W(t)

# using x <- arima.sim(model = list(order = c(2, 0, 0), ar = c(1.5, -.75)), n = 200). Look at the simulated data and the sample ACF and PACF pair to determine the model order. Then fit the model and compare the estimated parameters to the true parameters.
# 
# Instructions
# 100 XP
# The package astsa is preloaded. x contains the 200 AR(2) observations.
# Use plot() to plot the generated data in x.
# Plot the sample ACF and PACF pair using acf2() from the astsa package.
# Use sarima() to fit an AR(2) to the previously generated data in x. Examine the t-table and compare the estimates to the true values.


# astsa is preloaded
x <- arima.sim(model = list(order = c(2, 0, 0), ar = c(1.5, -0.75)), n = 200)
# Plot x
plot(x)

# Plot the sample P/ACF of x
acf2(x)

# Fit an AR(2) to the data and examine the t-table
sarima(x, 2, 0, 0)


# Exercise
# Fitting an MA(1) model
# In this exercise, we generated data from an MA(1) model,

# X(t) = W(t) - 0.8W(t-1)


# x <- arima.sim(model = list(order = c(0, 0, 1), ma = -.8), n = 100). Look at the simulated data and the sample ACF and PACF to determine the order based on the table given in the first exercise. Then fit the model.
# 
# Recall that for pure MA(q) models, the theoretical ACF will cut off at lag q while the PACF will tail off.
# 
# Instructions
# 100 XP
# The package astsa is preloaded. 100 MA(1) observations are available in your workspace as x.
# Use plot() to plot the generated data in x.
# Plot the sample ACF and PACF pairs using acf2() from the astsa package.
# Use sarima() from astsa to fit an MA(1) to the previously generated data. Examine the t-table and compare the estimates to the true values.

# astsa is preloaded
x <- arima.sim(model = list(order = c(0,0,1), ma = 0.8), n = 100)
# Plot x
plot(x)

# Plot the sample P/ACF of x
acf2(x)

# Fit an MA(1) to the data and examine the t-table
sarima(x, 0,0,1)



# Exercise
# Fitting an ARMA model
# You are now ready to merge the AR model and the MA model into the ARMA model. We generated data from the ARMA(2,1) model,

#  X(t) = X(t-1) - 0.9X(t-2) + W(t) +0.8W(t-1)

# x <- arima.sim(model = list(order = c(2, 0, 1), ar = c(1, -.9), ma = .8), n = 250). Look at the simulated data and the sample ACF and PACF pair to determine a possible model.
# 
# Recall that for ARMA() models, both the theoretical ACF and PACF tail off. In this case, the orders are difficult to discern from data and it may not be clear if either the sample ACF or sample PACF is cutting off or tailing off. In this case, you know the actual model orders, so fit an ARMA(2,1) to the generated data. General modeling strategies will be discussed further in the course.
# 
# Instructions
# 100 XP
# The package astsa is preloaded. 250 ARMA(2,1) observations are in x.
# As in the previous exercises, use plot() to plot the generated data in x and use acf2() to view the sample ACF and PACF pairs.
# Use sarima() to fit an ARMA(2,1) to the generated data. Examine the t-table and compare the estimates to the true values.

x <- c(-4.28495665464901,-4.00205880809773,-0.0223715189990314,4.49959398409199,4.53647561195077,0.117567835556764,-3.64130266142861,-2.28010559342194,1.59135757614449,2.47286584392138,-1.04558608881315,-4.25374503609139,-3.90675254740202,0.0970471447411363,3.37000159059609,1.79616178608287,-1.7609234882056,-4.45076577230001,-2.97864718545938,1.87949754264977,5.22755609506253,3.61990752698316,-0.734558887116241,-3.94927036044306,-2.84411953677012,1.45183490179095,2.84595106696976,-1.00812743797591,-4.78098313772067,-4.74800618096486,-0.557797466836487,3.73948520814131,3.56025526836635,-1.19404728860724,-4.80679316104276,-3.1846773359434,0.258680025728978,2.687392114811,2.60049286381994,0.12409477378281,-0.867751568255656,0.687216728802246,2.62850214842742,2.47400032236116,-1.012339810199,-3.26963828934662,-0.896833978160832,3.16494883521415,3.25837428036953,-0.153138880135534,-2.33034788466325,-1.07941032270154,1.17422671518356,2.15779105899579,1.82335080512922,-0.786174354044922,-2.36543889601216,-1.98679691119954,-1.51345911485265,-0.272816548157837,-0.627743922614042,-2.2893431517281,-1.35977170841768,1.19409662044761,1.56535093775843,-1.25470245940374,-5.0545953743293,-4.85581569728245,-1.11841256941071,2.69101575792541,1.84508930685269,-2.28488354989433,-3.37790255243202,-0.693525621589492,1.24325472688622,1.58310909601615,1.81785537435434,0.69419550454331,-1.47519404302218,-2.091519974805,-1.99139974251199,0.0358024953705045,1.55436755035269,0.113460451359234,-0.50419107903055,1.96925943714033,3.59705948532103,1.29904949494185,-3.46004039572443,-5.22944299201169,-1.34942207765646,3.48354593914493,3.45228455284441,-1.1963604067437,-6.0858818265731,-3.84961653361153,2.77369585753585,5.46183153839669,2.35506242153341,-1.50619301847544,-3.6607646330308,-2.56742175855837,1.36641744644972,5.93497253564088,5.4046039604689,-1.24008318402202,-8.29563499572165,-9.68940103802407,-3.83597000735811,6.22460321725489,12.0099679567156,9.07349078632566,0.126755673377254,-6.97252251437713,-5.22690668852176,0.772670812464619,5.13962926998233,4.62997761116037,-1.00994812535775,-5.24733393804535,-4.23487225056607,0.61674309932093,3.28718043135146,2.31489305580437,0.340011631568742,-3.02232243256428,-5.44247258143787,-4.00943405135007,-0.0755712186562647,4.0250628986748,4.68837651682991,0.904964273242206,-3.88622303898065,-4.60670304006688,-1.17728456609688,4.45987023256475,8.22775782776083,2.43308642701613,-7.13692983980948,-7.41601142799575,0.966766410235604,8.34426989323663,6.90816093223499,-2.71726000273973,-10.1042657867635,-7.29734044087731,0.957032961735257,5.19346732229224,2.66697833708428,-2.05044791146523,-2.26351858699198,0.685090256641191,2.07573701216408,-1.66649982855419,-4.00167910670744,-1.32940889318024,2.91806975458966,4.07903171219649,-0.436943216921295,-5.46067759408019,-6.67137403950154,-4.77729106429849,-0.6308067084705,3.27267859949113,3.55685547582822,-1.0856081021463,-5.5662570892684,-2.66023244405025,3.37294809458647,5.79834219949675,0.358816268311728,-8.06471276016246,-9.56615902820219,-1.37437765224028)

x <- c(x,6.23764620642288,6.03573572504276,1.86118953033652,-1.29405458757779,-0.728128157268584,0.627884153485502,-2.86775060885937,-6.00498906700975,-3.78192452038777,1.51191539311957,5.90857431792384,5.79249893171371,0.391318381812085,-5.79774561309523,-6.73339792596196,-1.48767353747414,2.256304206147,2.35735825786551,2.69170473124376,0.393181346722407,-3.80022041652175,-5.32464711165328,-3.05538660941891,1.63828262131262,5.76139758360328,7.88816766254755,5.08932187939959,-2.15286330074288,-4.74329608046831,-0.445364083818814,2.78650876601937,2.05312713355091,0.685581975539387,0.517473442908653,0.605102278319832,0.023142883930055,-1.0341539845703,-0.988315598186613,1.13830759991864,2.41382914725293,-0.301874706982749,-1.8637240613466,-1.53473974673423,-1.06766287286568,1.26591538352541,3.14281946925,2.84950342331749,0.822586638266765,-1.70979938628123,-1.52656840551378,-0.643302109703618,1.19290896303818,1.91677961137809,-0.930956084033631,-2.87782310176976,-0.509921654544149,4.08735384937059,3.93120420520495,-1.59596875130158,-5.81844867534883,-4.84886312485376,-0.438205881034018,2.54864242179325,3.92322999129619,3.05380019761698,-0.365930322529126,-3.5461713205628,-3.60753971418408,0.31387351871294,3.36918553241261,3.96692316832464,1.01504755794303,-3.45666429411901,-6.32568764111564,-1.90413350174791,7.43696111202075)
# astsa is preloaded
x
# Plot x
plot(x)

# Plot the sample P/ACF of x
acf2(x)

# Fit an ARMA(2,1) to the data and examine the t-table
sarima(x, 2, 0, 1)


# Exercise
# Model choice - I
# Based on the sample P/ACF pair of the logged and differenced varve data (dl_varve), an MA(1) was indicated. The best approach to fitting ARMA is to start with a low order model, and then try to add a parameter at a time to see if the results change.
# 
# In this exercise, you will fit various models to the dl_varve data and note the AIC and BIC for each model. In the next exercise, you will use these AICs and BICs to choose a model. Remember that you want to retain the model with the smallest AIC and/or BIC value.
# 
# A note before you start:
#   
#   sarima(x, p = 0, d = 0, q = 1) and sarima(x, 0, 0, 1)
# 
# are the same.
# 
# Instructions
# 100 XP
# The package astsa is preloaded. The varve series has been logged and differenced as dl_varve <- diff(log(varve)).
# Use sarima() to fit an MA(1) to dl_varve. Take a close look at the output of your sarima() command to see the AIC and BIC for this model.
# Repeat the previous exercise, but add an MA parameter by fitting an MA(2) model. Based on AIC and BIC, is this an improvement over the previous model?
#   Instead of adding an MA parameter, add an AR parameter to the original MA(1) fit. That is, fit an ARMA(1,1) to dl_varve. Based on AIC and BIC, is this an improvement over the previous models?

dl_varve <- diff(log(varve))
# Fit an MA(1) to dl_varve.   
sarima(dl_varve, 0,0,1)

# Fit an MA(2) to dl_varve. Improvement?
sarima(dl_varve, 0,0,2)

# Fit an ARMA(1,1) to dl_varve. Improvement?
sarima(dl_varve, 1, 0, 1)


# Exercise
# Model choice - II
# In the previous exercise, you fit three different models to the logged and differenced varve series (dl_varve). The data are displayed to the right. The extracted AIC and BIC from each run are tabled below.
# 
# Model	AIC	BIC
# MA(1)	-0.4437	-1.4366
# MA(2)	-0.4659	-1.4518
# ARMA(1,1)	-0.4702	-1.4561
# 
# Using the table, indicate which statement below is FALSE.
# 
# Instructions
# 50 XP
# Instructions
# 50 XP
# Possible Answers
# 
# AIC and BIC both prefer the ARMA(1,1) model over the other fitted models.
# 
# AIC prefers the MA(1) model.   <-  answer
# 
# BIC prefers the MA(2) over the MA(1)
# 
# Because they use different penalties, the AIC and BIC can prefer different models.


# Exercise
# Residual analysis - I
# As you saw in the video, an sarima() run includes a residual analysis graphic. Specifically, the output shows (1) the standardized residuals, (2) the sample ACF of the residuals, (3) a normal Q-Q plot, and (4) the p-values corresponding to the Box-Ljung-Pierce Q-statistic.
# 
# In each run, check the four residual plots as follows:
#   
#   The standardized residuals should behave as a white noise sequence with mean zero and variance one. Examine the residual plot for departures from this behavior.
# The sample ACF of the residuals should look like that of white noise. Examine the ACF for departures from this behavior.
# Normality is an essential assumption when fitting ARMA models. Examine the Q-Q plot for departures from normality and to identify outliers.
# Use the Q-statistic plot to help test for departures from whiteness of the residuals.
# As in the previous exercise, dl_varve <- diff(log(varve)), which is plotted below a plot of varve. The astsa package is preloaded.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Use sarima() to fit an MA(1) to dl_varve and do a complete residual analysis as prescribed above. Make a note of what you see for the next exercise.
# Use another call to sarima() to fit an ARMA(1,1) to dl_varve and do a complete residual analysis as prescribed above. Again, make a note of what you see for the next exercise.

# Fit an MA(1) to dl_varve. Examine the residuals  
sarima(dl_varve, 0,0,1)

# Fit an ARMA(1,1) to dl_varve. Examine the residuals
sarima(dl_varve, 1, 0, 1)


# Exercise
# Residual analysis - II
# In the previous exercise, you fit two different ARMA models to the logged and differenced varve series: an MA(1) and an ARMA(1,1) model. The residual analysis graphics are displayed in order of the run:
#   
#   MA(1)
# ARMA(1, 1)
# 
# Which of the following statements is FALSE (partially truthful statements are false - data analysis is not politics)?
#   
#   Instructions
# 50 XP
# Possible Answers
# 
# The residuals for the MA(1) model are not white noise.
# 
# The residuals for the ARMA(1, 1) model appear to be Gaussian white noise.   <- answer
# 
# It is not a good idea to look at the residual analysis because it might tell you if your model is incorrect and you might have to stay late at work to figure out the correct model.



# Exercise
# ARMA get in
# By now you have gained considerable experience fitting ARMA models to data, but before you start celebrating, try one more exercise (sort of) on your own.
# 
# The data in oil are crude oil, WTI spot price FOB (in dollars per barrel), weekly data from 2000 to 2008. Use your skills to fit an ARMA model to the returns. The weekly crude oil prices (oil) are plotted for you. Throughout the exercise, work with the returns, which you will calculate.
# 
# As before, the astsa package is preloaded for you. The data are preloaded as oil and plotted on the right.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Calculate the approximate crude oil price returns using diff() and log(). Put the returns in oil_returns.
# Plot oil_returns and notice that there are a couple of outliers prior to 2004. Convince yourself that the returns are stationary.
# Plot the sample ACF and PACF of the oil_returns using acf2() from the astsa package.
# From the P/ACF pair, it is apparent that the correlations are small and the returns are nearly noise. But it could be that both the ACF and PACF are tailing off. If this is the case, then an ARMA(1,1) is suggested. Fit this model to the oil returns using sarima(). Does the model fit well? Can you see the outliers in the residual plot?

# Calculate approximate oil returns
oil_returns <- diff(log(oil))

# Plot oil_returns. Notice the outliers.
plot(oil_returns)

# Plot the P/ACF pair for oil_returns
acf2(oil_returns)

# Assuming both P/ACF are tailing, fit a model to oil_returns
sarima(oil_returns, 1, 0, 1)


