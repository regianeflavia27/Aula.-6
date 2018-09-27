> install.packages("readxl")
Installing package into 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/readxl_1.1.0.zip'
Content type 'application/zip' length 1498111 bytes (1.4 MB)
downloaded 1.4 MB

package 'readxl' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Renata\AppData\Local\Temp\Rtmp4iwSWY\downloaded_packages
> install.packages("ggplot2")
Installing package into 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/ggplot2_3.0.0.zip'
Content type 'application/zip' length 3580057 bytes (3.4 MB)
downloaded 3.4 MB

package 'ggplot2' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Renata\AppData\Local\Temp\Rtmp4iwSWY\downloaded_packages
> library(readxl)
> library(ggplot2)
> IPCA <- read_excel("c:/EconometriaA/IPCA.xls")
> IPCA <- IPCA[,-1]
> Inflacao <- ts(IPCA$IPCA, start = 2008-01, frequency = 12)
> View(Inflacao)
> autoplot(Inflacao, main="Índice de Preços ao Consumidor Amplo")
Error: Objects of type ts not supported by autoplot.
> Resumo_Estatístico <- summary(Inflacao)
> Resumo_Estatístico
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.4166  0.2124  0.3794  0.4413  0.6315  1.6215 
> acf(IPCA)
> pacf(IPCA)
> AR1 <- arima(Inflacao, order = c(1,0,0))
> AR1

Call:
  arima(x = Inflacao, order = c(1, 0, 0))

Coefficients:
  ar1  intercept
0.4648     0.4404
s.e.  0.0781     0.0513

sigma^2 estimated as 0.09696:  log likelihood = -32.15,  aic = 70.3
> MA3 <- arima(Inflacao,order=c(0,0,3))
> MA3

Call:
  arima(x = Inflacao, order = c(0, 0, 3))

Coefficients:
  ma1     ma2     ma3  intercept
0.4439  0.1985  0.2245     0.4412
s.e.  0.0888  0.0922  0.0774     0.0504

sigma^2 estimated as 0.09388:  log likelihood = -30.15,  aic = 70.3
> ARMA13 <- arima(Inflacao,order = c(1,0,3))
> ARMA13

Call:
  arima(x = Inflacao, order = c(1, 0, 3))

Coefficients:
  ar1     ma1     ma2     ma3  intercept
0.2928  0.1556  0.0678  0.2038     0.4408
s.e.  0.4129  0.4125  0.2005  0.0931     0.0544

sigma^2 estimated as 0.09365:  log likelihood = -30,  aic = 72
> Box.test(ARMA13$residuals,lag = 3, type = "Ljung")

Box-Ljung test

data:  ARMA13$residuals
X-squared = 0.026171, df = 3, p-value = 0.9989

> TesteJB13 <- Box.test(ARMA13$residuals,lag = 3, type = "Ljung")
> TesteJB
Error: object 'TesteJB' not found
> MA1 <- arima(Inflacao,order = c(0,0,1))
> MA2 <- arima(Inflacao,order = c(0,0,2))
> MA3 <- arima(Inflacao,orde
               + MA3 <- arima(Inflacao,order = c(0,0,3))
               Error: unexpected symbol in:
                 "MA3 <- arima(Inflacao,orde
               MA3"
               > TesteJB1 <- Box.test(MA1$residuals,lag = 3, type = "Ljung")
               > TesteJB1
               
               Box-Ljung test
               
               data:  MA1$residuals
               X-squared = 9.3392, df = 3, p-value = 0.02511
               
               > TesteJB2 <- Box.test(MA2$residuals,lag = 3, type = "Ljung")
               > TesteJB2
               
               Box-Ljung test
               
               data:  MA2$residuals
               X-squared = 7.9761, df = 3, p-value = 0.04651
               
               > TesteJB3 <- Box.test(MA3$residuals,lag = 3, type = "Ljung")
               > TesteJB3
               
               Box-Ljung test
               
               data:  MA3$residuals
               X-squared = 0.23527, df = 3, p-value = 0.9717
               
               > P_Valores <- c(TesteJB1$p.value,TesteJB2$p.value,TesteJB3$p.value)
               > Modelos <- c("MA1","MA2","MA3")
               > Resultados <- data.frame(Modelos,P_Valores)
               > View(Resultados)
               > save.image("C:/EconometriaA/AULA 6/Comandos.RData")